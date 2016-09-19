//
//  ResourceVC.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/25.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "ResourceVC.h"
#import "ResourceView.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import <AFNetworking.h>
#import "VCNetworkingUtil.h"
#import "Global.h"
#import "fileCell.h"
#import "fileModel.h"
#import "YYModel.h"
@interface ResourceVC ()
@property(nonatomic,strong)ResourceView * resView;
@property(nonatomic,strong)UITableView * fileTable;//文件列表表格

@property(nonatomic,strong)NSMutableArray * fileArray;
@end

@implementation ResourceVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.fileArray=[NSMutableArray new];
    //self.resView=[ResourceView new];
    //[self.view addSubview:self.resView];
    //[self.resView mas_makeConstraints:^(MASConstraintMaker *make) {
      //  make.size.equalTo(self.view);
    //}];
    //self.resView.backgroundColor=[UIColor redColor];
    [self setupView];
    [self getFileList];
}

- (void)getFileList
{
    
    MBProgressHUD *hud=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    AFHTTPSessionManager *operationManager=[VCNetworkingUtil httpJSONManager2];
    NSDictionary *parameter;
    
    parameter=@{@"ownerId":@"ddr",@"path":@"/"};
    [operationManager GET:YJY_FILELIST parameters:parameter progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *responseDict=(NSDictionary *)responseObject;
        NSLog(@"%@",responseDict[@"files"]);
        if(![responseDict[@"files"] isEqual:[NSNull null]])
        {
        for(NSDictionary * json in responseDict[@"files"])
        {
            fileModel * file=[fileModel yy_modelWithJSON:json];
            [self.fileArray addObject:file];
        }
        }
        [self.fileTable reloadData];
        
        NSLog(@"------文件列表返回结果------%@",responseDict);
        
        [hud hideAnimated:YES];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"----->文件列表出错的原因:%@",error.localizedDescription);
        
        [hud hideAnimated:YES];
    }];
}

#pragma mark 初始化界面
- (void)setupView
{
    self.fileTable=[UITableView new];
    self.fileTable.dataSource=self;
    self.fileTable.delegate=self;
    [self.view addSubview:self.fileTable];
    [self.fileTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(self.view);
    }];
}
#pragma mark tableview datasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fileArray.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    fileModel * model=self.fileArray[indexPath.row];
    static NSString * cellId=@"fileCell";
    fileCell  * cell=[tableView dequeueReusableCellWithIdentifier:cellId];
    if(!cell)
    {
        cell=[[fileCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    if(![model.fileOriginalName isEqualToString:@""])
    {
    cell->filenameLabel.text=model.fileOriginalName;
    }
    
    if(![model.fileSize isEqualToString:@""]||![model.fileSize isKindOfClass:NULL])
    {
        cell->fileSizeLabel.text=model.fileSize;
    }
    
    if(![model.fileType isEqualToString:@""]||![model.fileType isKindOfClass:NULL])
    {
        NSString * fileType=model.fileType;
        cell->fileTypeLabel.text=fileType;
        if([fileType isEqualToString:@"mp4"])
        {
            cell->fileImg.image=[UIImage imageNamed:@"mp4.png"];
        }
        else if([fileType isEqualToString:@"jpg"])
        {
            cell->fileImg.image=[UIImage imageNamed:@"jpg.png"];
        }
        else if([fileType isEqualToString:@"directory"])
        {
            cell->fileImg.image=[UIImage imageNamed:@"folder.png"];
        }
    }
    if(![model.uploadTime isEqualToString:@""]||![model.uploadTime isKindOfClass:NULL])
    {
        cell->fileTimeLabel.text=model.uploadTime;
    }
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 100;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //[dataArray removeObjectAtIndex:indexPath.row];
        // Delete the row from the data source.
        //[testTableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {

    }
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"下载";
}


@end
