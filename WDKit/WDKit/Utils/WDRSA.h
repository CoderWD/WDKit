//
//  WDRSA.h
//  WDKit
//
//  Created by 何伟东 on 2016/11/17.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WDRSA : NSObject


// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
// enc with private key NOT working YET!
//+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
//+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)

/**
 *  公钥解密 String
 *
 *  @param str    待解密字符串
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  公钥解密NSData
 *
 *  @param data   待解密Data
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
/**
 *  私钥解密 String
 *
 *  @param str     待解密字符串
 *  @param privKey 私钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

/**
 私钥解密 NSData

 @param data 待解密Data
 @param privKey 私钥
 @return <#return value description#>
 */
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;

@end
