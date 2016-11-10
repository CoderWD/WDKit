//
//  UILabel+WDKit.m
//  PlayTogether
//
//  Created by 何伟东 on 2016/11/9.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "UILabel+WDKit.h"
#import "UIView+WDKit.h"

@implementation UILabel (WDKit)


/**
 固定宽度计算文字高度

 @return <#return value description#>
 */
-(CGFloat)textHeight{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    return [self.text boundingRectWithSize:CGSizeMake(self.width, CGFLOAT_MAX) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                              context:nil].size.height;
}

/**
 固定高度计算文字宽度

 @return <#return value description#>
 */
-(CGFloat)textWidth{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    return [self.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, self.height) options:
            NSStringDrawingTruncatesLastVisibleLine |
            NSStringDrawingUsesLineFragmentOrigin |
            NSStringDrawingUsesFontLeading attributes:attribute
                                   context:nil].size.width;
}

@end
