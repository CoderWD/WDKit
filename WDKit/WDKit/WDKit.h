//
//  WDKit.h
//  WDKit
//
//  Created by 何伟东 on 2016/10/10.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "NSData+WDKit.h"
#import "NSString+WDKit.h"
#import "UIView+WDKit.h"
#import "UIColor_WDKit.h"
#import "UIButton+WDKit.h"
#import "UIImageView+WDKit.h"
#import "UIImage+WDKit.h"
#import "UIFont+WDKit.h"
#import "UILabel+WDKit.h"
#import "NSObject+WDKit.h"
#import "UIViewController+WDKit.h"

#import "WDUtils.h"
#import "WDRSA.h"
#import "WDKeyChain.h"

//判断与相应的屏幕比例是否一致
#define SCALE_TO_SCREEN(w,h) [[NSString stringWithFormat:@"%0.5f",UIScreen.mainScreen.bounds.size.width/UIScreen.mainScreen.bounds.size.height] isEqualToString:[NSString stringWithFormat:@"%0.5f",w/h]]
//3.5寸屏比例
#define SCALE_3_5INCH SCALE_TO_SCREEN(640.f,960.f)
//4.7寸屏比例
#define SCALE_4INCH_SCREEN SCALE_TO_SCREEN(640.f,1136.f)
//5寸屏比例
#define SCALE_4_7INCH_SCREEN SCALE_TO_SCREEN(750.f,1334.f)
//5.5寸屏比例
#define SCALE_5_5INCH_SCREEN SCALE_TO_SCREEN(1242.f,2208.f)
//iPhone X屏幕比例
#define SCALE_IPHONE_X_SCREEN SCALE_TO_SCREEN(1125.f,2436.f)


//app框架高度
#define APP_FRAME_HEIGHT [[UIScreen mainScreen] applicationFrame].size.height
//app框架宽度
#define APP_FRAME_WIDTH [[UIScreen mainScreen] applicationFrame].size.width
//屏幕的尺寸
#define SCREEN_SIZE ([[UIScreen mainScreen] bounds]).size
//屏幕高度
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds]).size.height
//屏幕宽度
#define SCREEN_WIDTH ([[UIScreen mainScreen] bounds]).size.width

//沙盒目录
#define DOCUMENT_PATH [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]
//应用keyWindow
#define KEY_WINDOW [UIApplication sharedApplication].keyWindow

// 调试
#ifdef DEBUG
    #define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
    #define DLog(...)
#endif

//文件根目录归档
#define WDArchive(object,name) [WDUtils wd_archiveWithObject:object fileName:name]
//文件根目录解档
#define WDUnArchive(name) [WDUtils wd_unArchiveWithFileName:name]
//删除根目录下的文件
#define WDDeleteArchiveFile(name) [WDUtils wd_deleteArchiveWithFileName:name]


//! Project version number for WDKit.
FOUNDATION_EXPORT double WDKitVersionNumber;

//! Project version string for WDKit.
FOUNDATION_EXPORT const unsigned char WDKitVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <WDKit/PublicHeader.h>


