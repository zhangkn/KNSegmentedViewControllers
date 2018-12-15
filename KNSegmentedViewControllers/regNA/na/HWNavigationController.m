//
//  HWNavigationController.m
//  HWeibo
//
//  Created by devzkn on 6/27/16.
//  Copyright © 2016 hisun. All rights reserved.
//

#import "HWNavigationController.h"
#import "DY_Common.h"
@implementation HWNavigationController
    
#define  IOS7 ([[UIDevice currentDevice].systemVersion doubleValue]>=7.0)
#define IOS9 [UIDevice  currentDevice].systemVersion.floatValue>=9.0


#pragma mark - 设置导航栏主题


+ (void) setttingAppearance{
    //设置全局导航条外观
    [self settingUINavigationBarAppearance];
    if (IOS7) {
        return;//不需要设置全局导航条按钮主题
    }
    //设置全局导航条按钮主题
    [self settingbarButtonItenAppearance];
}

+ (void) settingUINavigationBarAppearance{
    /*
     @protocol UIAppearance <NSObject>  协议的代理方法+ (instancetype)appearance;
     
     @interface UIView : UIResponder < UIAppearance>
     */
    //方式一：获取全局外观
    //    UINavigationBar *navigationBar =[UINavigationBar appearance];//获取所有导航条外观
    //方式二：获取我们自己导航控制器的导航条－－ 确保系统的其它功能（短信）的导航条与自己的冲突，尤其在短信分享这方面要注意
    UINavigationBar *navigationBar;
    if (IOS9) {
        //9.0的API
        navigationBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[HWNavigationController class]]];
    }else{
        navigationBar = [UINavigationBar appearanceWhenContainedIn:[HWNavigationController class],nil];
    }
    
    /**
     导航栏背景的出图规格
     iOS6导航栏背景的出图规格
     非retina：320x44 px
     retina：640x88 px
     iOS7导航栏背景的出图规格
     retina：640x128 px
     */
//    if (IOS7) {//2016-04-25 15:38:43.112 HisunLottery[4141:217528] 9.2
//        
////        [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar64"] forBarMetrics:UIBarMetricsDefault];
//        
//        
//        [navigationBar setBackgroundImage:[ImageTools createImageWithColor: WLnavigationColor] forBarMetrics:UIBarMetricsDefault];
//        
//    }else{
////        [navigationBar setBackgroundImage:[UIImage imageNamed:@"NavBar"] forBarMetrics:UIBarMetricsDefault];
//        
//        [navigationBar setBackgroundImage:[ImageTools createImageWithColor: WLnavigationColor] forBarMetrics:UIBarMetricsDefault];
//
//        
//    }
    
    [navigationBar setBackgroundImage:[[DY_Common drawImageWithColor:[UIColor whiteColor] ImgSize:CGSizeZero] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forBarMetrics:UIBarMetricsDefault];

//    [navigationBar setBackgroundImage:[ImageTools createImageWithColor: WLnavigationColor] forBarMetrics:UIBarMetricsDefault];
    
    /*2.
     ＊标题：@property(nonatomic,copy) NSDictionary *titleTextAttributes;// 字典中能用到的key在UIStringDrawing.h中// 最新版本的key在UIKit框架的NSAttributedString.h中
     
     */
    //    NSDictionary *dict = @{UITextAttributeTextColor:[UIColor whiteColor]};
    NSDictionary *dict = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:18]};
    [navigationBar setTitleTextAttributes:dict];
    //2、The tint color to apply to the navigation items and bar button items. 导航条的主题颜色
    [navigationBar setTintColor:[UIColor whiteColor]];
    
    
}

+ (void) settingbarButtonItenAppearance{
    /**
     NS_CLASS_AVAILABLE_IOS(2_0) @interface UIBarItem : NSObject <NSCoding, UIAppearance>
     */
    //导航栏按钮主题
    UIBarButtonItem *barButtonIten = [UIBarButtonItem appearance];
    /*
     设置主题的方法：
     背景：- (void)setBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
     文字：- (void)setTitleTextAttributes:(NSDictionary *)attributes forState:(UIControlState)state;
     导航栏返回按钮背景：- (void)setBackButtonBackgroundImage:(UIImage *)backgroundImage forState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;
     */
    [barButtonIten setTintColor:[UIColor whiteColor]];
    
//    [barButtonIten setBackgroundImage:[UIImage imageNamed:@"NavButton"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
//    [barButtonIten setBackgroundImage:[UIImage imageNamed:@"NavButtonPressed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    
    
    [barButtonIten setBackButtonBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [barButtonIten setBackButtonBackgroundImage:[UIImage imageNamed:@"back_click"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
}



#pragma mark - 设置一次性属性
/**
 1、ninitailize、load方法的区别：
 initailize、load都是类方法
 当一个类被装载进内存时，就会调用一次load方法（当时这个类还不可用）
 当第一次使用这个类,或者这个类的子类的时候，就会调用一次initailize方法
 2.+ (void)initialize
 Initializes the class before it receives its first message.
 */


+ (void)initialize{
    
    if (self == [HWNavigationController class]) {//保证只调用一次
        // ... do the initialization ...
        //设置导航条主题
        [self setttingAppearance];
        
        
        UIBarButtonItem *barButtonItem=[UIBarButtonItem appearance];
        NSMutableDictionary *textAttributes= [NSMutableDictionary dictionary];
        textAttributes[NSForegroundColorAttributeName]= [UIColor whiteColor];
        textAttributes[NSFontAttributeName] = [UIFont systemFontOfSize:17];
        [barButtonItem setTitleTextAttributes:textAttributes forState:UIControlStateNormal];
        //设置不可编辑状态的样式
        NSMutableDictionary *disabledTextAttributes= [NSMutableDictionary dictionary];
        disabledTextAttributes[NSForegroundColorAttributeName]= [UIColor grayColor];
        disabledTextAttributes[NSFontAttributeName] =  textAttributes[NSFontAttributeName];
        [barButtonItem setTitleTextAttributes:disabledTextAttributes forState:UIControlStateDisabled];
        
    }
    
  
   
}
    
    - (instancetype)init {
        self = [super init];
        if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
            // ...
            // 修改颜色为绿色  0,207,13  HWColor(255, 64, 64)
//            [self.navigationBar setBackgroundImage:[ImageTools createImageWithColor: GYQNAVColor] forBarMetrics:UIBarMetricsDefault];
            [self.navigationBar setBackgroundImage:[[DY_Common drawImageWithColor:[UIColor whiteColor] ImgSize:CGSizeZero] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forBarMetrics:UIBarMetricsDefault];

        }
        return self;
    }

    
    - (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
        self = [super initWithRootViewController:rootViewController];
        if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
            // ...
            // 修改颜色为绿色  0,207,13
//            [self.navigationBar setBackgroundImage:[ImageTools createImageWithColor: WLnavigationColor] forBarMetrics:UIBarMetricsDefault];
            
            
            [self.navigationBar setBackgroundImage:[[DY_Common drawImageWithColor:[UIColor whiteColor] ImgSize:CGSizeZero] stretchableImageWithLeftCapWidth:5 topCapHeight:5] forBarMetrics:UIBarMetricsDefault];

        }
        return self;
        
        
    } // Convenience method pushes the root view controller without animation.
    
    

#pragma mark - 拦截push;--//90%的拦截，都是通过自定义类，重写自带的方法实现;10% 是通过分类和truntime进行方法实现的交换
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        
        [self setNavigationBarHidden:NO animated:YES];
        viewController.hidesBottomBarWhenPushed =YES;
        //设置左边按钮
//        viewController.navigationItem.leftBarButtonItem =[UIBarButtonItem barButtonItemWithTarget:self  Image:@"back" highlightedImage:@"back_click" actionMethod:@selector(backAction)];
        
        UIBarButtonItem *tmp =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_xinzeng_fanhui"] style:0 target:self action:@selector(backAction)];
        
        viewController.navigationItem.leftBarButtonItem = tmp;
        
        
        
        
        //设置右边按钮
//        viewController.navigationItem.rightBarButtonItem =[UIBarButtonItem barButtonItemWithTarget:self  Image:@"navigationbar_more" highlightedImage:@"navigationbar_more_highlighted" actionMethod:@selector(moreAction)];
    }
    [super pushViewController:viewController animated:animated];

}
#pragma mark - 重写: animated:
/**
 1）自定义导航控制器的价值
 重写push方法就可以拦截所有压入栈中的子控制器，统一做一些处理
 */
    
- (void)presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion{
    
    if ( [viewControllerToPresent  isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController  *viewControllerToPresenttmp = (UINavigationController*)viewControllerToPresent;
        
//        viewControllerToPresenttmp.topViewController.navigationItem.leftBarButtonItem =[UIBarButtonItem barButtonItemWithTarget:self  Image:@"back" highlightedImage:@"back_click" actionMethod:@selector(presenbackAction)];

        WS(weakSelf);
        GYQBaseBarItem *tmp =[[GYQBaseBarItem alloc]initWithImage:[UIImage imageNamed:@"icon_xinzeng_fanhui"] style:0 target:weakSelf action:@selector(presenbackAction:)];
        tmp.baseVC = viewControllerToPresent;
         
    }
    
    [super presentViewController:viewControllerToPresent animated:flag completion:completion];
}
    
-(void)presenbackAction:(GYQBaseBarItem *)bar{
    
    //一旦点击返回，就要打断首次流程
    [bar.baseVC dismissViewControllerAnimated:YES completion:nil];
}
    
- (void)backAction{
    
    [self popViewControllerAnimated:YES];
}

- (void)moreAction{
    [self popToRootViewControllerAnimated:YES];
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

@end
