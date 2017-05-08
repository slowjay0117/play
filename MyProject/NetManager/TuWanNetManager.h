//
//  TuWanNetManager.h
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseNetManager.h"
#import "TuWanModel.h"
// 只要公用一个解析类的请求，就可以合起来写，只需要使用枚举变量，来决定不同的请求地址即可

typedef NS_ENUM(NSUInteger, TuWanListType){
    TuWanListTouTiao,   //头条
    TuWanListDuJia,     //独家
    TuWanListAnHei,     //暗黑3
    TuWanListMoShou,    //魔兽
    TuWanListFengBao,   //风暴
    TuWanListLuShi,     //炉石
    TuWanListXingJi,    //星际2
    TuWanListShouWang,  //守望
    TuWanListTuPian,    //图片
    TuWanListShiPin,    //视频
    TuWanListGongLue,   //攻略
    TuWanListHuanHua,   //幻化
    TuWanListQuWen,     //趣闻
    TuWanListCOS,       //COS
    TuWanListMeiNv,     //美女
    TuWanListTuiJian    //推荐
};

@interface TuWanNetManager : BaseNetManager
+ (id)getTuWanListType:(TuWanListType)type start:(NSInteger)start completionHandler:(void(^)(TuWanModel *model, NSError *error))completionHandler;
@end
