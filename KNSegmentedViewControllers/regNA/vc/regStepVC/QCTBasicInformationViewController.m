//
//  QCTBasicInformationViewController.m
//  kaiDianBao
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTBasicInformationViewController.h"
#import "KNmasterRegView.h"

@interface QCTBasicInformationViewController ()

@property (weak, nonatomic) KNmasterRegView *masterRegView;

@property (strong, nonatomic) QCTREGViewModel *viewModel;


@end

@implementation QCTBasicInformationViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self masterRegView];
    
//    [self.masterRegView.topButtonView setupInitShow];

}



#pragma mark - set and get
- (KNmasterRegView *)masterRegView{
    if (!_masterRegView) {
        
        KNmasterRegView *tmp = [[KNmasterRegView alloc] initWithViewModel:self.viewModel];
        _masterRegView= tmp;
        WS(weakSelf);
        
        //        [tmp setShowViewBlock:^(id  _Nonnull sender) {
        
        // 展示vc
        
        //        }];
        
        [self.view addSubview:_masterRegView];
        
        [_masterRegView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(weakSelf.view);
        }];
    }
    return _masterRegView;
}


- (QCTREGViewModel *)viewModel{
    
    if (_viewModel == nil) {
        _viewModel = [QCTREGViewModel new];
        

            
            
        
        
    }
    return _viewModel;
    
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.masterRegView layoutSubviews];
}


- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.masterRegView.topButtonView removeFromSuperview];

    
}


@end
