//
//  KNTopButton.h
//  SegmentView
//
//  Created by mac on 2018/12/12.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,TopButtonIndex) {
    TopButtonIndexFirst = 1000,
    TopButtonIndexSecond,
};


NS_ASSUME_NONNULL_BEGIN


@interface KNTopButton : UIButton




+ (NSMutableArray *)MoveToSuperviewWithTitles:(NSArray*)titles superView:(UIView*)superView;

@end

NS_ASSUME_NONNULL_END
