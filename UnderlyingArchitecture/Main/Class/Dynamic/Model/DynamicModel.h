//
//  DynamicModel.h
//  UnderlyingArchitecture
//
//  Created by mac on 2019/6/24.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DynamicModel : NSObject

@property (nonatomic, assign) NSInteger dynamicID;// 219,
@property (nonatomic, copy) NSString *img; //"http://www.dbcycdjpt.com/public/uploads/20190625/bcc63d9fc16aa65facd0a051d1a95964.jpg_smail.png",
@property (nonatomic, assign) NSInteger category_id;// 67,
@property (nonatomic, copy) NSString *attr_id; //null,
@property (nonatomic, copy) NSString *name;// "安全生产月，我是党员，我做安全示范",
@property (nonatomic, copy) NSString *info;// "没有危险，不受威胁，不出事故就是安全。孩子眼中的安全是什么？一张事故案例图片就能夺走孩子的安全感，让我们用安全提醒，提升安全操作水平，筑牢孩子的安全感，营造平安幸福家庭。",
@property (nonatomic, copy) NSString *content;// "<p><video class=\"edui-upload-video  vjs-default-skin video-js\" controls=\"\" preload=\"none\" width=\"420\" height=\"280\" src=\"/public/uploads/ueditor/php/upload/video/20190625/1561467815286607.mp4\" data-setup=\"{}\"></video></p>",
@property (nonatomic, assign) NSInteger status;// 1,
@property (nonatomic, copy) NSString *add_time;// "2019-06-25 21:03:53",
@property (nonatomic, copy) NSString *edit_time;// null,
@property (nonatomic, copy) NSString *add_user;//"zyx001",
@property (nonatomic, assign) NSInteger oid;// 1,
@property (nonatomic, copy) NSString *seo_key;// "",
@property (nonatomic, copy) NSString *seo_content;// "",
@property (nonatomic, assign) NSInteger uid;// 0,
@property (nonatomic, assign) NSInteger pv;// "22",
@property (nonatomic, assign) NSInteger ogid; //0,
@property (nonatomic, assign) NSInteger story_uid; //0,
@property (nonatomic, copy) NSString *fujian;// "",
@property (nonatomic, assign) NSInteger article_type; //1,
@property (nonatomic, copy) NSString *study_status;//"-1",
@property (nonatomic, copy) NSString *shichang;// "4",
@property (nonatomic, assign) NSInteger notice; //2,
@property (nonatomic, assign) NSInteger collection;// 2

@end

NS_ASSUME_NONNULL_END
