//
//  RuneModel.h
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class RunePurpleModel;

@interface RuneModel : BaseModel
@property (nonatomic, strong) NSArray<RunePurpleModel *> *purple;
@property (nonatomic, strong) NSArray<RunePurpleModel *> *blue;
@property (nonatomic, strong) NSArray<RunePurpleModel *> *yellow;
@property (nonatomic, strong) NSArray<RunePurpleModel *> *red;
@end

@interface RunePurpleModel : NSObject
@property (nonatomic, copy) NSString *img;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *lev3;
@property (nonatomic, assign) NSInteger recom;
@property (nonatomic, copy) NSString *lev2;
@property (nonatomic, assign) NSInteger iplev3;
@property (nonatomic, copy) NSString *units;
@property (nonatomic, assign) NSInteger type;
@property (nonatomic, copy) NSString *standby;
@property (nonatomic, copy) NSString *lev1;
@property (nonatomic, assign) NSInteger iplev2;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *prop;
@property (nonatomic, assign) NSInteger iplev1;
@end


