//
//  CardeReportModel.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "CardeReportModel.h"

@implementation CardeReportModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"carid" : @"id"
             };
}
@end



@implementation shenPiModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"shenid" : @"id"
             };
}

@end
