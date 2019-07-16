//
//  QDApi.m
//  com.quDongChina
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "QDApi.h"

@implementation QDApi

+ (void)apiRequestWithRequestMethod:(NSString *)method Url:(NSString *)url andJson:(NSDictionary *)json andBlock:(ApiDataRequest)block  andError:(ApiRequestError)err{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];  //上传普通格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //AFN 不会进行解析,需要自己解析.
    
//    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
//    manager.requestSerializer.timeoutInterval = 10.f;
//    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    if ([method isEqualToString:@"post"]) {
        [manager POST:url parameters:json progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            block(dict);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            err(error);
        }];
    } else {
        [manager GET:url parameters:json progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            block(dict);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            err(error);
        }];
    }
    [QDApi AFNReachAbility];
}

+ (void)apiRequestOtherRequestMethod:(NSString *)method Url:(NSString *)url andJson:(NSDictionary *)json andBlock:(ApiOtherRequest)block andError:(ApiRequestError)err{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];  //上传普通格式
    manager.responseSerializer = [AFHTTPResponseSerializer serializer]; //AFN 不会进行解析,需要自己解析.
    
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    manager.requestSerializer.timeoutInterval = 10.f;
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    if ([method isEqualToString:@"post"]) {
        [manager POST:url parameters:json progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            
            NSLog(@"responseObject:%@",string);
            block([string integerValue]);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            err(error);
        }];
    } else {
        [manager GET:url parameters:json progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            NSLog(@"responseObject:%@",responseObject);
            block([string integerValue]);
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            err(error);
        }];
    }
    [QDApi AFNReachAbility];
}

+ (void)AFNReachAbility{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
                NSLog(@"未知网络");
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                NSLog(@"没有网络");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                NSLog(@"wifi");
                SET_OBJECT_USERDEFAULTS(@"wifi", @"AFStatus");
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                NSLog(@"4G");
                SET_OBJECT_USERDEFAULTS(@"4G", @"AFStatus");
            }
                break;
            default:
                break;
        }
        
    }];
    [manager startMonitoring];
}

@end
