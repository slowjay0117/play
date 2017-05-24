//
//  RankingListModel.h
//  MyProject
//
//  Created by will on 2017/5/11.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class RankingListListModel;
@interface RankingListModel : BaseModel

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) NSArray<RankingListListModel *> *list;

@property (nonatomic, assign) NSInteger ret;

@end
@interface RankingListListModel : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) NSInteger tracksCounts;

@property (nonatomic, assign) NSInteger playsCounts;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger isFinished;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger lastUptrackAt;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, copy) NSString *albumCoverUrl290;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger priceTypeId;

@property (nonatomic, assign) NSInteger lastUptrackId;

@end

