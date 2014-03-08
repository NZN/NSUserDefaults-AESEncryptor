//
//  NZViewController.m
//  NSUserDefaults-AESEncryptor
//
//  Created by Bruno Tortato Furtado on 08/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "NZViewController.h"
#import "NSUserDefaults+AESEncryptor.h"

@interface NZViewController ()

@property (strong, nonatomic) IBOutlet UILabel *lbAESKey;
@property (strong, nonatomic) IBOutlet UILabel *lbKey;
@property (strong, nonatomic) IBOutlet UILabel *lbValue;

@end



@implementation NZViewController

#pragma mark -
#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // define value and key
    NSString *key = @"Country";
    NSString *value = @"Brasil";
   
    // set AES Key for base64 encrypt
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setAESKey:@"World Cup 2014"];
    
    // show key and values before encrypt
    self.lbAESKey.text = [defaults AESKey];
    self.lbKey.text = key;
    self.lbValue.text = value;
    
    // encrypt and decrypt for example
    [defaults encryptValue:value withKey:key];
    [defaults decryptedValueForKey:key];
    
    // remove value and check if is null
    [defaults removeObjectForAESKey:key];
    [defaults decryptedValueForKey:key];
}

@end