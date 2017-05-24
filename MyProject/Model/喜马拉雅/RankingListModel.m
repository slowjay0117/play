//
//  RankingListModel.m
//  MyProject
//
//  Created by will on 2017/5/11.
//  Copyright © 2017年 will. All rights reserved.
//

#import "RankingListModel.h"

@implementation RankingListModel
+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [RankingListListModel class]};
}
@end
@implementation RankingListListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


