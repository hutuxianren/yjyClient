//
//  fileModel.h
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/28.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface fileModel : NSObject
@property(nonatomic,strong)NSString * fileOriginalName;
@property(nonatomic,strong)NSString * fileOwner;
@property(nonatomic,strong)NSString * filePath;
@property(nonatomic,strong)NSString * fileSize;
@property(nonatomic,strong)NSString * fileType;
@property(nonatomic,strong)NSString * fileUrl;
@property(nonatomic,strong)NSString * parentDirectory;
@property(nonatomic,strong)NSString * uploadTime;

@end
