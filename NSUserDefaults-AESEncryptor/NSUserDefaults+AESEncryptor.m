//
//  NSUserDefaults+AESEncryptor.m
//  NSUserDefaults-AESEncryptor
//
//  Created by Bruno Tortato Furtado on 08/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NSUserDefaults+AESEncryptor.h"
#import "CocoaSecurity.h"

static NSString *const kAESKeyString = @"aes key not found";

@implementation NSUserDefaults (AESEncryptor)

#pragma mark -
#pragma mark - Public methods

- (NSString *)aesKey
{
    NSString *aesKey = kAESKeyString;
    
#ifdef NZUSERDEFAULTS_KEY
    aesKey = @NZUSERDEFAULTS_KEY;
#endif
    
    return aesKey;
}

- (NSString *)decryptedValueForKey:(NSString *)key
{
    NSString *encryptedKey = [CocoaSecurity aesEncrypt:key
                                                   key:[self aesKey]].base64;
    
    NSString *encryptedValue = [self objectForKey:encryptedKey];
    
    if (!encryptedValue)
        return nil;
    
    NSString *value = [CocoaSecurity aesDecryptWithBase64:encryptedValue
                                                      key:[self aesKey]].utf8String;
    
#ifdef NZDEBUG
    NSLog(@"%s\n \
          aesKey = %@\n \
          %@ = %@ \n \
          %@ = %@ \n",
          __PRETTY_FUNCTION__,
          [self aesKey],
          encryptedKey, encryptedValue,
          key, value);
#endif
    
    return value;
}

- (void)encryptValue:(NSString *)value withKey:(NSString *)key
{
    NSString *encryptedKey = [CocoaSecurity aesEncrypt:key
                                                   key:[self aesKey]].base64;
    
    NSString *encryptedValue = [CocoaSecurity aesEncrypt:value
                                                     key:[self aesKey]].base64;
    
    [self setObject:encryptedValue forKey:encryptedKey];
    [self synchronize];
    
#ifdef NZDEBUG
    NSLog(@"%s\n \
          aesKey = %@\n \
          %@ = %@ \n \
          %@ = %@ \n",
          __PRETTY_FUNCTION__,
          [self aesKey],
          key, value,
          encryptedKey, encryptedValue);
#endif
}

@end