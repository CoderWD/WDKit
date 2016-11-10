//
//  UILabel+WDKit.h
//  PlayTogether
//
//  Created by 何伟东 on 2016/11/9.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WDKit)
/**
 固定宽度计算文字高度
 
 @return <#return value description#>
 */
-(CGFloat)textHeight;

/**
 固定高度计算文字宽度
 
 @return <#return value description#>
 */
-(CGFloat)textWidth;

@end
