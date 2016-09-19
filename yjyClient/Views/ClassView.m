//
//  ClassView.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "ClassView.h"
#import "Masonry.h"


@implementation ClassView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

-(void)initView
{
    CGFloat padding=35.0;
    //初始化UI
    rollBtn=[UIButton new];
    groupBtn=[UIButton new];
    resBtn=[UIButton new];
    statisticBtn=[UIButton new];
    
    rollLabel=[UILabel new];
    groupLabel=[UILabel new];
    resLabel=[UILabel new];
    statisticLabel=[UILabel new];
    
    //添加UI到界面
    [self addSubview:rollBtn];
    [self addSubview:groupBtn];
    [self addSubview:resBtn];
    [self addSubview:statisticBtn];

    [self addSubview:rollLabel];
    [self addSubview:groupLabel];
    [self addSubview:resLabel];
    [self addSubview:statisticLabel];
    //设计UI布局
    
    [rollBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(70);
        make.left.equalTo(self).with.offset(padding);
        make.width.equalTo(groupBtn);
        make.height.equalTo(groupBtn);
    }];
    [rollBtn setBackgroundImage:[UIImage imageNamed:@"name.png"] forState:UIControlStateNormal];
    [rollLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(rollBtn);
        make.top.equalTo(rollBtn.mas_bottom).with.offset(5);
    }];
    rollLabel.text=@"学生点名";
    rollLabel.textColor=[UIColor greenColor];
    rollLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
    [groupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(rollBtn.mas_right).with.offset(padding);
        make.right.equalTo(self).with.offset(-padding);
        make.centerY.equalTo(rollBtn);
    }];
    [groupBtn setBackgroundImage:[UIImage imageNamed:@"group.png"] forState:UIControlStateNormal];
    [groupLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(groupBtn);
        make.top.equalTo(groupBtn.mas_bottom).with.offset(5);
    }];
    groupLabel.text=@"学生分组";
    groupLabel.textColor=[UIColor greenColor];
    groupLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
    [resBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(padding);
        make.top.equalTo(rollBtn.mas_bottom).with.offset(padding);
        make.bottom.equalTo(self).with.offset(-100);
        make.width.equalTo(groupBtn);
        make.height.equalTo(groupBtn);
    }];
    [resBtn setBackgroundImage:[UIImage imageNamed:@"resource.png"] forState:UIControlStateNormal];
    [resLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(resBtn);
        make.top.equalTo(resBtn.mas_bottom).with.offset(5);
    }];
    resLabel.text=@"课件资源";
    resLabel.textColor=[UIColor greenColor];
    resLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
    [statisticBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(resBtn.mas_right).with.offset(padding);
        make.right.equalTo(self).with.offset(-padding);
        make.centerY.equalTo(resBtn);
        make.width.equalTo(groupBtn);
        make.height.equalTo(groupBtn);
    }];
    [statisticBtn setBackgroundImage:[UIImage imageNamed:@"statistic.png"] forState:UIControlStateNormal];
    [statisticLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(statisticBtn);
        make.top.equalTo(statisticBtn.mas_bottom).with.offset(5);
    }];
    statisticLabel.text=@"信息统计";
    statisticLabel.textColor=[UIColor greenColor];
    statisticLabel.font=[UIFont fontWithName:@"Helvetica-Bold" size:22];
    
    
    
}
@end
