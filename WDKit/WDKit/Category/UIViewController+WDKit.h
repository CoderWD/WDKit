//
//  UIViewController+WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2017/6/23.
//  Copyright © 2017年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NavPositionLeft,
    NavPositionRgit,
} WDNavPosition;

@interface UIViewController (WDKit)

/**
 创建左右导航按钮
 
 @param position 位置
 @param title 标题
 @param iconName icon图片名
 */
-(void)creatNavButtonItemWithPosition:(WDNavPosition)position title:(NSString*)title iconName:(NSString*)iconName;

/**
 左导航按钮
 
 @return <#return value description#>
 */
-(UIButton*)leftNavButton;


/**
 右导航按钮
 
 @return <#return value description#>
 */
-(UIButton*)rightNavButton;

@end
