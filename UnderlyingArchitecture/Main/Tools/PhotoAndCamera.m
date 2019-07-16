//
//  PhotoAndCamera.m
//  com.quDongChina
//
//  Created by mac on 2019/6/12.
//  Copyright © 2019 mac. All rights reserved.
//

#import "PhotoAndCamera.h"

@implementation PhotoAndCamera

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self addChildView];
    }
    return self;
}

- (void)addChildView{
    UILabel *li = [[UILabel alloc] init];
    li.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
    [self addSubview:li];
    [li mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(1);
    }];
    
    UIButton *photo = [[UIButton alloc] init];
    [self addSubview: photo];
    [photo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(li.mas_bottom).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(40);
    }];
    [photo setTitle:@"相册" forState:UIControlStateNormal];
    [photo setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    [photo addTarget:self action:@selector(photoOperation:) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *line = [[UILabel alloc] init];
    line.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
    [self addSubview:line];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(photo.mas_bottom).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(1);
    }];
    
    UIButton *camera = [[UIButton alloc] init];
    [self addSubview: camera];
    [camera mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line.mas_bottom).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(40);
    }];
    [camera setTitle:@"相机" forState:UIControlStateNormal];
    [camera setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    [camera addTarget:self action:@selector(cameraOperation:) forControlEvents:UIControlEventTouchUpInside];

    UILabel *line1 = [[UILabel alloc] init];
    line1.backgroundColor = [UIColor colorWithHex:0xe5e5e5];
    [self addSubview:line1];
    [line1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(camera.mas_bottom).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(1);
    }];

    UIButton *dismiss = [[UIButton alloc] init];
    [self addSubview: dismiss];
    [dismiss mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(line1.mas_bottom).with.offset(0);
        make.left.right.equalTo(self).with.offset(0);
        make.height.offset(40);
    }];
    [dismiss setTitle:@"取消" forState:UIControlStateNormal];
    [dismiss setTitleColor:[UIColor colorWithHex:0x333333] forState:UIControlStateNormal];
    [dismiss addTarget:self action:@selector(dismissOperation:) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)photoOperation:(UIButton *)sender{
    if (self.photoDelegate && [self.photoDelegate respondsToSelector:@selector(selectPhotoLibraryOperaion)] ) {
        [self.photoDelegate selectPhotoLibraryOperaion];
    }
}

- (void)cameraOperation:(UIButton *)sender{
    if (self.photoDelegate && [self.photoDelegate respondsToSelector:@selector(selectCameraOperation)]) {
        [self.photoDelegate selectCameraOperation];
    }
}

- (void)dismissOperation:(UIButton *)sender{
    if (self.photoDelegate && [self.photoDelegate respondsToSelector:@selector(selectDismissOperation)]) {
        [self.photoDelegate selectDismissOperation];
    }
}

@end
