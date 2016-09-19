//
//  MineInformationView.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/28.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "MineInformationView.h"
#import "Masonry.h"

@implementation MineInformationView
- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

- (void)initView
{
    infBacImageview=[UIImageView new];
    headImageview=[UIImageView new];

    
    [self addSubview:infBacImageview];
    [infBacImageview addSubview:headImageview];


    [infBacImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.left.and.right.equalTo(self);
        make.height.mas_equalTo(250);
    }];
    infBacImageview.image=[UIImage imageNamed:@"infBac.jpg"];
    
    [headImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(infBacImageview);
        make.centerY.equalTo(infBacImageview);
        make.size.mas_equalTo(CGSizeMake(120, 120));
    }];
    headImageview.image=[UIImage imageNamed:@"default.jpg"];
    headImageview.layer.masksToBounds=YES;
    headImageview.layer.cornerRadius=30;
    



    
}



@end
