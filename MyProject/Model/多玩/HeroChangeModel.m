//
//  HeroChangeModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "HeroChangeModel.h"

@implementation HeroChangeModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"changeLog" : [HeroChangeChangelogModel class]};
}
@end

@implementation HeroChangeChangelogModel
@end



