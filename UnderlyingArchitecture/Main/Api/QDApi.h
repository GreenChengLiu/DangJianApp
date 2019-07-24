//
//  QDApi.h
//  com.quDongChina
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^ApiDataRequest)(NSDictionary *dict);  //成功回调;
typedef void (^ApiRequestError)(NSError *error);
typedef void(^ApiOtherRequest)(NSInteger index);

@interface QDApi : NSObject

+ (void)apiRequestWithRequestMethod:(NSString *)method Url:(NSString *)url andJson:(NSDictionary *)json andBlock:(ApiDataRequest)block andError:(ApiRequestError)err;

+ (void)apiRequestOtherRequestMethod:(NSString *)method Url:(NSString *)url andJson:(NSDictionary *)json andBlock:(ApiOtherRequest)block andError:(ApiRequestError)err;

/**
 通过body来传递参数

 @param body 参数
 @param url 网址
 @param block 成功
 @param err 失败
 */
+ (void)apiRequestWithBody:(NSDictionary *)body andMethod:(NSString *)method url:(NSString *)url andBlock:(ApiDataRequest)block andError:(ApiRequestError)err;

@end

NS_ASSUME_NONNULL_END
