//
//  UIBarButtonItem+Extension.m
//
//  Created by devzkn on 6/28/16.
#import "UIBarButtonItem+Extension.h"

#import "UIView+Frame.h"

@implementation UIBarButtonItem (Extension)
+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    //设置frame
    button.size = button.currentBackgroundImage.size;
    
    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}




+ (UIBarButtonItem*)barButtonItemWithTarget:(id)target Image:(NSString*)imageName highlightedImage:(NSString*)highlightedImage actionMethod:(SEL)actionMethod   selectedImageName:(NSString*)selectedImageName{
    // 设置图片
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    
    if (highlightedImage != nil) {
        
        [button setBackgroundImage:[UIImage imageNamed:highlightedImage] forState:UIControlStateHighlighted];
    }
    
    
    [button setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];

    //设置frame
    button.size = button.currentBackgroundImage.size;
    
    //设置监听
    [button addTarget:target action:actionMethod forControlEvents:UIControlEventTouchUpInside];
    return  [[UIBarButtonItem alloc]initWithCustomView:button];
}


@end
