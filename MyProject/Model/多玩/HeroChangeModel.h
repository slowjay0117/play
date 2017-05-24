//
//  HeroChangeModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class HeroChangeChangelogModel;

@interface HeroChangeModel : BaseModel
@property (nonatomic, copy) NSString *gold;
@property (nonatomic, copy) NSString *coupon;
@property (nonatomic, strong) NSArray<HeroChangeChangelogModel *> *changeLog;
@property (nonatomic, copy) NSString *eName;
@property (nonatomic, copy) NSString *cName;
@property (nonatomic, copy) NSString *location;
@end

@interface HeroChangeChangelogModel : NSObject
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *info;
@end

