//
//  LoginView.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "LoginView.h"
#import "Masonry.h"
@implementation LoginView

- (id)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if(self)
    {
        [self initView];
    }
    return self;
}

#pragma mark 初始化界面
- (void)initView
{
    bacImgview=[UIImageView new];
    loginImgview=[UIImageView new];
    userTextField=[UITextField new];
    passwordTextField=[UITextField new];
    loginBtn=[UIButton new];
    loginInf=[UILabel new];
    
    [self addSubview:bacImgview];
    [self addSubview:loginImgview];
    [self addSubview:userTextField];
    [self addSubview:passwordTextField];
    [self addSubview:loginBtn];
    [self addSubview:loginInf];
    
    [bacImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self);
    }];
    bacImgview.image=[UIImage imageNamed:@"bac.jpg"];
    [loginImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(70);
        //make.centerY.equalTo(self);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(130, 130));
    }];
    loginImgview.image=[UIImage imageNamed:@"yjyLogo.jpg"];
    loginImgview.layer.masksToBounds=YES;
    loginImgview.layer.cornerRadius=30;
    [userTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(loginImgview.mas_bottom).with.offset(5);
        make.height.equalTo(@35);
        make.width.equalTo(@250);
    }];
    userTextField.placeholder=@"用户名";
    userTextField.borderStyle=UITextBorderStyleRoundedRect;
    userTextField.delegate=self;
    [passwordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(userTextField.mas_bottom);
        make.height.equalTo(@35);
        make.width.equalTo(@250);
    }];
    passwordTextField.placeholder=@"密码";
    passwordTextField.secureTextEntry=YES;
    passwordTextField.borderStyle=UITextBorderStyleRoundedRect;
    passwordTextField.delegate=self;
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(passwordTextField.mas_bottom).with.offset(5);
        make.width.equalTo(@250);
        make.height.equalTo(@40);
    }];
    loginBtn.userInteractionEnabled=YES;
    loginBtn.backgroundColor=[UIColor orangeColor];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    userTextField.text=@"t123456";
    passwordTextField.text=@"123456";
}

#pragma mark 文本开始编辑时触发
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [loginImgview mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).with.offset(30);
        make.centerX.equalTo(self);
        make.height.equalTo(@0);
    }];
    loginImgview.hidden=YES;
    [loginInf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(loginImgview.mas_bottom).with.offset(5);
        make.centerX.equalTo(self);
        make.height.equalTo(@25);
        make.width.equalTo(@200);
    }];
    loginInf.text=@"登录粤教云";
    loginInf.font=[UIFont fontWithName:@"Helvetica-Bold" size:15];
    loginInf.textAlignment=NSTextAlignmentCenter;
    [userTextField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(loginImgview.mas_bottom).with.offset(40);
        make.height.equalTo(@35);
        make.width.equalTo(@250);
    }];
}

@end
