//
//  QCTUploadStorePhotosView.m
//  kaiDianBao
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTUploadStorePhotosView.h"
#import "UIConsts.h"
#import <Masonry.h>
@interface QCTUploadStorePhotosView ()

@property (nonatomic,weak) UITableView *tableView;


@property (strong, nonatomic) id viewModel;


@end
@implementation QCTUploadStorePhotosView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 19;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return kAdjustRatio(44);
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //第一个tableview 存放topView  + UILable
    // 表尾 contentScrollView
    
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"knUITableViewCell"];
    
    cell.textLabel.text = @"填写";
    
    
    
    return cell;
}




//- (instancetype)init {
//}

- (instancetype)initWithFrame:(CGRect)frame {
    return [self initWithFrame:frame ViewModel:nil];
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    return [self initWithFrame:CGRectZero ViewModel:nil];
}

- (instancetype)initWithViewModel:(id)ViewModel {
    return [self initWithFrame:CGRectZero ViewModel:ViewModel];
}

- (instancetype)initWithFrame:(CGRect)frame ViewModel:(id)viewModel {
    if (self = [super initWithFrame:frame]) {
        _viewModel = viewModel;
        //        [self selfInit];
        [self createSubView];
        //        [self addConstraints];
        //        [self bindViewModel];
    }
    return self;
}



- (UITableView *)tableView{
    if (nil == _tableView) {
        UITableView *tmpView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenW, kScreenH) style:UITableViewStylePlain];//初始化方法
        
        
        _tableView = tmpView;
        tmpView.bounces = NO;
        tmpView.delegate = self;
        tmpView.rowHeight = UITableViewAutomaticDimension;
        //        tmpView.estimatedRowHeight = 444;
        
        
        tmpView.dataSource = self;
        
        
        
        [self addSubview:_tableView];
        _tableView.contentInset = UIEdgeInsetsMake(15,0, 0, 0);
        
        
        //        WS(weakSelf);
        //        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        //            make.edges.equalTo(weakSelf);
        
        //        }];
        
        
    }
    return _tableView;
}


- (void)createSubView{
    [self tableView];//按照表格分组进行设计
    [self topButtonView];
    //    [self contentScrollView];
}

- (instancetype)init
{
    //    self = [super init];
    //    if (self) {
    
    
    return [self initWithFrame:CGRectZero ViewModel:nil];
    //    }
    //    return self;
}




- (void)layoutSubviews{
    [super layoutSubviews];
    [self updateTopButtonViewlayout];
}

- (void)updateTopButtonViewlayout{
    
    CGFloat leftEdg = 15;
    //
    CGFloat  tmptopButtonWidth = ([[UIScreen mainScreen] bounds].size.width-leftEdg*2)/self.topButtonView.titleArray.count;
    //
    CGFloat height = tmptopButtonWidth*(79/168.0);// 168/79 = w/h
    [self.topButtonView removeFromSuperview];
    [self.tableView addSubview:self.topButtonView];
    self.tableView.tableHeaderView = _topButtonView;
    WS(weakSelf);
    [_topButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(weakSelf.tableView).offset( kAdjustRatio(leftEdg));
        make.right.equalTo(weakSelf.tableView).offset(kAdjustRatio(-leftEdg));
        
        make.height.mas_equalTo(height);
        make.width.mas_equalTo(kScreenW-2*leftEdg);
        
    }];
    
    
}
- (TopButtonView *)topButtonView{
    if(!_topButtonView){
        
        TopButtonView *tmp = [TopButtonView shareTopButtonView];
        _topButtonView = tmp;
        [self.tableView addSubview:tmp];
    }
    return _topButtonView;
}


@end
