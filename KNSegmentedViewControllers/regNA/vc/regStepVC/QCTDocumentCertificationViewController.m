//
//  QCTDocumentCertificationViewController.m
//  kaiDianBao
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTDocumentCertificationViewController.h"
#import "QCTDocumentCertificationView.h"
@interface QCTDocumentCertificationViewController ()

@property (strong, nonatomic) QCTDocumentCertificationView *masterView;

@end

@implementation QCTDocumentCertificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view setBackgroundColor:[UIColor redColor]];
    [self masterView];
}

#pragma mark - set and get
- (QCTDocumentCertificationView *)masterView{
    if (!_masterView) {
        
        QCTDocumentCertificationView *tmp = [[QCTDocumentCertificationView alloc] initWithViewModel:nil];
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
