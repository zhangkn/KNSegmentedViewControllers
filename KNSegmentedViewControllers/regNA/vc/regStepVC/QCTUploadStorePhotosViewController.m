//
//  QCTUploadStorePhotosViewController.m
//  kaiDianBao
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTUploadStorePhotosViewController.h"
#import "QCTUploadStorePhotosView.h"
#import "UIConsts.h"
#import <Masonry.h>

@interface QCTUploadStorePhotosViewController ()
@property (strong, nonatomic)  QCTUploadStorePhotosView *masterView;

@end

@implementation QCTUploadStorePhotosViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self masterView];
}
#pragma mark - set and get
- (QCTUploadStorePhotosView *)masterView{
    if (!_masterView) {
        
        QCTUploadStorePhotosView *tmp = [[QCTUploadStorePhotosView alloc] initWithViewModel:nil];
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

@end
