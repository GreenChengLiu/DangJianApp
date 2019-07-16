//
//  UserModel.m
//  com.quDongChina
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel
static UserModel *user = nil;

+ (instancetype)shareUserModel{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[self alloc] init];
    });
    return user;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [super allocWithZone:zone];
    });
    return user;
}
- (id)copyWithZone:(NSZone *)zone{
    return user;
}
- (id)mutableCopyWithZone:(NSZone *)zone{
    return user;
}


- (void)saveTheUserInfo:(NSDictionary *)userDict{
//    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dict = @{
                           @"address":NSStringFormat(@"%@",userDict[@"address"]),
                           @"age":NSStringFormat(@"%@",userDict[@"age"]),
                           @"birthday":NSStringFormat(@"%@",userDict[@"birthday"]),
                           @"dangfei":NSStringFormat(@"%@",userDict[@"dangfei"]),
                           @"dangneizhiwu":NSStringFormat(@"%@",userDict[@"dangneizhiwu"]),
                           @"dept":NSStringFormat(@"%@",userDict[@"dept"]),
                           @"dy_number":NSStringFormat(@"%@",userDict[@"dy_number"]),
                           @"email":NSStringFormat(@"%@",userDict[@"email"]),
                           @"excellent_add_time":NSStringFormat(@"%@",userDict[@"excellent_add_time"]),
                           @"excellent_desc":NSStringFormat(@"%@",userDict[@"excellent_desc"]),
                           @"expire":NSStringFormat(@"%@",userDict[@"expire"]),
                           @"fazhanduixiang_time":NSStringFormat(@"%@",userDict[@"fazhanduixiang_time"]),
                           @"ganbuleixing":NSStringFormat(@"%@",userDict[@"ganbuleixing"]),
                           @"headimgurl":NSStringFormat(@"%@",userDict[@"headimgurl"]),
                           @"userid":NSStringFormat(@"%@",userDict[@"id"]),
                           @"idnumber":NSStringFormat(@"%@",userDict[@"idnumber"]),
                           @"introduce":NSStringFormat(@"%@",userDict[@"introduce"]),
                           @"intrstime":NSStringFormat(@"%@",userDict[@"intrstime"]),
                           @"is_admin":NSStringFormat(@"%@",userDict[@"is_admin"]),
                           @"is_excellent":NSStringFormat(@"%@",userDict[@"is_excellent"]),
                           @"jianli":NSStringFormat(@"%@",userDict[@"jianli"]),
                           @"jieshaoren":NSStringFormat(@"%@",userDict[@"jieshaoren"]),
                           @"jijifenzi_time":NSStringFormat(@"%@",userDict[@"jijifenzi_time"]),
                           @"job":NSStringFormat(@"%@",userDict[@"job"]),
                           @"join_party_time":NSStringFormat(@"%@",userDict[@"join_party_time"]),
                           @"level":NSStringFormat(@"%@",userDict[@"level"]),
                           @"liuchufangxiang":NSStringFormat(@"%@",userDict[@"liuchufangxiang"]),
                           @"liudong_status":NSStringFormat(@"%@",userDict[@"liudong_status"]),
                           @"loginnum":NSStringFormat(@"%@",userDict[@"loginnum"]),
                           @"logintime":NSStringFormat(@"%@",userDict[@"logintime"]),
                           @"logouttime":NSStringFormat(@"%@",userDict[@"logouttime"]),
                           @"lose":NSStringFormat(@"%@",userDict[@"lose"]),
                           @"losetime":NSStringFormat(@"%@",userDict[@"losetime"]),
                           @"name":NSStringFormat(@"%@",userDict[@"name"]),
                           @"nationality":NSStringFormat(@"%@",userDict[@"nationality"]),
                           @"native_place":NSStringFormat(@"%@",userDict[@"native_place"]),
                           @"none_party_cadre":NSStringFormat(@"%@",userDict[@"none_party_cadre"]),
                           @"og_name":NSStringFormat(@"%@",userDict[@"og_name"]),
                           @"ogid":NSStringFormat(@"%@",userDict[@"ogid"]),
                           @"old_ogid":NSStringFormat(@"%@",userDict[@"old_ogid"]),
                           @"old_ogname":NSStringFormat(@"%@",userDict[@"old_ogname"]),
                           @"party_age":NSStringFormat(@"%@",userDict[@"party_age"]),
                           @"password":NSStringFormat(@"%@",userDict[@"password"]),
                           @"phone":NSStringFormat(@"%@",userDict[@"phone"]),
                           @"qualifications":NSStringFormat(@"%@",userDict[@"qualifications"]),
                           @"reg_time":NSStringFormat(@"%@",userDict[@"reg_time"]),
                           @"renzhinianxian":NSStringFormat(@"%@",userDict[@"renzhinianxian"]),
                           @"renzhishijian":NSStringFormat(@"%@",userDict[@"renzhishijian"]),
                           @"score":NSStringFormat(@"%@",userDict[@"score"]),
                           @"sex":NSStringFormat(@"%@",userDict[@"sex"]),
                           @"start_job_time":NSStringFormat(@"%@",userDict[@"start_job_time"]),
                           @"status":NSStringFormat(@"%@",userDict[@"status"]),
                           @"Super":NSStringFormat(@"%@",userDict[@"super"]),
                           @"token":NSStringFormat(@"%@",userDict[@"token"]),
                           @"username":NSStringFormat(@"%@",userDict[@"username"]),
                           @"where_now":NSStringFormat(@"%@",userDict[@"where_now"]),
                           @"yubei_time":NSStringFormat(@"%@",userDict[@"yubei_time"]),
                           @"zhicheng":NSStringFormat(@"%@",userDict[@"zhicheng"]),
                           @"zhuanye":NSStringFormat(@"%@",userDict[@"zhuanye"]),
                           @"zhuanzheng_time":NSStringFormat(@"%@",userDict[@"zhuanzheng_time"]),
                           };
    
//    [defaults setObject:dict forKey:@"userinfo"];
    SET_OBJECT_USERDEFAULTS(dict, @"userinfo");
}


- (void)getUserInfo{
    NSDictionary *userDict = GET_OBJECT_USERDEFAULTS(@"userinfo");
    self.address = [userDict stringForKey:@"address"];
    self.age = [userDict stringForKey:@"age"];
    self.birthday = [userDict stringForKey:@"birthday"];
    self.dangfei = [userDict stringForKey:@"dangfei"];
    self.dangneizhiwu = [userDict stringForKey:@"dangneizhiwu"];
    self.dept = [userDict stringForKey:@"dept"];
    self.dy_number = [userDict stringForKey:@"dy_number"];
    self.email = [userDict stringForKey:@"email"];
    self.excellent_add_time = [userDict stringForKey:@"excellent_add_time"];
    self.excellent_desc = [userDict stringForKey:@"excellent_desc"];
    self.expire = [userDict stringForKey:@"expire"];
    self.fazhanduixiang_time = [userDict stringForKey:@"fazhanduixiang_time"];
    self.ganbuleixing = [userDict stringForKey:@"ganbuleixing"];
    self.headimgurl = [userDict stringForKey:@"headimgurl"];
    self.userid = [userDict stringForKey:@"userid"];
    self.idnumber = [userDict stringForKey:@"idnumber"];
    self.introduce = [userDict stringForKey:@"introduce"];
    self.intrstime = [userDict stringForKey:@"intrstime"];
    self.is_admin = [userDict stringForKey:@"is_admin"];
    self.is_excellent = [userDict stringForKey:@"is_excellent"];
    self.jianli = [userDict stringForKey:@"jianli"];
    self.jieshaoren = [userDict stringForKey:@"jieshaoren"];
    self.jijifenzi_time = [userDict stringForKey:@"jijifenzi_time"];
    self.job = [userDict stringForKey:@"job"];
    self.join_party_time = [userDict stringForKey:@"join_party_time"];
    self.level = [userDict stringForKey:@"level"];
    self.liuchufangxiang = [userDict stringForKey:@"liuchufangxiang"];
    self.liudong_status = [userDict stringForKey:@"liudong_status"];
    self.loginnum = [userDict stringForKey:@"loginnum"];
    self.logintime = [userDict stringForKey:@"logintime"];
    self.logouttime = [userDict stringForKey:@"logouttime"];
    self.lose = [userDict stringForKey:@"lose"];
    self.losetime = [userDict stringForKey:@"losetime"];
    self.name = [userDict stringForKey:@"name"];
    self.nationality = [userDict stringForKey:@"nationality"];
    self.native_place = [userDict stringForKey:@"native_place"];
    self.none_party_cadre = [userDict stringForKey:@"none_party_cadre"];
    self.og_name = [userDict stringForKey:@"og_name"];
    self.ogid = [userDict stringForKey:@"ogid"];
    self.old_ogid = [userDict stringForKey:@"old_ogid"];
    self.old_ogname = [userDict stringForKey:@"old_ogname"];
    self.party_age = [userDict stringForKey:@"party_age"];
    self.password = [userDict stringForKey:@"password"];
    self.phone = [userDict stringForKey:@"phone"];
    self.qualifications = [userDict stringForKey:@"qualifications"];
    self.reg_time = [userDict stringForKey:@"reg_time"];
    self.renzhinianxian = [userDict stringForKey:@"renzhinianxian"];
    self.renzhishijian = [userDict stringForKey:@"renzhishijian"];
    self.score = [userDict stringForKey:@"score"];
    self.sex = [userDict stringForKey:@"sex"];
    self.start_job_time = [userDict stringForKey:@"start_job_time"];
    self.status = [userDict stringForKey:@"status"];
    self.Super = [userDict stringForKey:@"Super"];
    self.token = [userDict stringForKey:@"token"];
    self.username = [userDict stringForKey:@"username"];
    self.where_now = [userDict stringForKey:@"where_now"];
    self.yubei_time = [userDict stringForKey:@"yubei_time"];
    self.zhicheng = [userDict stringForKey:@"zhicheng"];
    self.zhuanye = [userDict stringForKey:@"zhuanye"];
    self.zhuanzheng_time = [userDict stringForKey:@"zhuanzheng_time"];
    
//    self.isLogin = GET_BOOL_USERDEFAULTS(@"login");
}


- (void)saveLoginStatus:(BOOL)loginStatus{
    SET_BOOL_USERDEFAULTS(loginStatus, @"login");
}

- (BOOL)getLogin{
    return GET_BOOL_USERDEFAULTS(@"login");
}



@end
