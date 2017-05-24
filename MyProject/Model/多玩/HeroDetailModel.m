//
//  HeroDetail.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "HeroDetailModel.h"

@implementation HeroDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id", @"desc":@"description"};
}
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"like":[HeroDetailLikeModel class], @"hate":[HeroDetailLikeModel class]};
}
@end

@implementation HeroDetailBraumModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id", @"desc":@"description"};
}
@end

@implementation HeroDetailLikeModel
@end
