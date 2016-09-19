//
//  fileModel.m
//  yjyClient
//
//  Created by 涂逸欣 on 16/8/28.
//  Copyright © 2016年 涂逸欣. All rights reserved.
//

#import "fileModel.h"

@implementation fileModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"fileOriginalName" : @"fileOriginalName",
             @"fileOwner" : @"fileOwner",
             @"filePath" : @"filePath",
             @"fileSize" : @"fileSize",
             @"fileType" : @"fileType",
             @"fileUrl" : @"fileUrl",
             @"parentDirectory" : @"parentDirectory",
             @"uploadTime" : @"uploadTime",
             };
}
@end
