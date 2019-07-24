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

+ (void)apiRequestWithBody:(NSDictionary *)body andMethod:(NSString *)method url:(NSString *)url andBlock:(ApiDataRequest)block andError:(ApiRequestError)err{
//    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
//    [request setHTTPMethod:method];
//    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil]];
    
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url parameters:nil error:nil];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:[NSJSONSerialization dataWithJSONObject:body options:NSJSONWritingPrettyPrinted error:nil]];
    AFHTTPResponseSerializer *responseSerializer = [AFHTTPResponseSerializer serializer];
    responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",
                                                 @"text/html",
                                                 @"text/json",
                                                 @"text/javascript",
                                                 @"text/plain",
                                                 nil];
    manager.responseSerializer = responseSerializer;
//    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.responseSerializer.acceptableContentTypes =
    
    NSURLSessionDataTask *task = [manager dataTaskWithRequest:request uploadProgress:nil downloadProgress:nil
                                            completionHandler:^(NSURLResponse * _Nonnull response, id  _Nullable responseObject, NSError * _Nullable error) {
                                                
                                                if (responseObject != nil) {
                                                    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
                                                    
                                                    block(dict);
                                                }
                                                if (error) {
                                                    err(error);
                                                }
                                            }];
    [task resume];
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
