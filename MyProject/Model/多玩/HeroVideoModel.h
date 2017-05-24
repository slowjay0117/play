//
//  HeroVideoModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@interface HeroVideoModel : BaseModel
@property (nonatomic, strong) NSString *channelId;
@property (nonatomic, assign) double totalPage;
@property (nonatomic, strong) NSString *coverUrl;
@property (nonatomic, strong) NSString *vid;
@property (nonatomic, strong) NSString *letvVideoUnique;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *udb;
@property (nonatomic, strong) NSString *tag;
@property (nonatomic, strong) NSString *letvVideoId;
@property (nonatomic, assign) double videoLength;
@property (nonatomic, assign) double playCount;
@property (nonatomic, strong) NSString *uploadTime;
@end
