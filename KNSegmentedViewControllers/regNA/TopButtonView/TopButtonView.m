//
//  TopButtomView.m
//  Zhuan
//
//

#import "TopButtonView.h"
#import "UIView+Frame.h"
#define topButtonWidth [[UIScreen mainScreen] bounds].size.width/_titleArray.count
#import "UIConsts.h"

@interface TopButtonView ()

@property (nonatomic,strong) UIView *line;

@end

@implementation TopButtonView
SingleM(TopButtonView);

- (instancetype)initWithFrame:(CGRect)frame withTitleArray:(NSArray *)titleArray {
//    if (self = [super initWithFrame:frame]) {
    if (self = [super init]) {
        self.frame = frame;
        _titleArray = titleArray;
        [self configSubviews];
//        [self setupInitShow];
    }
    return self;
}

- (void)setupInitShow{
    [self setupTopBtnTitleColor];
    [self setLoacadIndex:0];// 设置默认选中第一个
}

//- (void)setTitleColor:(UIColor *)titleColor{
//
//    _titleColor = titleColor;
//
//    [self setupTopBtnTitleColor];
//}

- (void)setupTopBtnTitleColor{
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([button isKindOfClass:[UIButton class]]) {
            [button setTitleColor:self.titleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:self.selectTitleColor ? : self.titleColor ? : [UIColor whiteColor] forState:UIControlStateSelected];
            //            [button setBackgroundColor:[UIColor whiteColor]];
            button.titleLabel.font = self.font ? : [UIFont systemFontOfSize:11];
        }
    }];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    int i = 0;
    for (UIButton *button in self.subviews) {
        if (![button isKindOfClass:[UIButton class]]) {
            continue;
        }
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        i++;
    }
}

- (void)setShowBottomLine:(BOOL)showBottomLine {
    _showBottomLine = showBottomLine;
    if (showBottomLine) {
        [self addSubview:self.line];
    }
}

- (void)configSubviews {
//    CGFloat height = self.frame.size.height;
//    self.layer.borderColor = [UIColor colorWithRed:225/255.0f green:225/255.0f blue:225/255.0f alpha:1].CGColor;
//    self.layer.borderWidth = 1/[UIScreen mainScreen].scale;
//    [_titleArray enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
//        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [button setTitle:title forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
//        button.frame = CGRectMake(idx * topButtonWidth, 0, topButtonWidth, height);
//        button.tag = 1000+idx;
//        if (idx == self.selectIndex) {
//            button.selected = YES;
//        }
//        [self addSubview:button];
//    }];
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [KNTopButton MoveToSuperviewWithTitles:_titleArray superView:self];

    });
    
    
}

- (void)setLoacadIndex:(NSInteger)loacadIndex{
    UIButton *button = (UIButton *)[self viewWithTag:loacadIndex + TopButtonIndexFirst];
    [self buttonClick:button];
    
}

- (void)setupClickBtn:(UIButton*)button{
    NSInteger tag = button.tag - TopButtonIndexFirst;
    if (self.selectBtn == button) {
        return;
    }
    self.selectBtn = button;
    if (self.showBottomLine) {
        [UIView animateWithDuration:0.25 animations:^{
            self.line.x = tag * topButtonWidth;
        }];
    }
    for (UIButton *subButton in self.subviews) {
        if ([subButton isKindOfClass:[UIButton class]]) {
            subButton.selected = NO;
        }
    }
    
    button.selected = YES;
    
    [self setupBackImageWith:button];
//    [self.clickSubject sendNext:@[@(tag),button]];
    [[NSNotificationCenter defaultCenter] postNotificationName:QCTchangeViewNotification object: @(tag)];

    
}

/**
 处理背景图片和问题颜色---- 使用一个单例的模型对象保持按钮的setBackgroundImage UIControlStateSelectedImgName UIControlStateNormalImageName
 // 修改颜色的时候，去修改全局的模型数据
 */
- (void)setupBackImageWith:(UIButton*)tmp{
    
//    UIButton *tmp = ;
    if ([tmp tag] == TopButtonIndexFirst) {
        
        [tmp setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_l"] forState:UIControlStateSelected];
        [tmp setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_n"] forState:UIControlStateNormal];
        
        [tmp setTitleColor:self.titleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];
        
        
    }else{
        [tmp setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_l_s"] forState:UIControlStateSelected];
        
        [tmp setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_s"] forState:UIControlStateNormal];
        
    }
    [tmp setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];

}


/**
 恢复到初始化状态
 */
- (void)destroySetting{
    // 恢复背景颜色
//    [self setupTopBtnTitleColor];
    
    [self.subviews enumerateObjectsUsingBlock:^(UIButton *button, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([button isKindOfClass:[UIButton class]]) {
//            [button setTitleColor:self.titleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];
//            [button setTitleColor:self.selectTitleColor ? : self.titleColor ? : [UIColor whiteColor] forState:UIControlStateSelected];
            
            if ([button tag] == TopButtonIndexFirst) {
                
                [button setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_l"] forState:UIControlStateSelected];
                [button setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_n"] forState:UIControlStateNormal];
                [button setTitleColor:self.titleColor ? : [UIColor whiteColor] forState:UIControlStateNormal];

                
            }else{
                [button setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_dis"] forState:UIControlStateNormal];
            }

            button.titleLabel.font = self.font ? : [UIFont systemFontOfSize:11];

        }
    }];
//    [self setupInitShow];
    
}

- (void)buttonClick:(UIButton *)button {
    [self setupClickBtn:button];
}

- (RACSubject *)clickSubject {
    if (!_clickSubject) {
        _clickSubject = [RACSubject subject];
    }
    return _clickSubject;
}

- (UIView *)line {
    if (!_line) {
        _line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-2, topButtonWidth, 2)];
        _line.backgroundColor = self.tintColor ? : self.selectTitleColor;
    }
    return _line;
}


@end
