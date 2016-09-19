//
//  LoginVC.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "LoginVC.h"
#import "ClassVC.h"
#import "LoginView.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import <AFNetworking.h>
#import "VCNetworkingUtil.h"
#import "Global.h"
@interface LoginVC ()
@property(nonatomic,strong)LoginView* loginView;
@end

@implementation LoginVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.loginView=[LoginView new];
    [self.view addSubview:self.loginView];
    [self.loginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
    [self.loginView->loginBtn addTarget:self action:@selector(loginEvent) forControlEvents:UIControlEventTouchDown];


}

- (void)viewWillAppear:(BOOL)animated
{
        self.navigationController.navigationBarHidden=NO;
}

- (void)loginEvent
{
    NSString *username=self.loginView->userTextField.text;
    NSString *password=self.loginView->passwordTextField.text;
    if([username isEqualToString:@""]||[password isEqualToString:@""])
    {
        UILabel  * label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, 10, 320, 30)];
        label1.text = @"请填写完整信息";
        label1.textColor=[UIColor redColor];
        [self.view addSubview:label1];
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        [UIView setAnimationDuration:2.0];
        [UIView setAnimationDelegate:self];
        label1.alpha =0.0;
        label1.frame=CGRectMake(self.view.frame.size.width/3, 30, 320, 30);
        [UIView commitAnimations];
        return;
    }
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *operationManager=[VCNetworkingUtil httpJSONManager3];
    NSDictionary *parameter;
    
    parameter=@{@"teacherId":username,@"password":password};
    [operationManager GET:YJY_LOGINURL parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict=(NSDictionary *)responseObject;
        NSLog(@"------登录返回结果------%@",responseDict);
        NSString *result = [NSString stringWithFormat:@"%@",responseDict[@"result"]];
        if([result isEqualToString:@"1"])
        {
            //登录成功时跳转
                UIStoryboard *mainSB = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
                UITabBarController * tabbar=[mainSB instantiateViewControllerWithIdentifier:@"tabbar"];
                [self.navigationController pushViewController:tabbar animated:YES];
        }
        else if([result isEqualToString:@"0"])
        {
            UILabel  * label1 = [[UILabel alloc]initWithFrame:CGRectMake(self.view.frame.size.width/3, 10, 320, 30)];
            label1.text = @"用户名或密码错误";
            label1.textColor=[UIColor redColor];
            [self.view addSubview:label1];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
            [UIView setAnimationDuration:2.0];
            [UIView setAnimationDelegate:self];
            label1.alpha =0.0;
            label1.frame=CGRectMake(self.view.frame.size.width/3, 30, 320, 30);
            [UIView commitAnimations];
        }
        [hud hideAnimated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----->登录出错的原因:%@",error.localizedDescription);
        
        [hud hideAnimated:YES];
    }];
}

@end
