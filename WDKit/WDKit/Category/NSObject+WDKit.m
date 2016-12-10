//
//  NSObject+WDKit.m
//  WDKit
//
//  Created by 何伟东 on 2016/12/9.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "NSObject+WDKit.h"
#import <objc/runtime.h>

static const void *extendObjectKey = @"extentObject";
@implementation NSObject (WDKit)


/**
 runtime 扩展属性

 @return <#return value description#>
 */
-(NSMutableDictionary *)extentObject{
    NSMutableDictionary *object = objc_getAssociatedObject(self, &extendObjectKey);
    if (object == nil) {
        object = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, &extendObjectKey, object, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return object;
}

-(void)setExtentObject:(NSMutableDictionary *)extentObject{
    objc_setAssociatedObject(self, &extendObjectKey, extentObject, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
