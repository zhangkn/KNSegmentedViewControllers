//
//  TopButtomView.h
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "KNTopButton.h"
#import "Single.h"

@interface TopButtonView : UIView

- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray;

@property (nonatomic, strong) UIFont *font;

@property (nonatomic, strong) UIColor *titleColor;

@property (nonatomic, strong) UIColor *selectTitleColor;

@property (nonatomic, strong) NSArray *titleArray;

//@property (nonatomic, assign) NSInteger selectIndex;
@property (nonatomic, assign) UIButton *selectBtn;

@property (nonatomic, assign) BOOL showBottomLine;

@property (nonatomic, strong) UIColor *buttonBackgroundColor;

@property (nonatomic, strong) UIColor *tintColor;

@property (nonatomic, strong) RACSubject *clickSubject;


- (void)setLoacadIndex:(NSInteger)loacadIndex;
- (void)setupInitShow;
- (void)destroySetting;
SingleH(TopButtonView);

//+ (instancetype)shareTopButtonView;

@end
