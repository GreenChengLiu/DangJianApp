//
//  QDUrl.h
//  com.quDongChina
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 mac. All rights reserved.
//

#ifndef QDUrl_h
#define QDUrl_h

#pragma mark --- 我的板块接口  ----

#define QD_BASE_URL @"http://dj.micuer.com/api/"
//#define VIDEO_BASE_URL @"https://video.qudong.com/api/"
#define BASE_IMAGE_URL @"http://dj.micuer.com"
#pragma mark ======   个人中心   ======
/**
 登录接口
 */
#define USER_LOGIN NSStringFormat(@"%@index/login",QD_BASE_URL)
#pragma mark ======   指尖党建   ======
/**
 轮播图
 */
#define PARTY_CAROUSEL_MAP NSStringFormat(@"%@index/banners",QD_BASE_URL)

/**
 首页党建动态
 */
#define PARTY_STATUS NSStringFormat(@"%@index/newarticle",QD_BASE_URL)

/**
 考核排行榜
 */
#define PARTY_RANKING NSStringFormat(@"%@index/personal_ranking",QD_BASE_URL)

/**
 干部报备列表
 */
#define PARTY_CADRE_REPORT_LIST NSStringFormat(@"%@ganbubaobei/index",QD_BASE_URL)

/**
 干部报备 外出添加
 */
#define PARTY_CADRE_REPORT_ADD NSStringFormat(@"%@ganbubaobei/add",QD_BASE_URL)
/**
 三会一课,考核列表
 */
#define PARTY_ASSESSMENT_LIST NSStringFormat(@"%@Daily_examination/index",QD_BASE_URL)
#pragma mark ======   党建动态   ======
/**
 党建列表
 */
#define DYNAMIC_LIST NSStringFormat(@"%@index/articles",QD_BASE_URL)

#define PARTY_ARTICLES NSStringFormat(@"%@index/articles",QD_BASE_URL)
#define PARTY_SECRETARY NSStringFormat(@"%@Sjyhs/index",QD_BASE_URL)
#define PARTY_RECEIVE NSStringFormat(@"%@Sjyhs/get_phones",QD_BASE_URL)
#define PARTY_MESSAGE_ADD NSStringFormat(@"%@Sjyhs/add",QD_BASE_URL)
#endif /* QDUrl_h */
