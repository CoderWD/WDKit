//
//  NSString+WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (WDKit)


/**
 *  判断身份证号码是否正确
 *
 *  @return <#return value description#>
 */
-(BOOL)validateIDCardNumber;
/**
 *  判断是否为手机号码
 *
 *  @return <#return value description#>
 */
-(BOOL)validatePhoneNumber;
/**
 *  简单的11位手机号码校验
 *
 *  @return <#return value description#>
 */
-(BOOL)simpleValidatePhone;
/**
 *  判断是否为身份证
 *
 *  @return <#return value description#>
 */
-(BOOL) validateIdentityCard;
/**
 *  判断是否为车牌号
 *
 *  @return <#return value description#>
 */
-(BOOL) validateCarNo;
/**
 *  判断是否为邮箱
 *
 *  @return <#return value description#>
 */
-(BOOL) validateEmail;
/**
 *  字符串去首位空格
 *
 *  @return <#return value description#>
 */
-(NSString*)trim;
/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)encodeURL;
/**
 *  SHA1加密
 *
 *  @return <#return value description#>
 */
-(NSString*)sha1;

/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlEncode;
/**
 *  url解码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlDecode;
/**
 *  md5
 *
 *  @return <#return value description#>
 */
-(NSString*)md5;


/**
 DES+Base64加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desEncryptWithKey:(NSString*)key;

/**
 DES+Base64解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desDecryptWithKey:(NSString*)key;

/**
 AES加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesEncryptWitKey:(NSString*)key;

/**
 AES解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesDecryptWitKey:(NSString*)key;

/**
 *  base64编码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Encoding;
/**
 *  base64解码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Decodeing;

@end
