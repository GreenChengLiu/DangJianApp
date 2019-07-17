//
//  OrganizationalModel.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/15.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class ChildrenModel;
@interface OrganizationalModel : NSObject

@property (nonatomic, assign) NSInteger orid;// 18,
@property (nonatomic, assign) NSInteger pid;// 0,
@property (nonatomic, copy) NSString *full_name;// "中共延长油田股份有限公司定边采油厂学庄采油队支部委员会",
@property (nonatomic, copy) NSString *name;// "学庄采油队党支部",
@property (nonatomic, copy) NSString *img;// "",
@property (nonatomic, copy) NSString *type;// "631 党支部",
@property (nonatomic, copy) NSString *danwei;// "",
@property (nonatomic, copy) NSString *shuji;// "李云峰",
@property (nonatomic, copy) NSString *fushuji;// "思宏平",
@property (nonatomic, copy) NSString *shujidianhua;// "13488024111",
@property (nonatomic, copy) NSString *xuanchuanweiyuan;// "张国强",
@property (nonatomic, copy) NSString *gongwei;// "",
@property (nonatomic, copy) NSString *zuzhiweiyuan;// "张宝权",
@property (nonatomic, copy) NSString *jijianweiyuan;// "杨志儒",
@property (nonatomic, copy) NSString *qingnianweiyuan;// "张国强",
@property (nonatomic, copy) NSString *connect_user_name;// "岳红江",
@property (nonatomic, copy) NSString *phone;// "13639129777",
@property (nonatomic, assign) NSInteger create_time;// -28800,
@property (nonatomic, copy) NSString *intro;// "      学庄采油队党支部成立于2016年6月，目前支部共有党员30名，其中正式党员29名、预备党员1名，男党员25名、女党员5名。党员中大专（含）以上学历人数占全体党员人数的77%。",
@property (nonatomic, copy) NSString *address;// "定边县",
@property (nonatomic, assign) NSInteger youbian;// 0,
@property (nonatomic, copy) NSString *other_info;// "",
@property (nonatomic, assign) NSInteger ordid;// 2,
@property (nonatomic, copy) NSString *longitude;// "108.111131",
@property (nonatomic, copy) NSString *latitude;// "37.353653",
@property (nonatomic, copy) NSString *shangjiexuanju;// "",
@property (nonatomic, copy) NSString *url;// "/api/organization_structure/index/ogid/18.html",
@property (nonatomic, assign) NSInteger child;// 0,
@property (nonatomic, strong) NSArray *children;//
@end

@interface ChildrenModel : NSObject

@end
NS_ASSUME_NONNULL_END
