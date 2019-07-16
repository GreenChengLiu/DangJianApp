//
//  PartyModel.m
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import "PartyModel.h"

@implementation PartyModel

@end


@implementation CadreModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"cadreid" : @"id"
             };
}

@end


@implementation CadreUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"userid" : @"id"
             };
}

@end


@implementation AssessmentModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"assessid" : @"id"
             };
}

@end

@implementation AssessmentTypeModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"typeID" : @"id"
             };
}
@end
