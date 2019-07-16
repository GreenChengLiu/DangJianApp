//
//  PhotoAndCamera.h
//  com.quDongChina
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol PhotoAndCameraDelegagte <NSObject>
@optional
- (void)selectPhotoLibraryOperaion;

- (void)selectCameraOperation;

- (void)selectDismissOperation;

@end
@interface PhotoAndCamera : UIView

@property (nonatomic, weak) id <PhotoAndCameraDelegagte> photoDelegate;

@end

NS_ASSUME_NONNULL_END
