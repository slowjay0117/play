//
//  ZBDetailModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "ZBDetailModel.h"

@implementation ZBDetailModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id", @"desc":@"description"};
}
@end

@implementation ZBDetailExtattrsModel
// 属性首字母小写 -> 变大写
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_firstCharUpper];
}
@end


