//
//  QCTSettlementCardInformationViewController.m
//  kaiDianBao
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTSettlementCardInformationViewController.h"
#import "QCTSettlementCardInformationView.h"
#import "UIConsts.h"
#import <Masonry.h>
@interface QCTSettlementCardInformationViewController ()


@property (strong, nonatomic)  QCTSettlementCardInformationView *masterView;


@end

@implementation QCTSettlementCardInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self masterView];
}
#pragma mark - set and get
- (QCTSettlementCardInformationView *)masterView{
    if (!_masterView) {
        
        QCTSettlementCardInformationView *tmp = [[QCTSettlementCardInformationView alloc] initWithViewModel:nil];
        _masterView= tmp;
        WS(weakSelf);
        
        //        [tmp setShowViewBlock:^(id  _Nonnull sender) {
        
        // 展示vc
        
        //        }];
        
        [self.view addSubview:_masterView];
        
        [_masterView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
    return _masterView;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.masterView layoutSubviews];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
