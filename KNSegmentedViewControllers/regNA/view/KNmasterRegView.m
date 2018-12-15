//
//  KNmasterRegView.m
//  kaiDianBao
//
//  Created by mac on 2018/12/13.
//

#import "KNmasterRegView.h"
#import "TopButtonView.h"
@interface KNmasterRegView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;





@property (strong, nonatomic) QCTREGViewModel *viewModel;

@end

@implementation KNmasterRegView


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
    
    cell.textLabel.text = @"所填信息仅用于";
    
    
    
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


    }
    return _tableView;
}


- (void)createSubView{
//    [self tableView];//按照表格分组进行设计
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
    [self.tableView addSubview: [TopButtonView shareTopButtonView]];
    self.tableView.tableHeaderView = self.topButtonView;
    
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
        
        
//        TopButtonView *tmp = [TopButtonView shareTopButtonView];
        NSArray *tmp_itemArray = @[@"step1\n基本信息",@"step2\n信息",@"step3\n信息",@"step4\n照片"];
        
        CGFloat leftEdg = 15;
        
        CGFloat  tmptopButtonWidth = ([[UIScreen mainScreen] bounds].size.width-leftEdg*2)/tmp_itemArray.count;
        
        CGFloat height = tmptopButtonWidth*(79/168.0);// 168/79 = w/h

        TopButtonView  *tmp = [[TopButtonView alloc] initWithFrame:CGRectMake(leftEdg, leftEdg, [[UIScreen mainScreen] bounds].size.width-leftEdg*2, height) withTitleArray:tmp_itemArray];
        
        
        _topButtonView = tmp;
        

        
//        [_topButtonView.clickSubject subscribeNext:^(id x) {
//            //点击事件
//            NSLog(@"点击了%@ ",x);
////            if (self.viewModel.showViewBlock) {
////                self.viewModel.showViewBlock(x);
////            }
//
//        }];
        

        //  布局

        [self.tableView addSubview: tmp];

        
        _topButtonView.selectTitleColor = [UIColor whiteColor];
        _topButtonView.titleColor = rgb(153, 153, 153);
        _topButtonView.showBottomLine = NO;


        
    }
    return _topButtonView;
}



@end
