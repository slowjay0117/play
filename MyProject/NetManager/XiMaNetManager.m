//
//  XiMaNetManager.m
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "XiMaNetManager.h"
#import "RankingListModel.h"
#import "AlbumModel.h"

#define kRankingListPath @"http://mobile.ximalaya.com/mobile/discovery/v1/rankingList/album" //音乐分类
#define kAlbumPath  @"http://mobile.ximalaya.com/mobile/others/ca/album/track/%@/true/%@/20" //某音乐分类内容

@implementation XiMaNetManager
+ (id)getRankingListWithPageID:(NSInteger)page completionHandle:(void (^)(id, NSError *))complete{
    NSDictionary *params = @{@"device":@"iPhone", @"key":@"ranking:album:played:1:2", @"pageId":@(page), @"pageSize":@20, @"position":@0, @"title":@"排行榜"};
    NSString *path = [self percentPathWithPath:kRankingListPath params:params];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        complete([RankingListModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getAlbumModelWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void (^)(id, NSError *))complete{
    NSString *path = [NSString stringWithFormat:kAlbumPath, @(ID), @(pageID)];
    NSDictionary *params = @{@"device":@"iPhone"};
    return [self GET:path parameters:params completionHandler:^(id responseObj, NSError *error) {
        complete([AlbumModel mj_objectWithKeyValues:responseObj], error);
    }];
}
@end
