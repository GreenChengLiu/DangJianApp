//
//  BrokeModel.h
//  com.quDongChina
//
//  Created by mac on 2019/5/30.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class commentListModel;

@interface BrokeModel : NSObject

@property (nonatomic, assign) NSInteger baoliaoid;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *image1;
@property (nonatomic, copy) NSString *image2;
@property (nonatomic, copy) NSString *image3;
@property (nonatomic, copy) NSString *image4;
@property (nonatomic, copy) NSString *image5;
@property (nonatomic, copy) NSString *image6;
@property (nonatomic, copy) NSString *image7;
@property (nonatomic, copy) NSString *image8;
@property (nonatomic, copy) NSString *image9;
@property (nonatomic, copy) NSString *video;
@property (nonatomic, assign) NSInteger topicid;
@property (nonatomic, assign) NSInteger pv;
@property (nonatomic, copy) NSString *userid;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *email;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *qq;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, copy) NSString *createtime;
@property (nonatomic, assign) NSInteger ip;
@property (nonatomic, assign) NSInteger reply;
@property (nonatomic, copy) NSString *replytext;
@property (nonatomic, assign) NSInteger replytime;
@property (nonatomic, copy) NSString *related;
@property (nonatomic, copy) NSString *otherinfo;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, assign) NSInteger comment;
@property (nonatomic, assign) NSInteger zan;
@property (nonatomic, assign) NSInteger transmit;
@property (nonatomic, copy) NSString *status;
@property (nonatomic, assign) NSInteger brokeid;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *headimgurl;
@property (nonatomic, copy) NSString *openid;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *mailbox;
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *photo;
@property (nonatomic, copy) NSString *password;
@property (nonatomic, assign) NSInteger sex;
@property (nonatomic, copy) NSString *relname;
@property (nonatomic, copy) NSString *s_province;
@property (nonatomic, copy) NSString *s_city;
@property (nonatomic, copy) NSString *s_county;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, copy) NSString *reg_time;
@property (nonatomic, copy) NSString *money;
@property (nonatomic, copy) NSString *money_left;
@property (nonatomic, assign) NSInteger birthday;
@property (nonatomic, assign) NSInteger is_identify;
@property (nonatomic, assign) NSInteger is_bind;
@property (nonatomic, assign) NSInteger is_zhaunlan;
@property (nonatomic, assign) NSInteger score;
@property (nonatomic, copy) NSString *qianming;
@property (nonatomic, copy) NSString *zhuanlanming;
@property (nonatomic, assign) NSInteger oid;
@property (nonatomic, assign) NSInteger v;
@property (nonatomic, assign) NSInteger is_login;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, assign) NSInteger fans;
@property (nonatomic, assign) NSInteger follow;
@property (nonatomic, assign) NSInteger site_agreement;
@property (nonatomic, copy) NSString *site_agreement_file;
@property (nonatomic, copy) NSString *site_agreement_add_time;
@property (nonatomic, assign) NSInteger is_admin;
@property (nonatomic, assign) NSInteger praise;
@property (nonatomic, strong) NSArray<commentListModel *> *comment_list;//评论记录表
@property (nonatomic, assign) NSInteger more;

//增加打开项
@property (nonatomic, assign) BOOL isOpen;

@end


@interface commentListModel : NSObject

@property (nonatomic, assign) NSInteger coID;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) NSInteger add_time;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *reason;
@property (nonatomic, assign) NSInteger uid;
@property (nonatomic, copy) NSString *contentid;
@property (nonatomic, assign) NSInteger zan;
@property (nonatomic, copy) NSString *floor;
@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSString *username;
@property (nonatomic, assign) NSInteger pid;
@property (nonatomic, assign) NSInteger baoliao_id;
@property (nonatomic, copy) NSString *VideoId;
@property (nonatomic, copy) NSString *headimgurl;
@property (nonatomic, assign) NSInteger children;

@end

NS_ASSUME_NONNULL_END
