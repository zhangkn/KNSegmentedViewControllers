///
#pragma mark  - NSLog


//调试模式
#ifdef DEBUG
#define NSLog(...)     NSLog(__VA_ARGS__)
#define KisDebug 1

//#define NSLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);

#else//发布模式
#define NSLog(...)
#define KisDebug 0
#endif

//#if DEBUG
////#define XDLog(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
//#else
////#define NSLog(...);
//
//#endif

#pragma mark - 常量

//文本 标签 标准字体大小
#define UITextFontSize              15.0

//圆角（全局）
#define RadiusIcon  5

//线高度
#define LineH 0.3

#pragma mark - 常用的方法

#define SCREENH [[UIScreen mainScreen] bounds].size.height
#define SCREENW [[UIScreen mainScreen] bounds].size.width
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

#define WS(weakSelf);  __weak __typeof(&*self)weakSelf = self

#pragma mark - app字体
#define kTextFont(size) [UIFont systemFontOfSize:(kAdjustRatio(size))]
#define kBoldFont(fontSize) [UIFont fontWithName:@"Helvetica Neue" size:(fontSize)]

#define kStatusKey @"Success"
#define kMessageKey @"message"

#define kAdjustRatio(num) (ceil((SCREENW/375.0)*(num)))
#define kScreenW    [UIScreen mainScreen].bounds.size.width
#define kScreenH    [UIScreen mainScreen].bounds.size.height

#pragma mark - 颜色

#define RGBA(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]
#define rgba(a, b, c, d) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:d]

#define RGB(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]
#define rgb(a, b, c) [UIColor colorWithRed:(a / 255.0f) green:(b / 255.0f) blue:(c / 255.0f) alpha:1.0f]

#define kMainColor color(254, 156, 1, 1)
#define kLineColor RGB(238,238,238)
#define kRedColor RGB(255, 83, 85)
#define kTextPlaceholderColor RGB(153,153,153)
#define kBgColor RGB(246,246,246)
#pragma mark - 线颜色


#pragma mark - 蒙版颜色
#define STModalWindowDefaultBackgroundColor [UIColor colorWithWhite:0 alpha:0.55]


extern NSString * _Nonnull const QCTchangeViewNotification;




