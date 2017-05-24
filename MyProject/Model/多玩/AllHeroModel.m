//
//  AllHeroModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "AllHeroModel.h"

@implementation AllHeroModel
+ (NSDictionary *)mj_objectClassInArray{
    return @{@"all" : [AllHeroAllModel class]};
}
@end

@implementation AllHeroAllModel
@end


