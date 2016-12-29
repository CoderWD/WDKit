//
//  WDUtils.h
//  WDKit
//
//  Created by 何伟东 on 2016/11/24.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WDUtils : NSObject

/**
 计算文字宽度
 
 @param text <#text description#>
 @param font <#font description#>
 @param height <#height description#>
 @return <#return value description#>
 */
+(CGFloat)textWidth:(NSString*)text font:(UIFont*)font height:(CGFloat)height;

/**
 计算文字高度
 
 @param text <#text description#>
 @param font <#font description#>
 @param width <#width description#>
 @return <#return value description#>
 */
+(CGFloat)textHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width;


/**
 归档
 
 @param object <#object description#>
 @param name <#fileName description#>
 @return <#return value description#>
 */
+(BOOL)wd_archiveWithObject:(id)object fileName:(NSString*)name;

/**
 解档
 
 @param name <#name description#>
 @return <#return value description#>
 */
+(id)wd_unArchiveWithFileName:(NSString*)name;

/**
 删除归档文件
 
 @param name <#name description#>
 @return <#return value description#>
 */
+(BOOL)wd_deleteArchiveWithFileName:(NSString*)name;

@end
