//
//  Transition.h
//  com.quDongChina
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Transition : NSObject
- (void)addAnimationWithLayer:(UIView *)view andBool:(BOOL )isHidden;

@end

NS_ASSUME_NONNULL_END
