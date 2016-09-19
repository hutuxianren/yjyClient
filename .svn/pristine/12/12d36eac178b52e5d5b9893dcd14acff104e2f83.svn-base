//
//  ClassVC.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "ClassVC.h"
#import "ClassView.h"
#import "Masonry.h"
@interface ClassVC ()
@property(nonatomic,strong)ClassView * classView;
@end

@implementation ClassVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"课堂";
        //self.navigationController.navigationBarHidden=NO;
    self.classView=[ClassView new];
    [self.view addSubview:self.classView];
    [self.classView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}



@end
