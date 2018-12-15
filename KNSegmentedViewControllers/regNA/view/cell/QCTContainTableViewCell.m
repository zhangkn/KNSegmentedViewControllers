//
//  QCTContainTableViewCell.m
//  kaiDianBao
//
//  Created by mac on 2018/12/13.
//  Copyright © 2018 QCT. All rights reserved.
//

#import "QCTContainTableViewCell.h"



@implementation QCTContainTableViewCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;//去掉选中效果
        
        
        [self selfInit];
        [self createSubView];
        //        [self bindViewModel];
        
        
    }
    return self;
}

- (void)selfInit{
    
    self.contentView.backgroundColor = [UIColor whiteColor];
    
}

- (void)createSubView {
    
    [self.contentView addSubview:self.tv];
    
    [self addConstraints];
    
}
- (void)addConstraints {
    WS(weakSelf);
    
    [self.tv mas_makeConstraints:^(MASConstraintMaker *make) {
        //        make.width.equalTo(weakSelf.contentView);
//        make.right.bottom.left.equalTo(weakSelf.contentView);
        
//        make.top.equalTo(weakSelf.contentView).offset(0);
        
        // 根据textView model 的内容进行高度计算
//        make.height.mas_equalTo(kAdjustRatio(200));//kAdjustRatio
    }];
    
    
}



static NSString *identifier = @"QCTContainTableViewCell";

+ (instancetype) tableViewCellWithTableView:(UITableView *) tableView{
    
    QCTContainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {// ------并不会执行
        
        cell = [[QCTContainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        
    }
    return cell;
}

@end
