//
//  UIView+WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (WDKit)


/**
 视图坐标
 */
@property CGPoint origin;

/**
 视图大小
 */
@property CGSize size;

/**
 y坐标
 */
@property (nonatomic) CGFloat left;

/**
 x坐标
 */
@property (nonatomic) CGFloat top;


/**
 宽度
 */
@property CGFloat width;

/**
 高度
 */
@property CGFloat height;

/**
 右边x坐标
 */
@property CGFloat right;

/**
 底部y坐标
 */
@property CGFloat bottom;

/**
 中心x坐标
 */
@property (nonatomic) CGFloat centerX;

/**
 中心y坐标
 */
@property (nonatomic) CGFloat centerY;

/**
 *  通过响应者链找到view的viewController
 *
 *  @return <#return value description#>
 */
-(UIViewController *)viewController;


/**
 view截图

 @return <#return value description#>
 */
- (UIImage *)convertToImage;

/**
 设置边框

 @param width 宽度
 @param color 颜色
 */
- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color;

/**
 设置圆角

 @param cornerRadius 度数
 */
- (void)setCcornerRadius:(CGFloat)cornerRadius;

@end
