#NSUserDefaults-AESEncryptor

NSUserDefaults-AESEncryptor is a NSUserDefaults category. Its purpose to encrypt/decrypt keys and values with AES encryptor.

## Requirements

NSUserDefaults-AESEncryptor works on any iOS version and is compatible with both ARC and non-ARC projects. It depends on the following Apple frameworks, which should already be included with most Xcode templates:

* Foundation.framework

You will need LLVM 3.0 or later in order to build NSUserDefaults-AESEncryptor.

NSUserDefaults-AESEncryptor uses [CocoaSecurity](https://github.com/kelp404/CocoaSecurity) to encrypt/decrypt.

## Adding NSUserDefaults-AESEncryptor to your project

### Cocoapods

[CocoaPods](http://cocoapods.org) is the recommended way to add NSUserDefaults-AESEncryptor to your project.

* Add a pod entry for NSUserDefaults-AESEncryptor to your Podfile `pod 'NSUserDefaults-AESEncryptor', '~> 0.0.1'`
* Install the pod(s) by running `pod install`.

### Source files

Alternatively you can directly add source files to your project.

1. Download the [latest code version](https://github.com/NZN/NSUserDefaults-AESEncryptor/archive/master.zip) or add the repository as a git submodule to your git-tracked project.
2. Open your project in Xcode, then drag and drop all files at NSUserDefaults-AESEncryptor folder onto your project (use the "Product Navigator view"). Make sure to select Copy items when asked if you extracted the code archive outside of your project.
2. Install [CocoaSecurity](https://github.com/kelp404/CocoaSecurity).

## Usage

* Define `NZUSERDEFAULTS_KEY` with a value at `Prefix.pch` in your project to use a custom AES key.

* Import `NSUserDefaults+AESEncryptor.h` and add this to `Prefix.pch`

* Encrypt

```objective-c
[[NSUserDefaults standardUserDefaults] encryptValue:@"Brazil" withKey:@"country"];
```

* Decrypt

```objective-c
NSString value = [[NSUserDefaults standardUserDefaults] decryptedValueForKey:@"country"];
```

## License

This code is distributed under the terms and conditions of the [MIT license](LICENSE).

## Change-log

A brief summary of each NSUserDefaults-AESEncryptor release can be found on the [wiki](https://github.com/NZN/NSUserDefaults-AESEncryptor/wiki/Change-log).