//
//  FreeHeroModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class FreeHeroFreeModel;

@interface FreeHeroModel : BaseModel
@property (nonatomic, strong) NSArray<FreeHeroFreeModel *> *free;
@property (nonatomic, copy) NSString *desc;
@end

@interface FreeHeroFreeModel : NSObject
@property (nonatomic, copy) NSString *enName;
@property (nonatomic, copy) NSString *cnName;
@property (nonatomic, copy) NSString *rating;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *tags;
@end

