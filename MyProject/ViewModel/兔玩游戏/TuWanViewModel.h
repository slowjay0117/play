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
/** 存放头部滚动栏 */
@property (nonatomic,strong) NSArray *indexPicArr;
/** 是否有头部滚动栏 */
@property (nonatomic, getter=isExistIndexPic) BOOL existIndexPic;
@property (nonatomic,assign) NSInteger start; // 当前页数索引值
@end
