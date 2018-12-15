//
//  QCTBasicInformationViewController.h
//  kaiDianBao
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 QCT. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QCTBasicInformationViewController : UIViewController


@property (nonatomic, copy) void (^showViewBlock)(id sender);

@end

NS_ASSUME_NONNULL_END
