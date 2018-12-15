//
//  DY_Common.m
//  KNSegmentedViewControllers
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 kunnan. All rights reserved.
//

#import "DY_Common.h"

@implementation DY_Common


/**
 *  通过一个颜色绘制一个 uiimage
 */
+ (UIImage *)drawImageWithColor:(UIColor *)color ImgSize:(CGSize)imgSize
{
    CGSize imageSize;
    if (imgSize.width == 0) {
        imageSize = CGSizeMake(10, 10);
    }else{
        imageSize = imgSize;
    }
    UIGraphicsBeginImageContextWithOptions(imageSize, 0, [UIScreen mainScreen].scale);
    [color set];
    UIRectFill(CGRectMake(0, 0, imageSize.width, imageSize.height));
    UIImage *pressedColorImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return pressedColorImg;
}

@end
