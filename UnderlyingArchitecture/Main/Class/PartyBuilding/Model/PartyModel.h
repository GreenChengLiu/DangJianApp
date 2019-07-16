//
//  PartyModel.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CadreModel;
@class CadreUserModel;
@class AssessmentModel;
@class AssessmentTypeModel;

@interface PartyModel : NSObject
@property (nonatomic, assign) NSInteger zuizhongdefen;// 27,
@property (nonatomic, assign) NSInteger uid; //1530,
@property (nonatomic, assign) NSInteger year; //2019,
@property (nonatomic, assign) NSInteger ogid;// 10,
@property (nonatomic, assign) NSInteger is_admin; //0,
@property (nonatomic, assign) NSInteger age; //48,
@property (nonatomic, copy) NSString *username;// "薛海强",
@property (nonatomic, copy) NSString *headimgurl;// "/public/uploads/20190123/cb4daad0e207265043d9498ddb8023ed.png_small.png"
@end


@interface CadreModel : NSObject
@property (nonatomic, assign) NSInteger cadreid;// 206,
@property (nonatomic, copy) NSString *name;//"张利波",
@property (nonatomic, copy) NSString *bumen;// "油田工程作业大队",
@property (nonatomic, copy) NSString *zhiwu;// "队长",
@property (nonatomic, copy) NSString *waichushiyou;// "陪妻子检查病",
@property (nonatomic, assign) NSInteger waichushijian;// 1562083200,
@property (nonatomic, copy) NSString *waichuqixian;// "3",
@property (nonatomic, copy) NSString *waichudidian;// "西安",
@property (nonatomic, copy) NSString *tongxingrenyuan;// "妻子",
@property (nonatomic, copy) NSString *waichu_phone;// "13389128868",
@property (nonatomic, copy) NSString *other;// "郑英13038970584",
@property (nonatomic, copy) NSString *add_time;// "2019-07-03 10:12",
@property (nonatomic, assign) NSInteger status;// 0,
@property (nonatomic, assign) NSInteger shenpi1_status;// 1,
@property (nonatomic, copy) NSString *shenpi1_time;// "2019-07-03 10:26",
@property (nonatomic, copy) NSString *shenpi1_reason;// "",
@property (nonatomic, assign) NSInteger shenpi1_uid;// 805,
@property (nonatomic, copy) NSString *hope1_uid;// null,
@property (nonatomic, assign) NSInteger shenpi2_status;// 0,
@property (nonatomic, copy) NSString *shenpi2_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi2_reason;// "",
@property (nonatomic, assign) NSInteger shenpi2_uid;// 0,
@property (nonatomic, copy) NSString *hope2_uid;// null,
@property (nonatomic, assign) NSInteger shenpi3_status;// 0,
@property (nonatomic, copy) NSString *shenpi3_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi3_reason;// "",
@property (nonatomic, assign) NSInteger shenpi3_uid;// 0,
@property (nonatomic, copy) NSString *hope3_uid;// null,
@property (nonatomic, copy) NSString *shenpi4_status;// "0",
@property (nonatomic, copy) NSString *shenpi4_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi4_reason;// "",
@property (nonatomic, assign) NSInteger shenpi4_uid;// 0,
@property (nonatomic, copy) NSString *hope4_uid;// null,
@property (nonatomic, assign) NSInteger shenpi5_status;// 0,
@property (nonatomic, copy) NSString *shenpi5_time;// "1970-01-01 08:00",
@property (nonatomic, copy) NSString *shenpi5_reason;// "",
@property (nonatomic, assign) NSInteger shenpi5_uid;// 0,
@property (nonatomic, copy) NSString *hope5_uid;// null,
@property (nonatomic, copy) NSString *shuoming;// "",
@property (nonatomic, assign) NSInteger uid;// 741,
@property (nonatomic, assign) NSInteger ogid;// 19,
@property (nonatomic, assign) NSInteger all_step;// 5,
@property (nonatomic, copy) NSString *headimg;// "/public/uploads/headimgurl/ytgczydd/5a3b24ff60230.JPG",
@property (nonatomic, strong) CadreUserModel *user;
@end

@interface CadreUserModel : NSObject
@property (nonatomic, assign) NSInteger userid;// 741,
@property (nonatomic, copy) NSString *dy_number;// "",
@property (nonatomic, copy) NSString *username;// "ytgczydd",
@property (nonatomic, copy) NSString *idnumber;// "612701199004190085",
@property (nonatomic, copy) NSString *password;// "6dca353c0e95e9e30bd48efc3b19a4db",
@property (nonatomic, copy) NSString *name;// "油田工程作业大队党支部",
@property (nonatomic, assign) NSInteger sex;// 2,
@property (nonatomic, assign) NSInteger age;// 30,
@property (nonatomic, copy) NSString *birthday;// "1990.04.19",
@property (nonatomic, copy) NSString *native_place;// "",
@property (nonatomic, copy) NSString *nationality;// "汉族",
@property (nonatomic, copy) NSString *email;// "1216521686@qq.com",
@property (nonatomic, copy) NSString *headimgurl;// "5a3b24ff60230.JPG",
@property (nonatomic, copy) NSString *score;// 100,
@property (nonatomic, copy) NSString *qualifications;// "本科",
@property (nonatomic, assign) NSInteger reg_time;// 1512371545,
@property (nonatomic, copy) NSString *zhuanye;// "党务专干",
@property (nonatomic, copy) NSString *jijifenzi_time;// null,
@property (nonatomic, copy) NSString *fazhanduixiang_time;// null,
@property (nonatomic, copy) NSString *yubei_time;// "0",
@property (nonatomic, copy) NSString *zhuanzheng_time;// "0",
@property (nonatomic, assign) NSInteger join_party_time;// 0,
@property (nonatomic, assign) NSInteger intrstime;// 0,
@property (nonatomic, copy) NSString *introduce;// null,
@property (nonatomic, copy) NSString *where_now;// null,
@property (nonatomic, copy) NSString *address;// "油田工程作业大队",
@property (nonatomic, assign) NSInteger logintime;// 1516154276,
@property (nonatomic, assign) NSInteger logouttime;// 1516154391,
@property (nonatomic, assign) NSInteger loginnum;// 142,
@property (nonatomic, copy) NSString *phone;// "18166691831",
@property (nonatomic, assign) NSInteger ogid;// 19,
@property (nonatomic, copy) NSString *job;// "党务专干",
@property (nonatomic, assign) NSInteger start_job_time;// 0,
@property (nonatomic, assign) NSInteger renzhishijian;// 0,
@property (nonatomic, assign) NSInteger renzhinianxian;// 5,
@property (nonatomic, copy) NSString *ganbuleixing;// "0",
@property (nonatomic, assign) NSInteger status;// 1,
@property (nonatomic, assign) NSInteger lose;// 0,
@property (nonatomic, copy) NSString *losetime;// "",
@property (nonatomic, assign) NSInteger liudong_status;// 0,
@property (nonatomic, copy) NSString *liuchufangxiang;// "",
@property (nonatomic, assign) NSInteger is_excellent;// 0,
@property (nonatomic, copy) NSString *excellent_add_time;// null,
@property (nonatomic, copy) NSString *excellent_desc;// null,
@property (nonatomic, copy) NSString *dangneizhiwu;// "",
@property (nonatomic, copy) NSString *zhicheng;// "暂未完善",
@property (nonatomic, copy) NSString *jianli;// null,
@property (nonatomic, copy) NSString *jieshaoren;// "\"\"",
@property (nonatomic, assign) NSInteger is_admin;// 1,
@property (nonatomic, copy) NSString *old_ogid;// null,
@property (nonatomic, copy) NSString *old_ogname;// "",
@property (nonatomic, copy) NSString *dept;// "",
@property (nonatomic, copy) NSString *dangfei;// "",
@property (nonatomic, copy) NSString *none_party_cadre;// null,
@property (nonatomic, copy) NSString *level;// "E"

@end

#pragma mark ======   考核列表model   ======
@interface AssessmentModel : NSObject
@property (nonatomic, assign) NSInteger assessid;// 17459,
@property (nonatomic, assign) NSInteger suid;// 1,
@property (nonatomic, assign) NSInteger uid;// 1057,
@property (nonatomic, copy) NSString *title;// "\n生产运行科党支部2019年第二季度党员大会",
@property (nonatomic, copy) NSString *score;// "",
@property (nonatomic, copy) NSString *name;// "",
@property (nonatomic, copy) NSString *desc;// "",
@property (nonatomic, assign) NSInteger size;// 0,
@property (nonatomic, copy) NSString *reason;// "",
@property (nonatomic, copy) NSString *addtime;// "2019-07-08 15:52:35",
@property (nonatomic, assign) NSInteger favonum;// 0,
@property (nonatomic, assign) NSInteger clicknum;// 0,
@property (nonatomic, assign) NSInteger dwloadnum;// 0,
@property (nonatomic, assign) NSInteger status;// 3,
@property (nonatomic, assign) NSInteger ogid;// 31,
@property (nonatomic, strong) NSArray<NSString*> *huiyijilu;// "[\"20190708\\/3380d93c27101ae2e7b7e9e9cc3eff51.png\",\"20190708\\/51e8b6fea4b0c40291aad0a16efaf9f1.png\",\"20190708\\/250899c2204b24fd938d718dbcac52fb.png\",\"20190708\\/5567907cafe749a389cdb5c0b88591da.png\"]",
@property (nonatomic, copy) NSString *huiyiqiandaoce;// "",
@property (nonatomic, copy) NSString *huiyizhaopian;// "",
@property (nonatomic, assign) NSInteger is_admin;// 0,
@property (nonatomic, copy) NSString *from;// "移动端",
@property (nonatomic, copy) NSString *handle;// "0",
@property (nonatomic, copy) NSString *update_time;// "1970-01-01 08:00:00",
@property (nonatomic, copy) NSString *handle_uid;// null,
@property (nonatomic, strong) CadreUserModel *user;
@property (nonatomic, strong) AssessmentTypeModel *type;
@end

@interface AssessmentTypeModel : NSObject
@property (nonatomic, assign) NSInteger typeID;// 1,
@property (nonatomic, copy) NSString *name;// "党员大会",
@property (nonatomic, copy) NSString *title;// "dangyuandahui",
@property (nonatomic, copy) NSString *max_score;// "1",
@property (nonatomic, assign) NSInteger status;// 1
@end
NS_ASSUME_NONNULL_END

