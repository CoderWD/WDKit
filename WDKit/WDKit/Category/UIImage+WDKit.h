//
//  UIImage+WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2016/11/1.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>

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


@end
