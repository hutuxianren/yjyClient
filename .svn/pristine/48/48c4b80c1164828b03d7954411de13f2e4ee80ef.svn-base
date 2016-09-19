//
//  AboutVC.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/29.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "AboutVC.h"
#import "Masonry.h"
@interface AboutVC ()
@property(nonatomic,strong)UIImageView * logoImageview;
@property(nonatomic,strong)UILabel     * copyrightLabel;
@end

@implementation AboutVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView
{
    self.logoImageview=[UIImageView new];
    self.copyrightLabel=[UILabel new];
    [self.view addSubview:self.logoImageview];
    [self.view addSubview:self.copyrightLabel];
    self.view.backgroundColor=[UIColor whiteColor];
    [self.logoImageview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(70);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    self.logoImageview.image=[UIImage imageNamed:@"yjyLogo.jpg"];
    
    [self.copyrightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.logoImageview.mas_bottom).with.offset(10);
        make.centerX.equalTo(self.view);
        make.width.equalTo(@320);
    }];
    self.copyrightLabel.text=@"@2016 luluteam&yjy. All rights reserved";
    self.copyrightLabel.textColor=[UIColor lightGrayColor];
}


@end
