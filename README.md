#NSUserDefaults-AESEncryptor ![License MIT](https://go-shields.herokuapp.com/license-MIT-blue.png)

NSUserDefaults-AESEncryptor is a NSUserDefaults category. Its purpose to encrypt/decrypt keys and values with AES encryptor.

[![Build Status](https://api.travis-ci.org/NZN/NSUserDefaults-AESEncryptor.png)](https://api.travis-ci.org/NZN/NSUserDefaults-AESEncryptor.png)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/v/NSUserDefaults-AESEncryptor/badge.png)](http://beta.cocoapods.org/?q=name%3Ansuserdefaults%20name%3Aaesencryptor%2A)
[![Cocoapods](https://cocoapod-badges.herokuapp.com/p/NSUserDefaults-AESEncryptor/badge.png)](http://beta.cocoapods.org/?q=name%3Ansuserdefaults%20name%3Aaesencryptor%2A)

## Requirements

NSUserDefaults-AESEncryptor works on iOS 5.0+ version and is compatible with ARC projects. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework

You will need LLVM 3.0 or later in order to build NSUserDefaults-AESEncryptor.

NSUserDefaults-AESEncryptor uses [CocoaSecurity](https://github.com/kelp404/CocoaSecurity) to encrypt/decrypt.

## Adding NSUserDefaults-AESEncryptor to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add `NSUserDefaults-AESEncryptor` to your project.

* Add a pod entry for NSUserDefaults-AESEncryptor to your Podfile `pod 'NSUserDefaults-AESEncryptor'`
* Install the pod(s) by running `pod install`.

### Source files

Alternatively you can directly add source files to your project.

1. Download the [latest code version](https://github.com/NZN/NSUserDefaults-AESEncryptor/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop all files at NSUserDefaults-AESEncryptor folder onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
2. Install [CocoaSecurity](https://github.com/kelp404/CocoaSecurity).

## Usage

* Import `NSUserDefaults+AESEncryptor.h` and add this to `Prefix.pch`

```objective-c
// Set a key. (If no key is set, a default key will be used)
[[NSUserDefaults standardUserDefaults] setAESKey:@"World Cup 2014"];

// Encrypt
[[NSUserDefaults standardUserDefaults] encryptValue:@"Brazil" withKey:@"country"];

// Decrypt
NSString value = [[NSUserDefaults standardUserDefaults] decryptedValueForKey:@"country"];

// Remove object
[[NSUserDefaults standardUserDefaults] removeObjectForAESKey:@"country"];
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each NSUserDefaults-AESEncryptor release can be found on the [wiki](https://github.com/NZN/NSUserDefaults-AESEncryptor/wiki/Change-log).
