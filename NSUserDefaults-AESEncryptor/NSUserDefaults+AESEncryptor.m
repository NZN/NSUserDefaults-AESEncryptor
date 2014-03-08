//
//  NSUserDefaults+AESEncryptor.m
//  NSUserDefaults-AESEncryptor
//
//  Created by Bruno Tortato Furtado on 08/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NSUserDefaults+AESEncryptor.h"
#import "CocoaSecurity.h"

static NSString * AESKeyString = @"aes key not found";

@implementation NSUserDefaults (AESEncryptor)

#pragma mark -
#pragma mark - Public methods

- (NSString *)decryptedValueForKey:(NSString *)key
{
    NSString *encryptedKey = [CocoaSecurity aesEncrypt:key
                                                   key:[self AESKey]].base64;
    
    NSString *encryptedValue = [self objectForKey:encryptedKey];
    
    if (!encryptedValue) {
        NSLog(@"%s\n\nkey '%@' not found \n\n", __PRETTY_FUNCTION__, key);
        return nil;
    }
    
    
    NSString *value = [CocoaSecurity aesDecryptWithBase64:encryptedValue
                                                      key:[self AESKey]].utf8String;
    
#ifdef DEBUG
    NSLog(@"%s\n\n \
          aesKey: [%@]\n\n \
          [encrypt_key, encrypt_value]: [%@, %@] \n\n \
          [key, value]: [%@, %@] \n\n",
          __PRETTY_FUNCTION__,
          [self AESKey],
          encryptedKey, encryptedValue,
          key, value);
#endif
    
    return value;
}

- (void)encryptValue:(NSString *)value withKey:(NSString *)key
{
    NSString *encryptedKey = [CocoaSecurity aesEncrypt:key
                                                   key:[self AESKey]].base64;
    
    NSString *encryptedValue = [CocoaSecurity aesEncrypt:value
                                                     key:[self AESKey]].base64;
    
    [self setObject:encryptedValue forKey:encryptedKey];
    [self synchronize];
    
#ifdef DEBUG
    NSLog(@"%s\n\n \
          aesKey: [%@]\n\n \
          [key, value]: [%@, %@] \n\n \
          [encrypt_key, encrypt_value]: [%@, %@] \n\n",
          __PRETTY_FUNCTION__,
          [self AESKey],
          key, value,
          encryptedKey, encryptedValue);
#endif
}

- (void)removeObjectForAESKey:(NSString *)key
{
    NSString *encryptedKey = [CocoaSecurity aesEncrypt:key key:[self AESKey]].base64;
    [self removeObjectForKey:encryptedKey];
    [self synchronize];
}

- (void)setAESKey:(NSString *)key
{
    AESKeyString = key;
}

- (NSString *)AESKey
{
    return AESKeyString;
}

@end