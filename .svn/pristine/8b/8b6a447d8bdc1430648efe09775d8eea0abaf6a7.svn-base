//
//  VCNetworkingUtil.m
//  YUE
//
//  Created by Vic on 14-8-16.
//  Copyright (c) 2014年 vic. All rights reserved.
//

#import "VCNetworkingUtil.h"
#import "Reachability.h"
#define HH_REQUEST_BASERUL @"HTTP"
@implementation VCNetworkingUtil

+(AFHTTPSessionManager *)httpManager
{
    NSString * requestBaseUrl = HH_REQUEST_BASERUL;
    NSURL *baseURL = [NSURL URLWithString:requestBaseUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//    manager.requestSerializer.cachePolicy = [self suitableCachePolicy];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    return manager;
}

+(AFHTTPSessionManager *)httpManagerWithUrlStr:(NSString*)baseURLStr requestSerializer:(AFHTTPRequestSerializer *)requestSerializer reponseSerializer:(AFHTTPResponseSerializer *)responseSerializer
{
     NSURL *baseURL = [NSURL URLWithString:baseURLStr];
     AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer = responseSerializer;
    return manager;
}


+(AFHTTPSessionManager *)httpJSONManager
{
    NSString * requestBaseUrl = HH_REQUEST_BASERUL;
    NSURL *baseURL = [NSURL URLWithString:requestBaseUrl];
    AFHTTPSessionManager *manager=[[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
    AFJSONRequestSerializer *requestSerializer = [AFJSONRequestSerializer serializer];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    manager.requestSerializer = requestSerializer;
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
      manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    return manager;
}

//文件服务器
+(AFHTTPSessionManager *)httpJSONManager2
{
    NSString * requestBaseUrl = YJY_FILEBASEURL;
    NSURL *baseURL = [NSURL URLWithString:requestBaseUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];

    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    return manager;
}

//web服务器
+(AFHTTPSessionManager *)httpJSONManager3
{
    NSString * requestBaseUrl = YJY_WEBBASEURL;
    NSURL *baseURL = [NSURL URLWithString:requestBaseUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/html", nil];
    return manager;
}


+(NSString *)parseDicToJson:(NSDictionary *) dic
{
    NSError *error;
    NSData * jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString * json = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    return json;
}

+(NSDictionary *)parseDataToDict:(id)object
{
    NSData *data = (NSData *)object;
    NSDictionary *responseDict;
    NSError *error;
    if (data != nil) {
        responseDict = [NSJSONSerialization JSONObjectWithData:data
                                                       options:NSJSONReadingMutableContainers
                                                         error:&error];
    }
    return responseDict;
}

+ (NSDictionary *)parseJSONPToDict:(id)responseObject
{
    NSMutableString* dataStr = [[NSMutableString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
    NSString *dataDictStr = [dataStr substringWithRange:NSMakeRange(9, [dataStr length] - 2-9)];
    NSData* jsonData=[dataDictStr dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary* responseDict = [self parseDataToDict:jsonData];
    
    return responseDict;
}


+ (AFHTTPSessionManager *)uploadImageWithUrl:(NSString *)url image:(UIImage *)image andSucces:(SuccesBlock)succes andFail:(FailBlock)fail

{
    
    AFHTTPSessionManager *manager = self.httpManager;
    
     NSDictionary *parameters = @{@"fileCategory":@"2",@"needCut":@"false"};
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:@"imageFile" fileName:fileName mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传头像成功啦,url:%@",task);
        succes(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
    }];
    return manager;
}

#pragma mark 上传视频文件到服务器
+ (AFHTTPSessionManager *)uploadVideoWithUrl:(NSString *)url videoData:(NSData*)videoData andSucces:(SuccesBlock)succes andFail:(FailBlock)fail

{
    
    AFHTTPSessionManager *manager = self.httpManager;
    
    NSDictionary *parameters = @{@"fileCategory":@"2"};
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        //NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.mp4", str];
        
        // 上传视频，以文件流的格式
        [formData appendPartWithFileData:videoData name:@"uploadFile" fileName:fileName mimeType:@"video/mp4"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功啦,url:%@",task);
        succes(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
        NSLog(@"上传失败啦");
    }];
    return manager;
}

+ (AFHTTPSessionManager *)uploadChatImageWithUrl:(NSString *)url image:(UIImage *)image andSucces:(SuccesBlock)succes andFail:(FailBlock)fail

{
    
    AFHTTPSessionManager *manager = self.httpManager;
    
    NSDictionary *parameters = @{@"fileCategory":@"3"};
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.jpg", str];
        
        // 上传图片，以文件流的格式
        [formData appendPartWithFileData:imageData name:@"uploadFile" fileName:fileName mimeType:@"image/jpeg"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传成功啦,url:%@",task);
        succes(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
        NSLog(@"上传失败啦");
    }];
    return manager;
}

#pragma mark - 上传语音到服务器
+ (AFHTTPSessionManager *)uploadAudioWithUrl:(NSString *)url AudioData:(NSData *)audioData andSucces:(SuccesBlock)succes andFail:(FailBlock)fail
{
    AFHTTPSessionManager *manager = self.httpManager;
    NSDictionary *parameters = @{@"fileCategory":@"3"};
    [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"yyyyMMddHHmmss";
        NSString *str = [formatter stringFromDate:[NSDate date]];
        NSString *fileName = [NSString stringWithFormat:@"%@.amr", str];
        // 上传音频，以文件流的格式
        [formData appendPartWithFileData:audioData name:@"uploadFile" fileName:fileName mimeType:@"audio/amr"];
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"上传语音成功啦,url:%@",task);
        succes(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        fail(error);
        NSLog(@"上传失败啦");
    }];
    return manager;
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
+(NSURLRequestCachePolicy)suitableCachePolicy{
    // 缓存策略
    // 创建缓存策略
    NSURLRequestCachePolicy cachePolicy;
    // 检测并根据当前网络状态调整缓存策略
    Reachability *reach = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    switch ([reach currentReachabilityStatus]) {
        case NotReachable:
            cachePolicy = NSURLRequestReturnCacheDataDontLoad;
            //NSLog(@"无网络可用");
            break;
        case ReachableViaWiFi:
            cachePolicy = NSURLRequestReturnCacheDataElseLoad;
            //NSLog(@"可用WIFI");
            break;
        case ReachableViaWWAN:
            cachePolicy = NSURLRequestReturnCacheDataElseLoad;
            //NSLog(@"可用3G");
            break;
        default:
            cachePolicy = NSURLRequestUseProtocolCachePolicy;
            break;
    }
    return cachePolicy;
}
//////////////////////////////////////////具有缓存策略的网络请求///////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*    
    NSURLRequestUseProtocolCachePolicy = 0,//默认的cache policy，使用Protocol协议定义。
    NSURLRequestReloadIgnoringLocalCacheData = 1,//忽略缓存直接从原始地址下载。    //
    NSURLRequestReturnCacheDataElseLoad = 2,//只有在cache中不存在data时才从原始地址下载。
    NSURLRequestReturnCacheDataDontLoad = 3,//只使用cache数据，如果不存在cache，请求失败；用于没有建立网络连接离线模式
    如果有网络，采用2策略，若是没有网络，采用3策略，若果不适用缓存数据，就是用1策略
 */
/**
 *
 *  @param subURL            子URL字符串
 *  @param parameterDic      网络请求的参数，是字典类型
 *  @param isUseCachePolicy  是否使用数据缓存的请求模式
 *  @param succesBlock       请求成功后调用的Block块
 *  @param failBlock         请求失败后调用的Block块
 */

+(void)RequestWithURL:(NSString*)subURLStr
           parameters:(NSDictionary *)parameterDic
     isUseCachePolicy:(BOOL)isUseCachePolicy
          succesBlock:(void(^)(NSURLSessionDataTask *successTask, id responseObject))succesBlock
            failBlock:(void(^)(NSURLSessionDataTask *failTask, NSError *error))failBlock
{
    if (subURLStr.length == 0)
    {
        NSLog(@"无效的url");
        return;
    }else{
        subURLStr = [subURLStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    }
    
    // 缓存策略
    NSURLRequestCachePolicy cachePolicy;
    if (isUseCachePolicy == NO)
    {
        cachePolicy = NSURLRequestReloadIgnoringLocalCacheData;
    }else {
        // 检测并根据当前网络状态调整缓存策略
        cachePolicy = [self suitableCachePolicy];
    }
    NSString * requestBaseUrl = HH_REQUEST_BASERUL;
    NSURL *baseURL = [NSURL URLWithString:requestBaseUrl];
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithBaseURL:baseURL];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.requestSerializer.cachePolicy = cachePolicy;
    manager.requestSerializer.timeoutInterval = 30.0f;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    // 发起请求
    [manager GET:subURLStr parameters:parameterDic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        succesBlock(task,responseObject);
        
        NSLog(@"请求成功：%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failBlock(task,error);
        
        // 请求失败
        NSLog(@"请求失败：%@",[error description]);
    }];

}



@end
