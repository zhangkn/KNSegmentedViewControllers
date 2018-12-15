
//

//

#import "WLContainerViewController.h"
#import "TopButtonView.h"
#import "UIConsts.h"
#import "QCTDocumentCertificationViewController.h"
#import "QCTSettlementCardInformationViewController.h"
@interface WLContainerViewController ()


@property (nonatomic,strong) NSMutableArray *vcs;

//@property (nonatomic, copy) void (^showViewBlock)(id sender);

/**
  记录当前显示的控制器的类型
 
 
 */
@property (assign,nonatomic) WLContainerViewControllerType vctype;
@property (nonatomic,assign) BOOL hasLiked;



@end

@implementation WLContainerViewController



- (instancetype)initWithfirstvc:(UIViewController*)first  secondvc :(UIViewController*)second{
    self = [super init];
    if (self) {////既然nil解析成NO，所以没有必要在条件语句比较。不要拿某样东西直接与YES比较，因为YES被定义为1
        // ...
        
        if (first) {
            _first = first;
        }
        
        if (second) {
            _second = second;
        }
        
        
    }
    return self;
}


- (void)setVctype:(WLContainerViewControllerType )vctype{
    _vctype = vctype;
    

    switch (vctype) {
        case WLContainerViewControllerTypeFirst:
        {
            self.navigationItem.rightBarButtonItem.title = _second.title;
            
            self.title = _first.title;
            
            //,告知parentViewController切换
            
            [self cycleFromViewController:_second toViewController:_first];


        }
            break;
            
        case WLContainerViewControllerTypeSecond:
        {
            self.navigationItem.rightBarButtonItem.title = _first.title;
            self.title = _second.title;
            
            [self cycleFromViewController:_first toViewController:_second];

            
        }
            break;
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)reg{
    
    if (self.hasLiked  == NO) {
        return;
    }
    
    self.hasLiked = NO;
    self.vctype = !self.vctype;
    
  
    
}



-(void)presenbackAction:(GYQBaseBarItem *)bar{
    
    //一旦点击返回，就要打断首次流程
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    
    [[TopButtonView shareTopButtonView] destroySetting];
    
    
    
}

- (void)showVc:(NSInteger)index
{
    UIViewController *vc = self.vcs[index];
    [self performShowVc:vc];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.navigationController.navigationBar setShadowImage:nil];//ios显示或隐藏导航栏的底线
    
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefaultPrompt];

    
    GYQBaseBarItem *leftBtn =[[GYQBaseBarItem alloc]initWithImage:[UIImage imageNamed:@"icon_xinzeng_fanhui"] style:0 target:self action:@selector(presenbackAction:)];
//    tmp.baseVC = viewControllerToPresent;ˆ
//    self.navigationItem.rightBarButtonItem =tmp;
    leftBtn.tintColor = [UIColor blackColor];


    self.navigationItem.leftBarButtonItem = leftBtn;
    
    [self createSubView];
    
    
    WS(weakSelf);
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:QCTchangeViewNotification object:nil] subscribeNext:^(NSNotification *notification) {
        
        NSInteger index = [notification.object integerValue];
        [weakSelf showVc:index];
    }];
    
    [self showVc:0];
    


}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[TopButtonView shareTopButtonView] setupInitShow];
}

- (void)createSubView{

}


- (NSMutableArray *)vcs{
    
    if (!_vcs) {
        _vcs = [NSMutableArray array];
        
        [self setupChildViewController];
        
        
    }
    
    return _vcs;
}




- (void)setupChildViewController{
    
    
    QCTBasicInformationViewController *all = [[QCTBasicInformationViewController alloc] init];
//    all.title = @"基本信息";
    all.view.backgroundColor = [UIColor yellowColor];
    
//    WS(weakSelf);
//    all.showViewBlock = ^(id sender) {
//        [weakSelf showVc:[sender integerValue]];
//    };
    
    [_vcs addObject: all];
    QCTDocumentCertificationViewController *all1 = [[QCTDocumentCertificationViewController alloc] init];
    all1.view.backgroundColor = [UIColor blueColor];
    
//    all1.showViewBlock = ^(id sender) {
//        [weakSelf showVc:[sender integerValue]];
//    };// 考虑修改为通知，或者代理
    [_vcs addObject: all1];
    
    
    
    QCTSettlementCardInformationViewController *all2 = [[QCTSettlementCardInformationViewController alloc] init];
    [_vcs addObject:all2];
    QCTUploadStorePhotosViewController *all3 = [[QCTUploadStorePhotosViewController alloc] init];
    [_vcs addObject: all3];
    
}




-(void)performShowVc:(UIViewController*) destinationController{
    
    
    
    
    for (UIViewController *vc in self.vcs) {
        [vc willMoveToParentViewController:nil];
        [vc.view removeFromSuperview];
        [vc removeFromParentViewController];
    }
    [self addChildViewController:destinationController];
    
    
    for(UIView *subview in [self.view subviews]) {
        [subview removeFromSuperview];
    }
    [self.view addSubview:destinationController.view]; // or something like this.
    [destinationController.view layoutSubviews];
    [destinationController didMoveToParentViewController:self];
    
}

- (void) displayContentController: (UIViewController*) content {
    //the addChildViewController: method calls the child’s willMoveToParentViewController:
    [self addChildViewController:content];
    content.view.frame = self.view.bounds;
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];
}

- (void) hideContentController: (UIViewController*) content {
    [content willMoveToParentViewController:nil];
    [content.view removeFromSuperview];
    //The removeFromParentViewController method also calls the child’s didMoveToParentViewController: method, passing that method a value of nil.
    [content removeFromParentViewController];
}
#pragma mark --      [self transitionFromViewController:oldVC toViewController:newVC duration:0.1 options:UIViewAnimationOptionLayoutSubviews animations:^{//报错原因  用户点击的时间间隔《 动画持续时间， 因此动画持续时间可以设置小一点，例如0.1


- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC {
    // Prepare the two view controllers for the change.
    [oldVC willMoveToParentViewController:nil];
    [self addChildViewController:newVC];
    // Get the start frame of the new view controller and the end frame
    // for the old view controller. Both rectangles are offscreen.
    //设置newVC的frame
    CGRect rect = self.view.bounds;
    rect.origin.x += CGRectGetWidth(self.view.bounds);
    newVC.view.frame = rect;
    //获取oldVC的frame
    CGRect endFrame = oldVC.view.bounds;
    endFrame.origin.x -= CGRectGetWidth(self.view.bounds);
    //动画转场
    __weak WLContainerViewController *weakSelf = self;

    [self transitionFromViewController:oldVC toViewController:newVC duration:0.7 options:UIViewAnimationOptionLayoutSubviews animations:^{
        // Animate the views to their final positions.
        newVC.view.frame = oldVC.view.frame;
        oldVC.view.frame = endFrame;
    } completion:^(BOOL finished) {
        // Remove the old view controller and send the final
        // notification to the new view controller.
        [oldVC removeFromParentViewController];
        [newVC didMoveToParentViewController:self];
        weakSelf.hasLiked = YES;
    }];
}




/**
 跳转到注册流程的入口
 */
+ (void)presentViewControllerWithParentvc:(UIViewController*)vc{
    
    WLContainerViewController *rvc = [[WLContainerViewController alloc] init];
    rvc.view.backgroundColor = [UIColor whiteColor];
    HWNavigationController *nvc = [[HWNavigationController alloc]initWithRootViewController:rvc];
    
    [vc presentViewController:nvc animated:YES completion:nil];
    
    
}

@end
