//
//  RuneModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RuneModel.h"

@implementation RuneModel
+ (NSDictionary *)objectClassInArray{
    return @{@"Purple" : [RunePurpleModel class], @"Yellow" : [RunePurpleModel class], @"Blue" : [RunePurpleModel class], @"Red" : [RunePurpleModel class]};
}
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    return [propertyName mj_firstCharUpper];
}
@end

@implementation RunePurpleModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"img":@"Img", @"alias":@"Alias", @"name":@"Name", @"prop":@"Prop", @"recom":@"Recom", @"standby":@"Standby", @"type":@"Type", @"units":@"Units"};
}
@end


