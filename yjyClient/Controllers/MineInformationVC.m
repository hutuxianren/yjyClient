//
//  MineInformationVC.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "MineInformationVC.h"
#import "MineInformationView.h"
#import "Masonry.h"
#import "mineCell.h"
#import "AboutVC.h"
@interface MineInformationVC ()
@property(nonatomic,strong)MineInformationView * mineView;
 @property(nonatomic,strong)   UITableView * mineTable;//个人栏目表格
@end

@implementation MineInformationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mineTable=[UITableView new];
    self.mineView=[MineInformationView new];
    
    [self.view addSubview:self.mineTable];
    [self.view addSubview:self.mineView];


    [self.mineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(30);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@250);
    }];
    [self.mineTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mineView.mas_bottom).with.offset(-50);
        make.left.and.right.equalTo(self.view);
        make.height.equalTo(@200);
    }];
    self.mineTable.dataSource=self;
    self.mineTable.delegate=self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellId=@"mineCell";
    mineCell * cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
    {
        cell=[[mineCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSInteger rowNo=indexPath.row;
    switch (rowNo) {
        case 0:
            cell.leftImage.image=[UIImage imageNamed:@"mine.png"];
            cell.wenziLabel.text=@"个人信息";
            break;
        case 1:
            cell.leftImage.image=[UIImage imageNamed:@"downloaded.png"];
            cell.wenziLabel.text=@"我的下载";
            break;
        case 2:
            cell.leftImage.image=[UIImage imageNamed:@"about.png"];
            cell.wenziLabel.text=@"关于";
            break;
            
        default:
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSInteger rowNo=indexPath.row;
    switch (rowNo) {
        case 0://个人信息
            
            break;
        case 1://我的下载
            
            break;
        case 2://关于
        {
            AboutVC *aboutVC=[AboutVC new];
            [self.navigationController pushViewController:aboutVC animated:NO];
        }
            break;
            
        default:
            break;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

@end
