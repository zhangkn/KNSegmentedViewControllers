//
//  ViewController.m
//  KNSegmentedViewControllers
//
//  Created by mac on 2018/12/14.
//  Copyright © 2018 kunnan. All rights reserved.
//

#import "ViewController.h"
#import "WLContainerViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    [WLContainerViewController presentViewControllerWithParentvc:self];

}
@end
