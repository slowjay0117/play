//
//  HeroCZModel.m
//  MyProject
//
//  Created by will on 2017/5/10.
//  Copyright © 2017年 will. All rights reserved.
//

#import "HeroCZModel.h"

@implementation HeroCZModel
+ (id)mj_replacedKeyFromPropertyName121:(NSString *)propertyName{
    // loveYou -> love_you
    return [propertyName mj_underlineFromCamel];
}
@end


