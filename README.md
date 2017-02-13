#### WDKit 使用说明
##### 前言
本仓库由CoderHe开发和维护，主要致力于iOS开发过程中的效率问题，其中主要对UIKit使用Category和Extension的二次封及一些常用的工具类函数的封装，如果阁下有更好的思想或者想法欢迎联系我，email：[heweidong@outlook.com](mailto:heweidong@outlook.com)。  
#####1、开始使用（Getting started）
```
使用CocoaPods导入WDKit
pod 'WDKit', '~> 1.0.4.4'
导入WDKit头文件
#import <WDKit/WDKit.h>

//-----------------示例-----------------
//设置view高度
[view setHeight:100];
//设置view的背景颜色
[view setBackgroundColor:RGB(100,100,100)];
//获取view所在viewController
UIViewController *viewController = view.viewController;
//给模型类归档
WDArchive(modle,fileName);
//获取计算label的文字高度
label.textHeight;
//string的base64编码
string.base64Encoding
//...... 更多如下说明
```
#####2、Category篇  
######2.1 UIView 
```
/**
 *  通过响应者链找到view的viewController
 *
 *  @return <#return value description#>
 */
-(UIViewController *)viewController;

/**
 view截图
 
 @return <#return value description#>
 */
- (UIImage *)convertToScreenScaleImage;

/**
 view截图
 
 @return <#return value description#>
 */
- (UIImage *)convertToImageWithScale:(CGFloat)scale;
/**
 设置边框

 @param width 宽度
 @param color 颜色
 */
- (void)setBorderWidth:(CGFloat)width color:(UIColor *)color;

/**
 设置圆角

 @param cornerRadius 度数
 */
- (void)setCornerRadius:(CGFloat)cornerRadius;

/**
 视图坐标
 */
@property CGPoint origin;

/**
 视图大小
 */
@property CGSize size;

/**
 y坐标
 */
@property (nonatomic) CGFloat left;

/**
 x坐标
 */
@property (nonatomic) CGFloat top;


/**
 宽度
 */
@property CGFloat width;

/**
 高度
 */
@property CGFloat height;

/**
 右边x坐标
 */
@property CGFloat right;

/**
 底部y坐标
 */
@property CGFloat bottom;

/**
 中心x坐标
 */
@property (nonatomic) CGFloat centerX;

/**
 中心y坐标
 */
@property (nonatomic) CGFloat centerY;

```  
######2.2 UILabel  
```
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
``` 
######2.3 UIButton
```
/**
 设置Normal下的背景图片
 @param image 图片
 */
-(void)setNormalBackgroundImage:(UIImage*)image;

/**
 设置hlighted]下的背景图片
 @param image 图片
 */
-(void)setHighlightedBackgroundImage:(UIImage*)image;

/**
 设置Selected下的背景图片
 @param image 图片
 */
-(void)setSelectedBackgroundImage:(UIImage*)image;

/**
 设置Normal下的背景图片
 @param name 图片名
 */
-(void)setNormalBackgroundImageName:(NSString*)name;

/**
 设置Highlighted下的背景图片
 @param name 图片名
 */
-(void)setHighlightedBackgroundImageName:(NSString*)name;

/**
 设置Selected下的背景图片
 @param name 图片名
 */
-(void)setSelectedBackgroundImageName:(NSString*)name;

/**
 设置Normal下的Title
 
 @param title <#title description#>
 */
-(void)setNormalTitle:(NSString*)title;

/**
 设置Highlighted下的Title
 
 @param title <#title description#>
 */
-(void)setHighlightedTitle:(NSString*)title;

/**
 设置Selected下的Title
 
 @param title <#title description#>
 */
-(void)setSelectedTitle:(NSString*)title;

/**
 设置Normal下的Title Color
 
 @param color <#color description#>
 */
-(void)setNormalTitleColor:(UIColor *)color;

/**
 设置Highlighted下的Title Color
 
 @param color <#color description#>
 */
-(void)setHighlightedTitleColor:(UIColor *)color;

/**
 创建便捷的通用点击事件
 
 @param controlEvent button事件
 @param handler 回调block
 */
-(void)handlerControlEvent:(UIControlEvents)controlEvent handler:(void (^)(id sender))handler;

/**
 创建最常用的TouchUpInside点击
 
 @param handler 回调block
 */
-(void)handlerTouchUpInsideEvent:(void (^)(id sender))handler;

/**
 移除target
 
 @param event <#event description#>
 */
-(void)removeTargetWithEvent:(UIControlEvents)event;
```  
######2.4 UIImage
```
/**
 *  传入图片放缓一个像素大小的UIImage图片
 *
 *  @param color <#color description#>
 *
 *  @return <#return value description#>
 */
+(UIImage*)imageWithColor:(UIColor*)color;

/**
 压缩图片至目标尺寸
 
 @param sourceImage sourceImage 源图片
 @param targetWidt 图片最终尺寸的宽
 @return 返回按照源图片的宽、高比例压缩至目标宽、高的图片
 */
+(UIImage *)compressImage:(UIImage *)sourceImage toTargetWidth:(CGFloat)targetWidt;

/**
 生成高斯模糊UIImage
 
 @param image 原始图片
 @param blur 0.0~1.0f强度
 @return <#return value description#>
 */
+(UIImage *)blurImage:(UIImage *)image withBlur:(CGFloat)blur;
``` 

######2.5 NSData
```
/**
 *  aes265加密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (NSData *)aes256_encrypt:(NSString *)key;

/**
 *  aes265 解密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
- (NSData *)aes256_decrypt:(NSString *)key;

/**
 *  des加密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
-(NSData*)desEncryptWithKey:(NSString*)key;

/**
 *  des解密
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
-(NSData*)desDecrypttWithKey:(NSString*)key;

/**
 *  转16进制字符串
 *
 *  @return <#return value description#>
 */
- (NSString*)encryptHex;
```
######2.6 NSData
```
/**
 *  判断身份证号码是否正确
 *
 *  @return <#return value description#>
 */
-(BOOL)validateIDCardNumber;
/**
 *  判断是否为手机号码
 *
 *  @return <#return value description#>
 */
-(BOOL)validatePhoneNumber;
/**
 *  简单的11位手机号码校验
 *
 *  @return <#return value description#>
 */
-(BOOL)simpleValidatePhone;
/**
 *  判断是否为身份证
 *
 *  @return <#return value description#>
 */
-(BOOL) validateIdentityCard;
/**
 *  判断是否为车牌号
 *
 *  @return <#return value description#>
 */
-(BOOL) validateCarNo;
/**
 *  判断是否为邮箱
 *
 *  @return <#return value description#>
 */
-(BOOL) validateEmail;
/**
 *  字符串去首位空格
 *
 *  @return <#return value description#>
 */
-(NSString*)trim;
/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)encodeURL;
/**
 *  SHA1加密
 *
 *  @return <#return value description#>
 */
-(NSString*)sha1;

/**
 *  url编码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlEncode;
/**
 *  url解码
 *
 *  @return <#return value description#>
 */
-(NSString*)urlDecode;
/**
 *  md5
 *
 *  @return <#return value description#>
 */
-(NSString*)md5;


/**
 DES+Base64加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desEncryptWithKey:(NSString*)key;

/**
 DES+Base64解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)desDecryptWithKey:(NSString*)key;

/**
 AES加密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesEncryptWitKey:(NSString*)key;

/**
 AES解密

 @param key <#key description#>
 @return <#return value description#>
 */
- (NSString *)aesDecryptWitKey:(NSString*)key;

/**
 *  base64编码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Encoding;
/**
 *  base64解码
 *
 *  @return <#return value description#>
 */
-(NSString*)base64Decodeing;
```
######2.7 NSObject
```
/**
 runtime 扩展属性
 */
@property (nonatomic,strong) NSMutableDictionary *extentObject;
```
#####3、Extension偏  
######3.1 UIColor
```
/**
 *  16进制颜色转RGB
 *
 *  @param hexValue   色值
 *  @param alphaValue 透明度
 *
 *  @return <#return value description#>
 */
+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;

/**
 *   16进制颜色转RGB
 *
 *  @param hexValue 色值
 *
 *  @return <#return value description#>
 */
+ (UIColor*) colorWithHex:(NSInteger)hexValue;

/**
 *  RGB转16进制颜色
 *
 *  @param color RGB颜色
 *
 *  @return 16进制颜色字符串
 */
+ (NSString *) hexFromUIColor: (UIColor*) color;
```
#####4、Utils篇
######4.1 钥匙串（KeyChain）
```
#import "WDKeyChain.h"

/**
 <#Description#>

 @param key 保存东西到钥匙串
 @param data <#data description#>
 */
+ (void)saveWithKey:(NSString *)key data:(id)data;


/**
 加载钥匙串里的内容

 @param key <#key description#>
 @return <#return value description#>
 */
+ (id)loadWithKey:(NSString *)key;


/**
  删除钥匙串内容

 @param key <#key description#>
 */
+ (void)deleteWithKey:(NSString *)key;
```
######4.2 RSA加密解密
```
#import "WDRSA.h"

// return base64 encoded string
+ (NSString *)encryptString:(NSString *)str publicKey:(NSString *)pubKey;
// return raw data
+ (NSData *)encryptData:(NSData *)data publicKey:(NSString *)pubKey;
// return base64 encoded string
// enc with private key NOT working YET!
//+ (NSString *)encryptString:(NSString *)str privateKey:(NSString *)privKey;
// return raw data
//+ (NSData *)encryptData:(NSData *)data privateKey:(NSString *)privKey;

// decrypt base64 encoded string, convert result to string(not base64 encoded)

/**
 *  公钥解密 String
 *
 *  @param str    待解密字符串
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)decryptString:(NSString *)str publicKey:(NSString *)pubKey;
/**
 *  公钥解密NSData
 *
 *  @param data   待解密Data
 *  @param pubKey 公钥
 *
 *  @return <#return value description#>
 */
+ (NSData *)decryptData:(NSData *)data publicKey:(NSString *)pubKey;
/**
 *  私钥解密 String
 *
 *  @param str     待解密字符串
 *  @param privKey 私钥
 *
 *  @return <#return value description#>
 */
+ (NSString *)decryptString:(NSString *)str privateKey:(NSString *)privKey;

/**
 私钥解密 NSData

 @param data 待解密Data
 @param privKey 私钥
 @return <#return value description#>
 */
+ (NSData *)decryptData:(NSData *)data privateKey:(NSString *)privKey;
```

######4.3 通用工具类
```
#import "WDUtils.h"
/**
 计算文字宽度
 
 @param text <#text description#>
 @param font <#font description#>
 @param height <#height description#>
 @return <#return value description#>
 */
+(CGFloat)textWidth:(NSString*)text font:(UIFont*)font height:(CGFloat)height;

/**
 计算文字高度
 
 @param text <#text description#>
 @param font <#font description#>
 @param width <#width description#>
 @return <#return value description#>
 */
+(CGFloat)textHeight:(NSString*)text font:(UIFont*)font width:(CGFloat)width;


/**
 归档
 
 @param object <#object description#>
 @param name <#fileName description#>
 @return <#return value description#>
 */
+(BOOL)wd_archiveWithObject:(id)object fileName:(NSString*)name;

/**
 解档
 
 @param name <#name description#>
 @return <#return value description#>
 */
+(id)wd_unArchiveWithFileName:(NSString*)name;

/**
 删除归档文件
 
 @param name <#name description#>
 @return <#return value description#>
 */
+(BOOL)wd_deleteArchiveWithFileName:(NSString*)name;
```
#####4、便捷宏定义
```
// 颜色RBG
#define RGB(r, g, b) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1]
//颜色RBGA
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]

//便捷创建字体字体
#define WDSystemFont(size) [UIFont systemFontOfSize:size]
//便捷创建系统粗字体
#define WDBoldSystemFont(size) [UIFont boldSystemFontOfSize:size]

//3.5寸屏
#define is3_5inch ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
//3.5寸retina屏
#define is4inch_retina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
//4.7寸retina屏
#define is4_7inch_retina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size) : NO)
//5.寸retina屏
#define is5_5inch_retina ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size) : NO)

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


//便捷创建UIImage
#define WDNameImage(name) [UIImage imageNamed:name]
```

--
