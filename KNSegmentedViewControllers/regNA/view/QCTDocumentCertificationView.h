//
//  QCTDocumentCertificationView.h
//  kaiDianBao
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 QCT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TopButtonView.h"
NS_ASSUME_NONNULL_BEGIN

@interface QCTDocumentCertificationView : UIView

@property (nonatomic,weak) TopButtonView *topButtonView;

- (instancetype)initWithViewModel:(id)ViewModel;

@end

NS_ASSUME_NONNULL_END
