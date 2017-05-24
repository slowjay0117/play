//
//  DuoWanNetManager.m
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "DuoWanNetManager.h"
#import "FreeHeroModel.h"
#import "AllHeroModel.h"
#import "HeroDetailModel.h"
#import "HeroChangeModel.h"
#import "ZBDetailModel.h"
#import "GiftModel.h"
#import "RuneModel.h"

// 很挫具有共同点的东西，可以统一宏定义，比如
// 凡是自己写的宏定义 都需要用k开头，这是编码习惯
#define kOSType     @"OSType":[[UIDevice currentDevice]systemVersion] //9.1是当前手机系统版本，需要到info文件中去取
// 把path写到文件头部，使用宏定义形势。方便后期维护
#define kHeroPath   @"http://lolbox.duowan.com/phone/apiHeroes.php" //免费+全部英雄
#define kHeroSkinPath   @"http://box.dwstatic.com/apiHeroSkin.php"  //英雄皮肤
#define kHeroVideoPath  @"http://box.dwstatic.com/apiVideoesNormalDuowan.php"   //英雄视频
#define kHeroCZPath     @"http://db.duowan.com/lolcz/img/ku11/api/lolcz.php"    //英雄出装
#define kHeroDetailPath @"http://lolbox.duowan.com/phone/apiHeroDetail.php"     //英雄资料
#define kHeroGiftPath   @"http://box.dwstatic.com/apiHeroSuggestedGiftAndRun.php"   //英雄天赋
#define kHeroChangePath @"http://db.duowan.com/boxnews/heroinfo.php"    //英雄改动
#define kToolMenuPath   @"http://box.dwstatic.com/apiToolMenu.php"  //游戏百科
#define kZBCategoryPath @"http://lolbox.duowan.com/phone/apiZBCategory.php" //装备分类
#define kZBItemPath     @"http://lolbox.duowan.com/phone/apiZBItemList.php" //某分类装备列表
#define kZBDetailPath   @"http://lolbox.duowan.com/phone/apiItemDetail.php" //装备详情
#define kGiftPath       @"http://lolbox.duowan.com/phone/apiGift.php"   //天赋
#define kRunePath       @"http://lolbox.duowan.com/phone/apiRunes.php?" //符文
#define kSumAbilityPath   @"http://lolbox.duowan.com/phone/apiSumAbility.php"   //召唤师技能
#define kBestGroupPath  @"http://box.dwstatic.com/apiHeroBestGroup.php" //最佳阵容
#define kV  @"v":@"140"
#define kVersionName @"versionName":@"2.4.0"
#define kSrc    @"src":@"letv"
// 数组解析类的返回
#define kReturn  \
[self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {\
complete(responseObj, error);\
}];\

@implementation DuoWanNetManager
+ (id)getHeroWithType:(NSString *)type CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = kHeroPath;
    NSDictionary *parms = @{};
    if ([type isEqualToString:@"免费"]) {
        parms = @{@"type":@"free", kV, kOSType};
        return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
            complete([FreeHeroModel mj_objectWithKeyValues:responseObj], error);
        }];
    } else if ([type isEqualToString:@"全部"]){
        parms = @{@"type":@"type", kV, kOSType};
        return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
            complete([AllHeroModel mj_objectWithKeyValues:responseObj], error);
        }];
    } else {
        return nil;
    }
}
+ (id)getHeroVideoWithPage:(NSInteger)page Tag:(NSString *)tag CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = kHeroVideoPath;
    NSDictionary *parms = @{@"page":@(page), @"tag":tag, kV, kOSType, kSrc, @"action":@"l"};
    return kReturn
}
+ (id)getHeroSKinAndCZAndDetailAndGiftAndChangeWithType:(NSString *)type HeroName:(NSString *)name CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = nil;
    NSDictionary *parms = @{};
    if ([type isEqualToString:@"皮肤"]) {
        path = kHeroSkinPath;
        parms = @{@"hero":name, kV, kOSType, kVersionName};
        return kReturn
    } else if ([type isEqualToString:@"出装"]) {
        path = kHeroCZPath;
        parms = @{kV, kOSType, @"championName":name, @"limit":@"7"};
        return kReturn
    } else if ([type isEqualToString:@"资料"])    {
        NSString *path = kHeroDetailPath;
        NSDictionary *parms = @{@"heroName":name, kV, kOSType};
        return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
            complete([HeroDetailModel mj_objectWithKeyValues:responseObj], error);
        }];
    } else if ([type isEqualToString:@"符文"]) {
        NSString *path = kHeroGiftPath;
        NSDictionary *parms = @{@"hero":name, kV, kOSType};
        return kReturn
    } else if ([type isEqualToString:@"改动"]) {
        NSString *path = kHeroChangePath;
        NSDictionary *parms = @{@"hero":name, kV, kOSType};
        return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
            complete([HeroChangeModel mj_objectWithKeyValues:responseObj], error);
        }];
    } else {
        return nil;
    }
}
+ (id)getZBItemWithTag:(NSString *)tag CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = kZBItemPath;
    NSDictionary *parms = @{@"tag":tag, kV, kOSType, kVersionName};
    return kReturn
}
+ (id)getItemDetailWithID:(NSInteger)ID CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = kZBDetailPath;
    NSDictionary *parms = @{@"id":@(ID), kV, kOSType};
    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
        complete([ZBDetailModel mj_objectWithKeyValues:responseObj], error);
    }];
}

+ (id)getToolMenuAndZBCategoryAndGiftAndRuneAndSumAbilityAndBestGroupWithType:(NSString *)type CompletionHandler:(void (^)(id, NSError *))complete{
    NSString *path = nil;
    NSMutableDictionary *parms = [NSMutableDictionary dictionaryWithDictionary:@{kV, kOSType, kVersionName}];
    if ([type isEqualToString:@"百科"]) {
        path = kToolMenuPath;
        [parms setObject:@"database" forKey:@"category"];
        return kReturn
    } else if ([type isEqualToString:@"装备分类"]) {
        path = kZBCategoryPath;
        return kReturn
    } else if ([type isEqualToString:@"天赋"]) {
        path = kGiftPath;
        [parms removeObjectForKey:@"versionName"];
        return kReturn
    } else if ([type isEqualToString:@"符文"]) {
        path = kRunePath;
        [parms removeObjectForKey:@"versionName"];
        return kReturn
    } else if ([type isEqualToString:@"召唤师技能"]) {
        path = kSumAbilityPath;
        [parms removeObjectForKey:@"versionName"];
        return kReturn
    } else if ([type isEqualToString:@"最佳阵容"]) {
        path = kBestGroupPath;
        [parms removeObjectForKey:@"versionName"];
        return kReturn;
    } else {
        return nil;
    }
}
//+ (id)getToolMenuWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kToolMenuPath;
//    NSDictionary *parms = @{@"category":@"database", kV, kOSType, kVersionName};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getZBCategoryWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kZBCategoryPath;
//    NSDictionary *parms = @{kV, kOSType, kVersionName};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getGiftWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kGiftPath;
//    NSDictionary *parms = @{kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete([GiftModel mj_objectWithFile:responseObj], error);
//    }];
//}
//+ (id)getRuneWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kRunePath;
//    NSDictionary *parms = @{kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete([RuneModel mj_objectWithFile:responseObj], error);
//    }];
//}
//+ (id)getSumAbilityWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kSumAbilityPath;
//    NSDictionary *parms = @{kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getBestGroupWithCompleteionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kBestGroupPath;
//    NSDictionary *parms = @{kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getHeroSkinWithHero:(NSString *)hero CompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroSkinPath;
//    NSDictionary *parms = @{@"hero":hero, kV, kOSType, kVersionName};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getHeroCZWithChampionName:(NSString *)name CompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroCZPath;
//    NSDictionary *parms = @{kV, kOSType, @"championName":name, @"limit":@"7"};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getHeroDetailWithHeroName:(NSString *)name CompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroDetailPath;
//    NSDictionary *parms = @{@"heroName":name, kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete([HeroDetailModel mj_objectWithKeyValues:responseObj], error);
//    }];
//}
//+ (id)getHeroGiftWithHero:(NSString *)name CompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroGiftPath;
//    NSDictionary *parms = @{@"hero":name, kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete(responseObj, error);
//    }];
//}
//+ (id)getHeroChangeWithHero:(NSString *)name CompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroChangePath;
//    NSDictionary *parms = @{@"hero":name, kV, kOSType};
//    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
//        complete([HeroChangeModel mj_objectWithKeyValues:responseObj], error);
//    }];
//}
//+ (id)getFreeHeroWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroPath;
//    NSDictionary *dic = @{@"type":@"free", kV, kOSType};
//    return [self GET:path parameters:dic completionHandler:^(id responseObj, NSError *error) {
//        complete([FreeHeroModel mj_objectWithKeyValues:responseObj], error);
//    }];
//}
//+ (id)getAllHeroWithCompletionHandler:(void (^)(id, NSError *))complete{
//    NSString *path = kHeroPath;
//    NSDictionary *dic = @{@"type":@"all", kV, kOSType};
//    return [self GET:path parameters:dic completionHandler:^(id responseObj, NSError *error) {
//        complete([AllHeroModel mj_objectWithKeyValues:responseObj], error);
//    }];
//}
@end
