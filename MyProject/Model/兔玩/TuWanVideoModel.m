//
//  TuWanVideoModel.m
//  MyProject
//
//  Created by will on 2017/5/30.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TuWanVideoModel.h"

@implementation TuWanVideoModel

+ (NSDictionary *)objectClassInArray{
    return @{@"content" : [TuWanVideoContentModel class], @"relevant" : [TuWanVideoRelevant class]};
}

+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"typeName":@"typename",@"desc":@"description"};
}

@end


@implementation TuWanVideoContentModel
@end


@implementation TuWanVideoRelevant
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"desc":@"description",@"typeName":@"typename"};
}
@end


