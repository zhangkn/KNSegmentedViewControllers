//
//  KNmasterRegView.h

#import <UIKit/UIKit.h>
#import "QCTREGViewModel.h"
#import "TopButtonView.h"
#import "QCTContainTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN
@interface KNmasterRegView : UIView


/**
 存放其他子控制器的View
 */
//@property (nonatomic,weak) QCTScrollView *contentScrollView;

@property (nonatomic,weak) TopButtonView *topButtonView;

- (instancetype)initWithViewModel:(QCTREGViewModel*)ViewModel;
@end

NS_ASSUME_NONNULL_END
