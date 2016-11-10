//
//  UIButton+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/11/1.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "UIButton+WDKit.h"
#import "UIImage+WDKit.h"

@implementation UIButton (WDKit)

/**
 设置Normal下的背景图片
 @param image 图片
 */
-(void)setNormalBackgroundImage:(UIImage*)image{
    [self setBackgroundImage:image forState:UIControlStateNormal];
}

/**
 设置hlighted]下的背景图片
 @param image 图片
 */
-(void)setHighlightedBackgroundImage:(UIImage*)image{
    [self setBackgroundImage:image forState:UIControlStateHighlighted];
}

/**
 设置Selected下的背景图片
 @param image 图片
 */
-(void)setSelectedBackgroundImage:(UIImage*)image{
    [self setBackgroundImage:image forState:UIControlStateSelected];
}

/**
 设置Normal下的背景图片
 @param name 图片名
 */
-(void)setNormalBackgroundImageName:(NSString*)name{
    [self setBackgroundImage:WDNameImage(name) forState:UIControlStateNormal];
}

/**
 设置Highlighted下的背景图片
 @param name 图片名
 */
-(void)setHighlightedBackgroundImageName:(NSString*)name{
    [self setBackgroundImage:WDNameImage(name) forState:UIControlStateHighlighted];
}

/**
 设置Selected下的背景图片
 @param name 图片名
 */
-(void)setSelectedBackgroundImageName:(NSString*)name{
    [self setBackgroundImage:WDNameImage(name) forState:UIControlStateSelected];
}

/**
 设置Normal下的Title

 @param title <#title description#>
 */
-(void)setNormalTitle:(NSString*)title{
    [self setTitle:title forState:UIControlStateNormal];
}

/**
 设置Highlighted下的Title
 
 @param title <#title description#>
 */
-(void)setHighlightedTitle:(NSString*)title{
    [self setTitle:title forState:UIControlStateHighlighted];
}

/**
 设置Selected下的Title
 
 @param title <#title description#>
 */
-(void)setSelectedTitle:(NSString*)title{
    [self setTitle:title forState:UIControlStateSelected];
}

/**
 创建便捷的通用点击事件

 @param block <#block description#>
 */
-(void)handleEventTouchUpInsideWithBlock:(void (^)(id sender))block{
    //[self bk_addEventHandler:block forControlEvents:UIControlEventTouchUpInside];
}

@end
