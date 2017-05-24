//
//  GiftModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class GiftAModel;

@interface GiftModel : BaseModel
@property (nonatomic,strong) NSArray<GiftAModel *> *a;
@property (nonatomic,strong) NSArray<GiftAModel *> *d;
@property (nonatomic,strong) NSArray<GiftAModel *> *g;
@end

@interface GiftAModel : BaseModel
@property (nonatomic,strong) NSString *ID;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSArray<NSString *> *level;
@end
