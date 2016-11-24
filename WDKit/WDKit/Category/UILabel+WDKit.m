//
//  UILabel+WDKit.m
//  PlayTogether
//
//  Created by 何伟东 on 2016/11/9.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "UILabel+WDKit.h"
#import "UIView+WDKit.h"
#import "WDUtils.h"

@implementation UILabel (WDKit)


/**
 固定宽度计算文字高度

 @return <#return value description#>
 */
-(CGFloat)textHeight{
    return [WDUtils textHeight:self.text font:self.font width:self.width];
}

/**
 固定高度计算文字宽度

 @return <#return value description#>
 */
-(CGFloat)textWidth{
    return [WDUtils textWidth:self.text font:self.font height:self.height];
}

@end
