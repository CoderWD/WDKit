//
//  UIImage+WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2016/11/1.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>

//便捷创建UIImage
#define WDNameImage(name) [UIImage imageNamed:name]

@interface UIImage (WDKit)

/**
 *  传入图片放缓一个像素大小的UIImage图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+(UIImage*)imageWithColor:(UIColor*)color;

/**
 压缩图片至目标尺寸
 
 @param sourceImage sourceImage 源图片
 @param targetWidt 图片最终尺寸的宽
 @return 返回按照源图片的宽、高比例压缩至目标宽、高的图片
 */
+(UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidt;

/**
 生成高斯模糊UIImage
 
 @param image 原始图片
 @param blur 0.0~1.0f强度
 @return <#return value description#>
 */
+(UIImage *)blurImage:(UIImage *)image withBlur:(CGFloat)blur;

@end
