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

@end

NS_ASSUME_NONNULL_END
