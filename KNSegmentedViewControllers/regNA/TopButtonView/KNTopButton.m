//
//  KNTopButton.m
//  SegmentView
//
//  Created by mac on 2018/12/12.
//

#import "KNTopButton.h"

@implementation KNTopButton


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.titleLabel.numberOfLines = 0;
        
//        [self setAdjustsImageWhenHighlighted:<#(BOOL)#>:NO];//去掉高亮时候变灰的效果

        [self setAdjustsImageWhenHighlighted:NO];//去掉高亮时候变灰的效果
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        //icon_zhuce_liucheng_l
        [self setBackgroundImage:[UIImage imageNamed:@"icon_zhuce_liucheng_dis"] forState:UIControlStateNormal];


               
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (NSMutableArray *)MoveToSuperviewWithTitles:(NSArray*)titles superView:(UIView*)superView{
    
    CGFloat  topButtonWidth = superView.frame.size.width/titles.count;
    
    CGFloat height = topButtonWidth*(79/168.0);// 168/79 = w/h
    NSMutableArray *tmp = [NSMutableArray array];
    [titles enumerateObjectsUsingBlock:^(NSString *title, NSUInteger idx, BOOL * _Nonnull stop) {
        
        UIButton *button = [[KNTopButton alloc] init];
        [button setTitle:title forState:UIControlStateNormal];
        [button addTarget:superView action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        button.frame = CGRectMake(idx * topButtonWidth, 0, topButtonWidth, height);
        button.tag = TopButtonIndexFirst+idx;
//        if (idx == 1000) {
//            button.selected = YES;
//        }
        [superView addSubview:button];
        [tmp addObject:button];
    }];
    
    return tmp;
    
}
@end
