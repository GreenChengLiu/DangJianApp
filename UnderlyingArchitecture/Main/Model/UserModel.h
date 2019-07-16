//
//  UserModel.h
//  com.quDongChina
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface UserModel : NSObject

+ (instancetype)shareUserModel;

@property (nonatomic, copy) NSString *address; // "";
@property (nonatomic, copy) NSString *age; // "<null>";
@property (nonatomic, copy) NSString *birthday;// "<null>";
@property (nonatomic, copy) NSString *dangfei;// "";
@property (nonatomic, copy) NSString *dangneizhiwu; //"";
@property (nonatomic, copy) NSString *dept;// "";
@property (nonatomic, copy) NSString *dy_number;// "";
@property (nonatomic, copy) NSString *email;// "<null>";
@property (nonatomic, copy) NSString *excellent_add_time;// "<null>";
@property (nonatomic, copy) NSString *excellent_desc;// "<null>";
@property (nonatomic, copy) NSString *expire;// "<null>";
@property (nonatomic, copy) NSString *fazhanduixiang_time;// "<null>";
@property (nonatomic, copy) NSString *ganbuleixing;// "\U975e\U5e72\U90e8";
@property (nonatomic, copy) NSString *headimgurl;// "http://www.dbcycdjpt.com/static/dangjian/images/user_head.png";
@property (nonatomic, copy) NSString *userid;// id 1602;
@property (nonatomic, copy) NSString *idnumber;// "<null>";
@property (nonatomic, copy) NSString *introduce;//"<null>";
@property (nonatomic, copy) NSString *intrstime;//"<null>";
@property (nonatomic, copy) NSString *is_admin;// 1;
@property (nonatomic, copy) NSString *is_excellent;// 0;
@property (nonatomic, copy) NSString *jianli;// "<null>";
@property (nonatomic, copy) NSString *jieshaoren;// "<null>";
@property (nonatomic, copy) NSString *jijifenzi_time;// "<null>";
@property (nonatomic, copy) NSString *job; // "<null>";
@property (nonatomic, copy) NSString *join_party_time;// "<null>";
@property (nonatomic, copy) NSString *level;// E;
@property (nonatomic, copy) NSString *liuchufangxiang;// "";
@property (nonatomic, copy) NSString *liudong_status;// 0;
@property (nonatomic, copy) NSString *loginnum;// 0;
@property (nonatomic, copy) NSString *logintime; //0;
@property (nonatomic, copy) NSString *logouttime;//0;
@property (nonatomic, copy) NSString *lose;// 0;
@property (nonatomic, copy) NSString *losetime;// "<null>";
@property (nonatomic, copy) NSString *name;// "\U6d4b\U8bd5\U8d26\U53f7\U7ba1\U7406\U5458";
@property (nonatomic, copy) NSString *nationality;// "<null>";
@property (nonatomic, copy) NSString *native_place;// "";
@property (nonatomic, copy) NSString *none_party_cadre;// "<null>";
@property (nonatomic, copy) NSString *og_name;// "<null>";
@property (nonatomic, copy) NSString *ogid ;// 1;
@property (nonatomic, copy) NSString *old_ogid;// "<null>";
@property (nonatomic, copy) NSString *old_ogname;// "";
@property (nonatomic, copy) NSString *party_age;// 0;
@property (nonatomic, copy) NSString *password ;// 51399b6dd4ad468960827e1dc104cd7f;
@property (nonatomic, copy) NSString *phone;// "";
@property (nonatomic, copy) NSString *qualifications;//"<null>";
@property (nonatomic, copy) NSString *reg_time;// "<null>";
@property (nonatomic, copy) NSString *renzhinianxian;// 5;
@property (nonatomic, copy) NSString *renzhishijian;// 0;
@property (nonatomic, copy) NSString *score;// "3.5";
@property (nonatomic, copy) NSString *sex;// "<null>";
@property (nonatomic, copy) NSString *start_job_time;//0;
@property (nonatomic, copy) NSString *status;// "\U6ce8\U518c\U4f1a\U5458";
@property (nonatomic, copy) NSString *Super;// 1;
@property (nonatomic, copy) NSString *token;// "MTYwMithZG1pbis1MTM5OWI2ZGQ0YWQ0Njg5NjA4MjdlMWRjMTA0Y2Q3Zg==";
@property (nonatomic, copy) NSString *username;// admin;
@property (nonatomic, copy) NSString *where_now;// "<null>";
@property (nonatomic, copy) NSString *yubei_time;// 0;
@property (nonatomic, copy) NSString *zhicheng;// "\U6682\U672a\U5b8c\U5584";
@property (nonatomic, copy) NSString *zhuanye;// "<null>";
@property (nonatomic, copy) NSString *zhuanzheng_time;//"<null>";



@property (nonatomic, assign) BOOL isLogin;

/**
 保存用户信息

 @param userDict 出入字典
 */
- (void)saveTheUserInfo:(NSDictionary *)userDict;

/**
 获取用户信息
 */
- (void)getUserInfo;

- (void)saveLoginStatus:(BOOL )loginStatus;
- (BOOL)getLogin;

@end

NS_ASSUME_NONNULL_END
