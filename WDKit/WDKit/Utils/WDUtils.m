//
//  WDUtils.m
//  WDKit
//
//  Created by 何伟东 on 2016/11/24.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "WDUtils.h"
#import "WDKit.h"

@implementation WDUtils



/**
 计算文字宽度

 @param text <#text description#>
 @param font <#font description#>
 @param height <#height description#>
 @return <#return value description#>
 */
+(CGFloat)textWidth:(NSString*)text font:(UIFont*)font height:(CGFloat)height{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                                   context:nil].size.width;
}


/**
 计算文字高度

 @param text <#text description#>
 @param font <#font description#>
 @param width <#width description#>
 @return <#return value description#>
 */
+(CGFloat)textHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width{
    NSDictionary *attribute = @{NSFontAttributeName: font};
    return [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                              context:nil].size.height;
}

/**
 判断创建归档文件夹

 @return <#return value description#>
 */
    +(NSString*)judgeCreateWDArchiveFolder{
    NSString *filePath = [DOCUMENT_PATH stringByAppendingString:@"/WDArchive"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            DLog(@"create WDArchiveFolder failure. info:%@",error.userInfo);
        }
    }
    return filePath;
}

/**
 归档

 @param object <#object description#>
 @param name <#fileName description#>
 @return <#return value description#>
 */
+(BOOL)wd_archiveWithObject:(id)object fileName:(NSString*)name{
    NSString *filePath = [[WDUtils judgeCreateWDArchiveFolder] stringByAppendingPathComponent:name];
    return [NSKeyedArchiver archiveRootObject:object toFile:filePath];
}

/**
 解档

 @param name <#name description#>
 @return <#return value description#>
 */
+(id)wd_unArchiveWithFileName:(NSString*)name{
    NSString *filePath = [[WDUtils judgeCreateWDArchiveFolder] stringByAppendingPathComponent:name];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
}

/**
 删除归档文件

 @param name <#name description#>
 @return <#return value description#>
 */
+(BOOL)wd_deleteArchiveWithFileName:(NSString*)name{
    NSString *filePath = [[WDUtils judgeCreateWDArchiveFolder] stringByAppendingPathComponent:name];
    NSError *error;
    BOOL flag = [[NSFileManager defaultManager] removeItemAtPath:filePath error:&error];
    if (error) {
        DLog(@"delete WDArchive file failure. info:%@",error.userInfo);
    }
    return flag;
}

@end
