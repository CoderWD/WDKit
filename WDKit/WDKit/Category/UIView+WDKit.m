//
//  UIView+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "UIView+WDKit.h"

@implementation UIView (WDKit)

/**
 视图坐标
 */
-(CGPoint)origin{
    return self.frame.origin;
}

/**
 设置origin

 @param origin <#origin description#>
 */
-(void)setOrigin:(CGPoint)origin{
    CGRect newframe = self.frame;
    newframe.origin = origin;
    self.frame = newframe;
}

/**
 视图大小
 */
-(CGSize)size{
    return self.frame.size;
}

/**
 设置视图大小

 @param size <#size description#>
 */
-(void)setSize:(CGSize)size{
    CGRect newframe = self.frame;
    newframe.size = size;
    self.frame = newframe;
}

/**
 x坐标
 */
-(CGFloat)left{
    return self.frame.origin.x;
}

/**
 设置x坐标

 @param left <#left description#>
 */
-(void)setLeft:(CGFloat)left{
    CGRect newframe = self.frame;
    newframe.origin.x = left;
    self.frame = newframe;
}
/**
 y坐标
 */
-(CGFloat)top{
    return self.frame.origin.y;
}

/**
 设置y坐标

 @param top <#top description#>
 */
-(void)setTop:(CGFloat)top{
    CGRect newframe = self.frame;
    newframe.origin.y = top;
    self.frame = newframe;
}

/**
 宽度
 */
-(CGFloat)width{
    return self.frame.size.width;
}

/**
 设置宽度

 @param width <#width description#>
 */
-(void)setWidth:(CGFloat)width{
    CGRect newframe = self.frame;
    newframe.size.width = width;
    self.frame = newframe;
}

/**
 高度
 */
-(CGFloat)height{
    return self.frame.size.height;
}

/**
 设置高度

 @param height <#height description#>
 */
-(void)setHeight:(CGFloat)height{
    CGRect newframe = self.frame;
    newframe.size.height = height;
    self.frame = newframe;
}

/**
 右边x坐标
 */
-(CGFloat)right{
    return self.frame.origin.x + self.frame.size.width;
}

/**
 设置右边x坐标

 @param right <#right description#>
 */
-(void)setRight:(CGFloat)right{
    CGRect newframe = self.frame;
    newframe.origin.x = right - newframe.size.width;
    self.frame = newframe;
}

/**
 底部y坐标
 */
-(CGFloat)bottom{
    return self.frame.origin.y + self.frame.size.height;
}

/**
 设置底部y坐标

 @param bottom <#bottom description#>
 */
-(void)setBottom:(CGFloat)bottom{
    CGRect newframe = self.frame;
    newframe.origin.y = bottom - newframe.size.height;
    self.frame = newframe;
}

/**
 中心x坐标
 */
-(CGFloat)centerX{
    return self.center.x;
}

/**
 设置中心x坐标

 @param centerX <#centerX description#>
 */
-(void)setCenterX:(CGFloat)centerX{
    CGPoint newCenter = self.center;
    newCenter.x = centerX;
    self.center = newCenter;
}

/**
 中心y坐标

 @return <#return value description#>
 */
-(CGFloat)centerY{
    return self.center.y;
}

/**
 设置中心y坐标

 @param centerY <#centerY description#>
 */
-(void)setCenterY:(CGFloat)centerY{
    CGPoint newCenter = self.center;
    newCenter.y = centerY;
    self.center = newCenter;
}

/**
 *  通过响应者链找到view的viewController
 *
 *  @return <#return value description#>
 */
-(UIViewController *)viewController{
    UIResponder *next = self.nextResponder;
    while (next != nil) {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = next.nextResponder;
    }
    return nil;
}

/**
 view截图
 
 @return <#return value description#>
 */
- (UIImage *)convertToImage{
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(self.width, self.height), NO, [UIScreen mainScreen].scale);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

/**
 设置边框
 
 @param width 宽度
 @param color 颜色
 */
- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color{
    self.layer.borderWidth = width;
    self.layer.borderColor = color.CGColor;
}

/**
 设置圆角
 
 @param cornerRadius 度数
 */
- (void)setCcornerRadius:(CGFloat)cornerRadius{
    self.layer.shouldRasterize = YES;
    self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    self.layer.cornerRadius = cornerRadius;
    self.layer.masksToBounds = YES;
}

@end
