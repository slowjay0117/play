//
//  MyImageView.m
//  MyProject
//
//  Created by will on 2017/5/26.
//  Copyright © 2017年 will. All rights reserved.
//

#import "MyImageView.h"

@implementation MyImageView
- (instancetype)init{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        // 按比例放大，充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        // 当前视图减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}
@end
