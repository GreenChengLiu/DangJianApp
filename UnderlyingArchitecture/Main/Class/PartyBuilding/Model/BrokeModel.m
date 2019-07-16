//
//  BrokeModel.m
//  com.quDongChina
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import "BrokeModel.h"

@implementation BrokeModel

+ (NSDictionary *)mj_objectClassInArray{
    return @{
             @"comment_list":[commentListModel class]
             };
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"brokeid" : @"id"
             };
}
@end


@implementation commentListModel

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"coID" : @"id"
             };
}



@end
