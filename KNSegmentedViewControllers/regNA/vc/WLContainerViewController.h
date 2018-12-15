//

#import <UIKit/UIKit.h>
#import "KNmasterRegView.h"
#import "HWNavigationController.h"
#import "QCTBasicInformationViewController.h"
#import "QCTREGViewModel.h"
#import "QCTUploadStorePhotosViewController.h"
typedef enum
{
    /** login  */
    WLContainerViewControllerTypeFirst   = 0,
    /** reg   */
    WLContainerViewControllerTypeSecond    = 1,
    
} WLContainerViewControllerType;

@interface WLContainerViewController : UIViewController


- (instancetype)initWithfirstvc:(UIViewController*)first  secondvc :(UIViewController*)second;

@property (strong,nonatomic) UIViewController *first;
@property (strong,nonatomic) UIViewController *second;

//展现controller
- (void) displayContentController: (UIViewController*) content;
//隐藏controller
- (void) hideContentController: (UIViewController*) content;
//页面切换
- (void)cycleFromViewController: (UIViewController*) oldVC
               toViewController: (UIViewController*) newVC;



+ (void)presentViewControllerWithParentvc:(UIViewController*)vc;


@end
