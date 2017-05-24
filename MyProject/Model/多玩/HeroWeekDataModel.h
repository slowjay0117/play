//
//  HeroWeekDataModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class HeroWeekDataDataModel,HeroWeekDataDataChartsModel,HeroWeekDataDataChartsRatioDataModel;

@interface HeroWeekDataModel : BaseModel

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, strong) HeroWeekDataDataModel *data;

@property (nonatomic, assign) NSInteger code;

@end
@interface HeroWeekDataDataModel : NSObject

@property (nonatomic, strong) NSArray<HeroWeekDataDataChartsModel *> *charts;

@property (nonatomic, assign) NSInteger averageWinRatio;

@property (nonatomic, assign) NSInteger averageKNum;

@property (nonatomic, assign) NSInteger championId;

@property (nonatomic, assign) NSInteger averageDNum;

@property (nonatomic, assign) NSInteger averageANum;

@property (nonatomic, assign) NSInteger rank;

@end

@interface HeroWeekDataDataChartsModel : NSObject

@property (nonatomic, copy) NSString *color;

@property (nonatomic, strong) NSArray<HeroWeekDataDataChartsRatioDataModel *> *ratioData;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *yAxisTitle;

@end

@interface HeroWeekDataDataChartsRatioDataModel : NSObject

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger value;

@end

