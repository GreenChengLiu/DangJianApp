//
//  CardeReportModel.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/7/18.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class shenPiModel;

@interface CardeReportModel : NSObject

@property (nonatomic, assign) NSInteger carid;// 214,
@property (nonatomic, copy) NSString *name;// "张军海",
@property (nonatomic, copy) NSString *bumen;// "机修车间党支部",
@property (nonatomic, copy) NSString *zhiwu;// "副主任",
@property (nonatomic, copy) NSString *waichushiyou;// "去宝鸡，咸阳拉车床",
@property (nonatomic, copy) NSString *waichushijian;// "2019-07-15 00:00",
@property (nonatomic, copy) NSString *waichuqixian;// "3",
@property (nonatomic, copy) NSString *waichudidian;// "宝鸡，咸阳",
@property (nonatomic, copy) NSString *tongxingrenyuan;// "乔利平，许世显",
@property (nonatomic, copy) NSString *waichu_phone;// "15991928386",
@property (nonatomic, copy) NSString *other;// "赵振东，18191287666",
@property (nonatomic, copy) NSString *add_time;// "2019-07-15 09:59",
@property (nonatomic, assign) NSInteger status;// 0,
@property (nonatomic, assign) NSInteger shenpi1_status;// 1,
@property (nonatomic, copy) NSString *shenpi1_time;// "2019-07-15 10:01",
@property (nonatomic, copy) NSString *shenpi1_reason;// "同意",
@property (nonatomic, assign) NSInteger shenpi1_uid;// 766,
@property (nonatomic, assign) NSInteger hope1_uid;// null,
@property (nonatomic, assign) NSInteger shenpi2_status;// 1,
@property (nonatomic, copy) NSString *shenpi2_time;// "2019-07-15 10:47",
@property (nonatomic, copy) NSString *shenpi2_reason;// "",
@property (nonatomic, assign) NSInteger shenpi2_uid;// 1263,
@property (nonatomic, assign) NSInteger hope2_uid;// 1409,
@property (nonatomic, assign) NSInteger shenpi3_status;// 0,
@property (nonatomic, copy) NSString *shenpi3_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi3_reason;// "",
@property (nonatomic, assign) NSInteger shenpi3_uid;// 0,
@property (nonatomic, assign) NSInteger hope3_uid;// null,
@property (nonatomic, assign) NSInteger shenpi4_status;// "0",
@property (nonatomic, copy) NSString *shenpi4_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi4_reason;// "",
@property (nonatomic, assign) NSInteger shenpi4_uid;// 0,
@property (nonatomic, copy) NSString *hope4_uid;// null,
@property (nonatomic, assign) NSInteger shenpi5_status;// 0,
@property (nonatomic, copy) NSString *shenpi5_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi5_reason;// "",
@property (nonatomic, assign) NSInteger shenpi5_uid;// 0,
@property (nonatomic, assign) NSInteger hope5_uid;// null,
@property (nonatomic, copy) NSString *shuoming;// "",
@property (nonatomic, assign) NSInteger uid;// 1514,
@property (nonatomic, assign) NSInteger ogid;// 6,
@property (nonatomic, assign) NSInteger all_step;// 5,
@property (nonatomic, strong) NSDictionary *shenpi1user;
@property (nonatomic, strong) NSDictionary *shenpi2user;
@property (nonatomic, strong) NSDictionary *shenpi3user;
@property (nonatomic, strong) NSDictionary *shenpi4user;
@property (nonatomic, strong) NSDictionary *shenpi5user;

@end

@interface shenPiModel : NSObject
@property (nonatomic, assign) NSInteger shenid;// 1381,
@property (nonatomic, copy) NSString *dy_number;// "0051",
@property (nonatomic, copy) NSString *username;// "HQJGDZZ96",
@property (nonatomic, copy) NSString *idnumber;// "62282619840715453X",
@property (nonatomic, copy) NSString *password;// "e10adc3949ba59abbe56e057f20f883e",
@property (nonatomic, copy) NSString *name;// "王卓",
@property (nonatomic, copy) NSString *sex;// 1,
@property (nonatomic, copy) NSString *age;// 36,
@property (nonatomic, copy) NSString *birthday;// "19840715",
@property (nonatomic, copy) NSString *native_place;// "",
@property (nonatomic, copy) NSString *nationality;// "",
@property (nonatomic, copy) NSString *email;// "873963378@qq.com",
@property (nonatomic, copy) NSString *headimgurl;// "/public/uploads/20190111/ac569f3e4dbb67c3024a9f036cea21bd.png_small.png",
@property (nonatomic, copy) NSString *score;// 100,
@property (nonatomic, copy) NSString *qualifications;// "本科",
@property (nonatomic, assign) NSInteger reg_time;// 1527554505,
@property (nonatomic, copy) NSString *zhuanye;// "动力装备科科长",
@property (nonatomic, copy) NSString *jijifenzi_time;// null,
@property (nonatomic, copy) NSString *fazhanduixiang_time;// null,
@property (nonatomic, copy) NSString *yubei_time;// "-28800",
@property (nonatomic, copy) NSString *zhuanzheng_time;// "-28800",
@property (nonatomic, assign) NSInteger join_party_time;// -28800,
@property (nonatomic, copy) NSString *intrstime;// null,
@property (nonatomic, copy) NSString *introduce;// null,
@property (nonatomic, copy) NSString *where_now;// null,
@property (nonatomic, copy) NSString *address;// "定边县美好未来城3号楼一单元1101",
@property (nonatomic, assign) NSInteger logintime;// 0,
@property (nonatomic, assign) NSInteger logouttime;// 0,
@property (nonatomic, assign) NSInteger loginnum;// 0,
@property (nonatomic, copy) NSString *phone;// "15399301888",
@property (nonatomic, assign) NSInteger ogid;// 35,
@property (nonatomic, copy) NSString *job;// "",
@property (nonatomic, assign) NSInteger start_job_time;// 0,
@property (nonatomic, assign) NSInteger renzhishijian;// 0,
@property (nonatomic, assign) NSInteger renzhinianxian;// 5,
@property (nonatomic, copy) NSString *ganbuleixing;// "1",
@property (nonatomic, assign) NSInteger status;// 1,
@property (nonatomic, assign) NSInteger lose;// 0,
@property (nonatomic, copy) NSString *losetime;// null,
@property (nonatomic, assign) NSInteger liudong_status;// 0,
@property (nonatomic, copy) NSString *liuchufangxiang;//": null,
@property (nonatomic, assign) NSInteger is_excellent;// 0,
@property (nonatomic, copy) NSString *excellent_add_time;//": null,
@property (nonatomic, copy) NSString *excellent_desc;//": null,
@property (nonatomic, copy) NSString *dangneizhiwu;// "",
@property (nonatomic, copy) NSString *zhicheng;// "暂未完善",
@property (nonatomic, copy) NSString *jianli;//": null,
@property (nonatomic, copy) NSString *jieshaoren;// "",
@property (nonatomic, assign) NSInteger is_admin;// 1,
@property (nonatomic, assign) NSInteger old_ogid;// 0,
@property (nonatomic, copy) NSString *old_ogname;// "",
@property (nonatomic, copy) NSString *dept;// "",
@property (nonatomic, copy) NSString *dangfei;// "",
@property (nonatomic, copy) NSString *none_party_cadre;// null,
@property (nonatomic, copy) NSString *level;// "D"
@end

NS_ASSUME_NONNULL_END
