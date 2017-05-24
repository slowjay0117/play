//
//  GiftModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "GiftModel.h"

@implementation GiftModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"a":[GiftAModel class], @"d":[GiftAModel class], @"g":[GiftAModel class]};
}
@end

@implementation GiftAModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end
