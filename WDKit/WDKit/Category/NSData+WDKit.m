//
//  NSData+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "NSData+WDKit.h"
#import "NSString+WDKit.h"
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@implementation NSData (WDKit)

/**
 *  aes265加密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (NSData *)aes256_encrypt:(NSString *)key{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
    }
    free(buffer);
    return nil;
}

/**
 *  aes265 解密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (NSData *)aes256_decrypt:(NSString *)key{
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [self bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        return [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        
    }
    free(buffer);
    return nil;
}
/**
 *  des加密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
-(NSData*)desEncryptWithKey:(NSString*)key{
    return [[[[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding] desEncryptWithKey:key] dataUsingEncoding:NSUTF8StringEncoding];
}

/**
 *  des解密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
-(NSData*)desDecrypttWithKey:(NSString*)key{
    return [[[[NSString alloc] initWithData:self encoding:NSUTF8StringEncoding] desDecryptWithKey:key] dataUsingEncoding:NSUTF8StringEncoding];
}


/**
 *  转16进制字符串
 *
 *  @return <#return value description#>
 */
- (NSString*)encryptHex {
    Byte *bytes = (Byte *)[self bytes];
    //下面是Byte 转换为16进制。
    NSString *hexStr = @"";
    for(int i = 0; i < [self length]; i++){
        NSString *newHexStr = [NSString stringWithFormat:@"%x", bytes[i]&0xff];///16进制数
        if([newHexStr length] == 1){
            hexStr = [NSString stringWithFormat:@"%@0%@", hexStr, newHexStr];
        }else{
            hexStr = [NSString stringWithFormat:@"%@%@", hexStr, newHexStr];
        }
    }
    return hexStr;
}

@end
