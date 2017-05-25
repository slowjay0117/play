//
//  TuWanViewModel.m
//  MyProject
//
//  Created by will on 2017/5/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TuWanViewModel.h"

@implementation TuWanViewModel
- (instancetype)initWithType:(InfoType)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
// 预防性编程，防止没有使用initWithType初始化
- (id)init{
    if (self = [super init]) {
        // 如果使用此方法初始化，那么崩溃提示
        NSAssert1(NO, @"%s 必须使用initWithType初始化", __func__);
    }
    return self;
}

- (void)refreshDataCompletionHandle:(CompletionHandle)completionHandle{
    _start = 0;
    [self getDataFromNetCompletionHandle:completionHandle];
}

- (void)getMoreDataCompletionHandle:(CompletionHandle)completionHandle{
    _start += 11;
    [self getDataFromNetCompletionHandle:completionHandle];
}

- (void)getDataFromNetCompletionHandle:(CompletionHandle)completionHandle{
    self.dataTask = [TuWanNetManager getTuWanInfoWithType:_type start:_start completionHandle:^(TuWanModel *model, NSError *error) {
        if (_start == 0) {
            [self.dataArr removeAllObjects];
            self.indexPicArr = nil;
        }
        [self.dataArr addObjectsFromArray:model.data.list];
        self.indexPicArr = model.data.indexpic;
        completionHandle(error);
    }];
}

- (BOOL)isExistIndexPic{
    return self.indexPicArr != nil && self.indexPicArr.count != 0;
}

- (NSInteger)rowNumber{
    return self.dataArr.count;
}

- (TuWanDataIndexpicModel *)modelForArr:(NSArray *)arr row:(NSInteger)row{
    return arr[row];
}

/** 根据showtype 0是没有图，1是有图 */
- (BOOL)containImages:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].showtype isEqualToString:@"1"];
}

- (NSString *)titleForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].title;
}

- (NSURL *)iconURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].litpic];
}

- (NSString *)descForRowInList:(NSInteger)row{
    return [self modelForArr:self.dataArr row:row].longtitle;
}

- (NSString *)clicksForRowInList:(NSInteger)row{
    return [[self modelForArr:self.dataArr row:row].click stringByAppendingString:@"浏览人数"];
}

- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].litpic];
}

- (NSString *)titleForRowInIndexPic:(NSInteger)row{
    return [self modelForArr:self.indexPicArr row:row].title;
}

- (NSInteger)indexPicNumber{
    return self.indexPicArr.count;
}

- (NSURL *)detailURLForRowInList:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.dataArr row:row].html5];
}

- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row{
    return [NSURL URLWithString:[self modelForArr:self.indexPicArr row:row].html5];
}

@end
