//
//  ACHModel.h
//  UnderlyingArchitecture
//
//  Created by liuPengCheng on 2019/7/12.
//  Copyright © 2019 liuPengCheng. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ACHModel : NSObject

@property (nonatomic, assign) NSInteger achid;// 218,
@property (nonatomic, copy) NSString *img;// "http://116.196.78.130/public/uploads/20190625/ba6c757c95482ce9fbc871a29b1c9f28.png_smail.png",
@property (nonatomic, assign) NSInteger category_id;// 65,
@property (nonatomic, copy) NSString *attr_id;// null,
@property (nonatomic, copy) NSString *name;// "张崾先采油队：党建+安全丨掌好党建引航舵 做足安全生产功",
@property (nonatomic, copy) NSString *info;//; "今年以来，张崾先采油队不断加强党建引领，系统推进党建文化管理工程落地，聚焦“科技创新年”，以基础建设、安全生产、质量强队为抓手，形成突出重点工作、细化基础管理、加大油井技术应用的重细精工作格局，确保全年原油产销任务的顺利完成和安全环保平稳受控。",
@property (nonatomic, copy) NSString *content;//
@property (nonatomic, assign) NSInteger status;// 1,
@property (nonatomic, copy) NSString *add_time;// "2019-06-25 20:53:56",
@property (nonatomic, copy) NSString *edit_time;// null,
@property (nonatomic, copy) NSString *add_user;// "zyx001",
@property (nonatomic, assign) NSInteger oid;// 1,
@property (nonatomic, copy) NSString *seo_key;// "",
@property (nonatomic, copy) NSString *seo_content;// "",
@property (nonatomic, assign) NSInteger uid;// 0,
@property (nonatomic, copy) NSString *pv;// "52",
@property (nonatomic, assign) NSInteger ogid;// 0,
@property (nonatomic, assign) NSInteger story_uid;// 0,
@property (nonatomic, copy) NSString *fujian;// "",
@property (nonatomic, assign) NSInteger article_type;// 1,
@property (nonatomic, copy) NSString *study_status;// "-1",
@property (nonatomic, copy) NSString *shichang;// "5",
@property (nonatomic, assign) NSInteger notice;// 2,
@property (nonatomic, assign) NSInteger collection;// 2
@end

NS_ASSUME_NONNULL_END
