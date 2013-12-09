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
    
    NSString *key = @"Country";
    NSString *value = @"Brasil";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    self.lbAESKey.text = [defaults aesKey];
    self.lbKey.text = key;
    self.lbValue.text = value;
    
    [defaults encryptValue:value withKey:key];
    [defaults decryptedValueForKey:key];
}

@end