//
//  DuoWanNetManager.m
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "DuoWanNetManager.h"

// 很挫具有共同点的东西，可以统一宏定义，比如
// 凡是自己写的宏定义 都需要用k开头，这是编码习惯
#define kOSType     @"OSType":@[[UIDevice currentDevice]systemVersion] //9.1是当前手机系统版本，需要到info文件中去取
// 把path写到文件头部，使用宏定义形势。方便后期维护
#define kHeroPath   @"http://lolbox.duowan.com/phone/apiHeroes.php" //免费+全部英雄
#define kHeroSkinPath   @"hppt://box.dwstatic.com/apiHeroSkin.php"  //英雄皮肤
// .......

@implementation DuoWanNetManager

@end
