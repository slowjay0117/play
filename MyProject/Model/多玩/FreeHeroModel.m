//
//  FreeHeroModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "FreeHeroModel.h"

@implementation FreeHeroModel
+ (NSDictionary *)objectClassInArray{
    return @{@"free" : [FreeHeroFreeModel class]};
}
@end

@implementation FreeHeroFreeModel
@end


