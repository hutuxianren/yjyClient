//
//  VCNetworkingUtil.h
//  YUE
//
//  Created by Vic on 14-8-16.
//  Copyright (c) 2014年 vic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "Global.h"

typedef void(^SuccesBlock)(id responder);
typedef void(^FailBlock)(id error);

@interface VCNetworkingUtil : NSObject

/**
 *    网络请求manager
 *
 *    @return 网络请求manager
 */
+(AFHTTPSessionManager *)httpManager;

/**
 *  发送封装格式是JSON，返回格式也是JSON的网络请求Manager
 *
 *  @return AFHTTPRequestManager*
 */
+(AFHTTPSessionManager *)httpJSONManager;

/**
 *  生成一个返回JSON格式的网络请求Manager
 *
 *  @return AFHTTPRequestManager*
 */
+(AFHTTPSessionManager *)httpJSONManager2;

/**
 *  生成一个返回JSON格式的网络请求Manager
 *   朋友圈评论数据暂时获取
 *  @return AFHTTPRequestManager*
 */
+(AFHTTPSessionManager *)httpJSONManager3;

/**
 *    将字典类型数据解析成字符类型
 *
 *    @param dic 要传入的字典类型数据
 *
 *    @return 解析成的字符类型
 */
+(NSString *)parseDicToJson:(NSDictionary *)dic;

/**
 *    如果responseObject为NSData类型，将其转成NSDictionary类型
 *
 *    @param object responseObject
 *
 *    @return 字典类型数据
 */
+(NSDictionary *)parseDataToDict:(id)object;

+(NSDictionary *)parseJSONPToDict:(id)object;

/**
 *    网络请求GET
 *
 *    @return 返回json格式的AnyObject
 */
//+(id)AFNewWorkingHttpGet:(NSString*)url withParameters:(NSDictionary*)parameters withOperationManger:(AFHTTPRequestOperationManager*)operationManager;
/**
 *
 *
 *  @param baseURLStr         根URL字符串
 *  @param requestSerializer  请求序列类型
 *  @param responseSerializer 返回序列类型
 *
 *  @return 自定义的AFHTTPRequestOperationManager
 */
+(AFHTTPSessionManager *)httpManagerWithUrlStr:(NSString*)baseURLStr requestSerializer:(AFHTTPRequestSerializer *)requestSerializer reponseSerializer:(AFHTTPResponseSerializer *)responseSerializer;

/**
 *上传视频
 *
 */

+ (AFHTTPSessionManager *)uploadVideoWithUrl:(NSString *)url videoData:(NSData*)videoData andSucces:(SuccesBlock)succes andFail:(FailBlock)fail;
/**
 *上传图片
 *
 */

+ (AFHTTPSessionManager *)uploadImageWithUrl:(NSString *)url
                                         image:(UIImage *)image andSucces:(SuccesBlock)succes andFail:(FailBlock)fail;

+(AFHTTPSessionManager *)uploadChatImageWithUrl:(NSString *)url
                                            image:(UIImage *)image andSucces:(SuccesBlock)succes andFail:(FailBlock)fail;
//上传音频
+ (AFHTTPSessionManager *)uploadAudioWithUrl:(NSString *)url AudioData:(NSData *)audioData andSucces:(SuccesBlock)succes andFail:(FailBlock)fail;
/**
 *
 *
 *  @param baseURLStr         根URL字符串
 *  @param requestSerializer  请求序列类型
 *  @param responseSerializer 返回序列类型
 *
 *  @return 自定义的AFHTTPRequestOperationManager
 */
//+(AFHTTPRequestOperationManager *)RequestType:(RequestType)GETOrPOST url:(NSString*)subURL useCachePolicy:(BOOL)isUseCachePolicy requestSerializer:(AFHTTPRequestSerializer *)requestSerializer reponseSerializer:(AFHTTPResponseSerializer *)responseSerializer success:^(id responder) fail:^(id error);

/**
 *
 *
 *  @param subURL            子URL字符串
 *  @param isUseCachePolicy  是否使用数据缓存的请求模式
 *  @param succesBlock       请求成功后调用的块
 *  @param failBlock         请求失败后调用的块
 
 */
//+(void)RequestWithURL:(NSString*)subURL isUseCachePolicy:(BOOL)isUseCachePolicy succesBlock:(void(^)(id responder))succesBlock failBlock:(void(^)(id error))failBlock;




@end
