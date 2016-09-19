//
//  mineCell.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/29.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "mineCell.h"
#import "Masonry.h"
@implementation mineCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initCellView];
    }
    return self;
}

- (void)initCellView
{
    self.leftImage=[UIImageView new];
    self.wenziLabel=[UILabel new];
    [self.contentView addSubview:self.leftImage];
    [self.contentView addSubview:self.wenziLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self.leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    [self.wenziLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.leftImage.mas_right).with.offset(10);
                make.size.mas_equalTo(CGSizeMake(200, 30));
    }];
}
@end
