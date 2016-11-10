//
//  UIImageView+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/11/1.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "UIImageView+WDKit.h"
#import "UIImage+WDKit.h"
@implementation UIImageView (WDKit)


/**
 设置图片

 @param name 图片名
 */
-(void)setImageWithName:(NSString*)name{
    [self setImage:WDNameImage(name)];
}

@end
