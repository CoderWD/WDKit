//
//  NSString+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "NSString+WDKit.h"
#import "NSData+WDKit.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSString (WDKit)

/**
 *  判断身份证号码是否正确
 *
 *  @return <#return value description#>
 */
-(BOOL)validateIDCardNumber{
    NSString  *value = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSInteger length = 0;
    if (!value) {
        return NO;
    }else {
        length = value.length;
        if (length !=15 && length !=18) {
            return NO;
        }
    }
    // 省份代码
    NSArray *areasArray = @[@"11",@"12", @"13",@"14", @"15",@"21", @"22",@"23", @"31",@"32", @"33",@"34", @"35",@"36", @"37",@"41", @"42",@"43", @"44",@"45", @"46",@"50", @"51",@"52", @"53",@"54", @"61",@"62", @"63",@"64", @"65",@"71", @"81",@"82", @"91"];
    
    NSString *valueStart2 = [value substringToIndex:2];
    BOOL areaFlag =NO;
    for (NSString *areaCode in areasArray) {
        if ([areaCode isEqualToString:valueStart2]) {
            areaFlag =YES;
            break;
        }
    }
    
    if (!areaFlag) {
        return false;
    }
    
    NSRegularExpression *regularExpression;
    NSUInteger numberofMatch;
    
    int year =0;
    switch (length) {
        case 15:
            year = [value substringWithRange:NSMakeRange(6,2)].intValue +1900;
            
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc] initWithPattern:@"^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$"
                                                                         options:NSRegularExpressionCaseInsensitive
                                                                           error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            regularExpression = nil;
            
            if(numberofMatch >0) {
                return YES;
            }else {
                return NO;
            }
        case 18:
            
            year = [value substringWithRange:NSMakeRange(6,4)].intValue;
            if (year %4 ==0 || (year %100 ==0 && year %4 ==0)) {
                
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }else {
                regularExpression = [[NSRegularExpression alloc]initWithPattern:@"^[1-9][0-9]{5}19[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$"
                                                                        options:NSRegularExpressionCaseInsensitive
                                                                          error:nil];//测试出生日期的合法性
            }
            numberofMatch = [regularExpression numberOfMatchesInString:value
                                                               options:NSMatchingReportProgress
                                                                 range:NSMakeRange(0, value.length)];
            regularExpression = nil;
            
            if(numberofMatch >0) {
                int S = ([value substringWithRange:NSMakeRange(0,1)].intValue + [value substringWithRange:NSMakeRange(10,1)].intValue) *7 + ([value substringWithRange:NSMakeRange(1,1)].intValue + [value substringWithRange:NSMakeRange(11,1)].intValue) *9 + ([value substringWithRange:NSMakeRange(2,1)].intValue + [value substringWithRange:NSMakeRange(12,1)].intValue) *10 + ([value substringWithRange:NSMakeRange(3,1)].intValue + [value substringWithRange:NSMakeRange(13,1)].intValue) *5 + ([value substringWithRange:NSMakeRange(4,1)].intValue + [value substringWithRange:NSMakeRange(14,1)].intValue) *8 + ([value substringWithRange:NSMakeRange(5,1)].intValue + [value substringWithRange:NSMakeRange(15,1)].intValue) *4 + ([value substringWithRange:NSMakeRange(6,1)].intValue + [value substringWithRange:NSMakeRange(16,1)].intValue) *2 + [value substringWithRange:NSMakeRange(7,1)].intValue *1 + [value substringWithRange:NSMakeRange(8,1)].intValue *6 + [value substringWithRange:NSMakeRange(9,1)].intValue *3;
                int Y = S %11;
                NSString *M =@"F";
                NSString *JYM =@"10X98765432";
                M = [JYM substringWithRange:NSMakeRange(Y,1)];// 判断校验位
                if ([M isEqualToString:[value substringWithRange:NSMakeRange(17,1)]]) {
                    return YES;// 检测ID的校验位
                }else {
                    return NO;
                }
                
            }else {
                return NO;
            }
        default:
            return false;
    }
}

/**
 *  判断是否为手机号码
 *
 *  @return <#return value description#>
 */
-(BOOL)validatePhoneNumber{
    NSString * MOBILE = @"^1(3[0-9]|4[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[2378])\\d)\\d{7}$";
    
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    
    NSString * CT = @"^1((33|53|77|8[019])[0-9]|349)\\d{7}$";
    
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    BOOL res1 = [regextestmobile evaluateWithObject:self];
    BOOL res2 = [regextestcm evaluateWithObject:self];
    BOOL res3 = [regextestcu evaluateWithObject:self];
    BOOL res4 = [regextestct evaluateWithObject:self];
    BOOL res5 = [regextestphs evaluateWithObject:self];
    
    if (res1 || res2 || res3 || res4 ||res5) {
        return YES;
    }else{
        return NO;
    }
}
/**
 *  简单的11位手机号码校验
 *
 *  @return <#return value description#>
 */

-(BOOL)simpleValidatePhone{
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", @"^\\d{11}$"];
    if ([regextestmobile evaluateWithObject:self]) {
        return YES;
    }
    return NO;
}
/**
 *  身份证号
 *
 *  @return <#return value description#>
 */
-(BOOL) validateIdentityCard{
    BOOL flag;
    if (self.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:self];
}

/**
 *  车牌号验证
 *
 *  @return <#return value description#>
 */
-(BOOL) validateCarNo{
    NSString *carRegex = @"^[\u4e00-\u9fa5]{1}[a-zA-Z]{1}[a-zA-Z_0-9]{4}[a-zA-Z_0-9_\u4e00-\u9fa5]$";
    NSPredicate *carTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",carRegex];
    return [carTest evaluateWithObject:self];
}

/**
 *  邮箱
 *
 *  @return <#return value description#>
 */
-(BOOL) validateEmail{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}
/**
 *  字符串去首位空格
 *
 *  @return <#return value description#>
 */
-(NSString*)trim{
    NSString *tmp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    return [tmp stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)encodeURL{
    return (NSString*) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)self, NULL,(CFStringRef)@"!*'();:@&=+$,/?%#[]", kCFStringEncodingUTF8 ));
}

//SHA1加密
-(NSString*)sha1{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}


/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlEncode{
    return (NSString *) CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                                                  (CFStringRef)self,
                                                                                  NULL,
                                                                                  (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                  kCFStringEncodingUTF8));
}
/**
 *  url解码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlDecode{
    return (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

/**
 *  md5
 *
 *  @return <#return value description#>
 */
-(NSString*)md5{
    const char *cStr = [self UTF8String];
    unsigned char result[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), result );
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
            ];
}

/**
 DES+Base64加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desEncryptWithKey:(NSString*)key{
    return [self encrypt:self encryptOrDecrypt:kCCEncrypt key:key];
}

/**
 DES+Base64解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desDecryptWithKey:(NSString*)key{
    //kCCDecrypt 解密
    return [self encrypt:self encryptOrDecrypt:kCCDecrypt key:key];
}

/**
 *  DES+Base64加密解密中间方法
 *
 *  @param sText            <#sText description#>
 *  @param encryptOperation <#encryptOperation description#>
 *  @param key              <#key description#>
 *
 *  @return <#return value description#>
 */
- (NSString *)encrypt:(NSString *)sText encryptOrDecrypt:(CCOperation)encryptOperation key:(NSString *)key{
    const void *vplainText;
    size_t plainTextBufferSize;
    NSData *data = [sText dataUsingEncoding:NSUTF8StringEncoding];
    if (encryptOperation == kCCDecrypt){//解密
        NSData *encryptData = [[NSData alloc] initWithBase64EncodedData:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
        plainTextBufferSize = [encryptData length];
        vplainText = [encryptData bytes];
    }else{//加密
        plainTextBufferSize = [data length];
        vplainText = (const void *)[data bytes];
    }
    
    CCCryptorStatus ccStatus;
    uint8_t *bufferPtr = NULL;
    size_t bufferPtrSize = 0;
    size_t movedBytes = 0;
    
    bufferPtrSize = (plainTextBufferSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    bufferPtr = malloc( bufferPtrSize * sizeof(uint8_t));
    memset((void *)bufferPtr, 0x0, bufferPtrSize);
    // memset((void *) iv, 0x0, (size_t) sizeof(iv));
    
    // const void *vkey = (const void *)[DESKEY UTF8String];
    const void *vkey = (const void *)[[key dataUsingEncoding:NSUTF8StringEncoding] bytes];
    // NSString *initVec = @"init Vec";
    //const void *vinitVec = (const void *) [initVec UTF8String];
    //  Byte iv[] = {0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF};
    ccStatus = CCCrypt(encryptOperation,
                       kCCAlgorithm3DES,
                       kCCOptionPKCS7Padding | kCCOptionECBMode,
                       vkey,
                       kCCKeySize3DES,
                       nil,
                       vplainText,
                       plainTextBufferSize,
                       (void *)bufferPtr,
                       bufferPtrSize,
                       &movedBytes);
    NSString *result;
    
    if (encryptOperation == kCCDecrypt){
        result = [[NSString alloc] initWithData:[NSData dataWithBytes:(const void *)bufferPtr
                                                               length:(NSUInteger)movedBytes]
                                       encoding:NSUTF8StringEncoding];
    }else{
        NSData *myData = [NSData dataWithBytes:(const void *)bufferPtr length:(NSUInteger)movedBytes];
        return [myData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    }
    
    return result;
}

/**
 AES加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesEncryptWitKey:(NSString*)key{
    NSData *data = [[self dataUsingEncoding:NSUTF8StringEncoding] aes256_encrypt:key];
    NSString *aesEncryp = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return aesEncryp;
}


/**
  AES解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesDecryptWitKey:(NSString*)key{
    return [[NSString alloc] initWithData:[[self dataUsingEncoding:NSUTF8StringEncoding] aes256_encrypt:key] encoding:NSUTF8StringEncoding];
}
/**
 *  base64编码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Encoding{
    return [[self dataUsingEncoding:NSUTF8StringEncoding] base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
}

/**
 *  base64解码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Decodeing{
    NSString *string =  [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:NSDataBase64DecodingIgnoreUnknownCharacters] encoding:NSUTF8StringEncoding];
    string = [string stringByReplacingOccurrencesOfString:@"\n" withString:@""];
    string = [string stringByReplacingOccurrencesOfString:@"\r" withString:@""];
    return string;
}

@end
