//
//  UIViewController+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2017/6/23.
//  Copyright © 2017年 何伟东. All rights reserved.
//

#import "UIViewController+WDKit.h"
#import "WDKit.h"

@implementation UIViewController (WDKit)


/**
 创建左右导航按钮
 
 @param position 位置
 @param title 标题
 @param iconName icon图片名
 */
-(void)creatNavButtonItemWithPosition:(WDNavPosition)position title:(NSString*)title iconName:(NSString*)iconName{
    UIButton *navButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    if (position == NavPositionLeft) {
        [navButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
    }else if(position == NavPositionRgit){
        [navButton setContentHorizontalAlignment:UIControlContentHorizontalAlignmentRight];
    }
    [navButton setImage:WDNameImage(iconName) forState:UIControlStateNormal];
    [navButton setNormalTitle:title];
    UIBarButtonItem *navBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:navButton];
    
    NSMutableArray *items = nil;
    if (position == NavPositionLeft) {
        items = [NSMutableArray arrayWithArray:self.navigationItem.leftBarButtonItems];
    }else if(position == NavPositionRgit){
        items = [NSMutableArray arrayWithArray:self.navigationItem.rightBarButtonItems];
    }
    [items addObject:navBarButtonItem];
    if (position == NavPositionLeft) {
        [self.navigationItem setLeftBarButtonItems:items];
    }else if(position == NavPositionRgit){
        [self.navigationItem setRightBarButtonItems:items];
    }
}

/**
 左导航按钮
 
 @return <#return value description#>
 */
-(UIButton*)leftNavButton{
    if (self.navigationItem.leftBarButtonItem && [self.navigationItem.leftBarButtonItem.customView isKindOfClass:[UIButton class]]) {
        return self.navigationItem.leftBarButtonItem.customView;
    }else if([self.navigationItem.leftBarButtonItems count] == 1 && [self.navigationItem.leftBarButtonItems.firstObject isKindOfClass:[UIButton class]]){
        return (UIButton*)self.navigationItem.leftBarButtonItems.firstObject;
    }
    return nil;
}

/**
 右导航按钮
 
 @return <#return value description#>
 */
-(UIButton*)rightNavButton{
    if (self.navigationItem.leftBarButtonItem && [self.navigationItem.rightBarButtonItem.customView isKindOfClass:[UIButton class]]) {
        return self.navigationItem.rightBarButtonItem.customView;
    }else if([self.navigationItem.rightBarButtonItems count] == 1 && [self.navigationItem.rightBarButtonItems.firstObject isKindOfClass:[UIButton class]]){
        return (UIButton*)self.navigationItem.rightBarButtonItems.firstObject;
    }
    return nil;
}


@end
