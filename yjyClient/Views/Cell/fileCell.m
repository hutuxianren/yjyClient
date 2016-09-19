//
//  fileCell.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/28.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "fileCell.h"
#import "Masonry.h"
#define kBaseURL @"http://125.216.242.178:7080/YJYS/file/download?fileId=file25bed835-e845-4754-8a27-b8c05bd886df"
@implementation fileCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self initCellView];
        UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(action:)];
        [self.contentView addGestureRecognizer:gesture];
    }
    return self;
}

- (void)initCellView
{
    fileImg=[UIImageView new];
    filenameLabel=[UILabel new];
    fileTypeLabel=[UILabel new];
    fileTimeLabel=[UILabel new];
    fileSizeLabel=[UILabel new];

    [self.contentView addSubview:fileImg];
    [self.contentView addSubview:filenameLabel];
    [self.contentView addSubview:fileTypeLabel];
    [self.contentView addSubview:fileTimeLabel];
    [self.contentView addSubview:fileSizeLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [fileImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).with.offset(10);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        //make.height.mas_equalTo(self.contentView.frame.size.height*2/5);
    }];
    //fileImg.image=[UIImage imageNamed:@"doc.png"];
    
    [filenameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(fileImg.mas_top);
        make.left.equalTo(fileImg.mas_right).with.offset(10);
        make.height.equalTo(@14);
        make.width.equalTo(@300);
    }];
    filenameLabel.font=[UIFont systemFontOfSize:13];
    //filenameLabel.text=@"夏令营短信通知学生回复情况汇总";
    
    [fileTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(filenameLabel.mas_bottom).with.offset(5);
        make.left.equalTo(filenameLabel);
    }];
    //fileTypeLabel.text=@"doc";
    fileTypeLabel.font=[UIFont systemFontOfSize:10];
    fileTypeLabel.textColor=[UIColor lightGrayColor];
    
    [fileSizeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fileTypeLabel.mas_right).with.offset(5);
        make.top.equalTo(filenameLabel.mas_bottom).with.offset(5);
    }];
    //fileSizeLabel.text=@"220.0KB";
    fileSizeLabel.font=[UIFont systemFontOfSize:10];
    fileSizeLabel.textColor=[UIColor lightGrayColor];
    
    [fileTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fileSizeLabel.mas_right).with.offset(5);
        make.top.equalTo(filenameLabel.mas_bottom).with.offset(5);
    }];
    //fileTimeLabel.text=@"08-04 15:57";
    fileTimeLabel.font=[UIFont systemFontOfSize:10];
    fileTimeLabel.textColor=[UIColor lightGrayColor];
    

}

-(void)action:(UILongPressGestureRecognizer*)gesture{
    [self becomeFirstResponder];
    UIMenuItem *browse = [[UIMenuItem alloc] initWithTitle:@"在线预览" action:@selector(browseAction)];
    UIMenuItem *download = [[UIMenuItem alloc] initWithTitle:@"下载" action:@selector(downloadAction)];
    UIMenuItem *comment = [[UIMenuItem alloc] initWithTitle:@"评论" action:@selector(commentAction)];
    UIMenuController *menus = [[UIMenuController alloc] init];
    
    /**箭头的方向
     UIMenuControllerArrowDefault,
     UIMenuControllerArrowUp
     UIMenuControllerArrowDown
     UIMenuControllerArrowLeft
     UIMenuControllerArrowRight
     */
    
    menus.arrowDirection = UIMenuControllerArrowDown;
    menus.menuItems = @[browse,download,comment];
    //设置弹出的位置和箭头指向的控件
    [menus setTargetRect:CGRectMake(40, 0, 0, 0) inView:self.contentView];
    //弹出menu
    [menus setMenuVisible:YES animated:YES];
}
//由于某些控件在响应者链中不能成为第一响应者故重写canBecomeFirstResponder方法，返回YES，否则无法弹出menu
-(BOOL)canBecomeFirstResponder{
    return YES;
}
//弹出menu必须要实现这个方法
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    if (action == @selector(browseAction)||action == @selector(downloadAction)||action == @selector(commentAction)) {
        return YES;
    }
    //返回YES则弹出系统默认的menu
    return NO;
}
-(void)browseAction{
    //复制文本到粘贴板
    [UIPasteboard generalPasteboard].string = @"要复制的文字";
}
-(void)downloadAction{
    NSLog(@"下载");
    // 1. 创建url
    NSString *urlStr =kBaseURL;
    //urlStr = [urlStr stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *Url = [NSURL URLWithString:urlStr];
    
    // 创建请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:Url];
    
    // 创建会话
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDownloadTask *downLoadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            // 下载成功
            // 注意 location是下载后的临时保存路径, 需要将它移动到需要保存的位置
            NSError *saveError;
            // 创建一个自定义存储路径
            NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
            NSString *savePath = [cachePath stringByAppendingPathComponent:@"ddr.jpg"];
            NSURL *saveURL = [NSURL fileURLWithPath:savePath];
            NSLog(@"%@",cachePath);
            //NSLog(@"%@",saveURL);
            // 文件复制到cache路径中
            [[NSFileManager defaultManager] copyItemAtURL:location toURL:saveURL error:&saveError];
            if (!saveError) {
                NSLog(@"保存成功");
            } else {
                NSLog(@"error is %@", saveError.localizedDescription);
            }
        } else {
            NSLog(@"error is : %@", error.localizedDescription);
        }
    }];
    // 恢复线程, 启动任务
    [downLoadTask resume];
}
-(void)commentAction{
    
}


@end
