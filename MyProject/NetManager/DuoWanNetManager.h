//
//  DuoWanNetManager.h
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseNetManager.h"

@interface DuoWanNetManager : BaseNetManager
+ (id)getHeroWithType:(NSString *)type CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
+ (id)getHeroVideoWithPage:(NSInteger)page Tag:(NSString *)tag CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
+ (id)getHeroSKinAndCZAndDetailAndGiftAndChangeWithType:(NSString *)type HeroName:(NSString *)name CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
+ (id)getZBItemWithTag:(NSString *)tag CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
+ (id)getItemDetailWithID:(NSInteger)ID CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
+ (id)getToolMenuAndZBCategoryAndGiftAndRuneAndSumAbilityAndBestGroupWithType:(NSString *)type CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getToolMenuWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getZBCategoryWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getGiftWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getRuneWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getSumAbilityWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getBestGroupWithCompleteionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getHeroSkinWithHero:(NSString *)hero CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getHeroCZWithChampionName:(NSString *)name CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getHeroDetailWithHeroName:(NSString *)name CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getHeroGiftWithHero:(NSString *)name CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getHeroChangeWithHero:(NSString *)name CompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getFreeHeroWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
//+ (id)getAllHeroWithCompletionHandler:(void(^)(id responseObj, NSError *error))complete;
@end
