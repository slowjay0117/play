//
//  TuWanViewModel.h
//  MyProject
//
//  Created by will on 2017/5/24.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseViewModel.h"
#import "TuWanNetManager.h"

@interface TuWanViewModel : BaseViewModel
/** 必须使用此初始化方法，需要一个类型 */
- (instancetype)initWithType:(InfoType)type;
@property (nonatomic)InfoType type;

@property (nonatomic,assign) NSInteger rowNumber; // 当前行数
/** 判断某一行数据是否有图 */
- (BOOL)containImages:(NSInteger)row;

/** 返回列表中某行数据的题目 */
- (NSString *)titleForRowInList:(NSInteger)row;
/** 返回列表中某行数据的图片 */
- (NSURL *)iconURLForRowInList:(NSInteger)row;
/** 返回列表中某行数据的描述 */
- (NSString *)descForRowInList:(NSInteger)row;
/** 返回列表中某行数据的浏览人数 */
- (NSString *)clicksForRowInList:(NSInteger)row;

/** 滚动展示栏的图片 */
- (NSURL *)iconURLForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的文字 */
- (NSString *)titleForRowInIndexPic:(NSInteger)row;
/** 滚动展示栏的图片数量 */
@property (nonatomic,assign) NSInteger indexPicNumber;

/** 获取列表中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInList:(NSInteger)row;
/** 获取展示栏中某行数据对应的html5链接 */
- (NSURL *)detailURLForRowInIndexPic:(NSInteger)row;

/** 存放头部滚动栏 */
@property (nonatomic,strong) NSArray *indexPicArr;
/** 是否有头部滚动栏 */
@property (nonatomic, getter=isExistIndexPic) BOOL existIndexPic;
@property (nonatomic,assign) NSInteger start; // 当前页数索引值

/** 通过行数 返回此行中对应的图片链接数组 */
- (NSArray *)iconURLSForRowInList:(NSInteger)row;
@end
