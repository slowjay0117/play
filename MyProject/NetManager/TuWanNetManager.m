//
//  TuWanNetManager.m
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TuWanNetManager.h"

#define kPath   @"http://cache.tuwan.com/app/"
#define kAppid  @"appid":@"1"
#define kAppver @"appver":@"2.1"
#define kClassmore @"classmore":@"indexpic" //头条，暗黑，魔兽，风暴，炉石，COS，趣闻，美女
#define KDtid   @"dtid":@"83623,31528,31537,31538,57067,91821"  //图片，视频，攻略
#define kClass  @"class":@"heronews"    //独家，幻化，趣闻，美女


@implementation TuWanNetManager
// 方法：把path和参数拼接起来，把字符串中的中文转换为 百分号 形式，因为有的服务器不接收中文编码
+ (NSString *)percentPathWithPath:(NSString *)path params:(NSDictionary *)params{
    NSMutableString *percentPath = [NSMutableString stringWithString:path];
    NSArray *keys = params.allKeys;
    NSInteger count = keys.count;
    // OC语言特性是runtime，实际上我们调用一个方法，底层操作是 在一个方法列表中搜索你调用的方法所在的地址，然后调用完毕之后把这个方法名转移到常用方法列表。所以如果再次执行某个方法就在常用方法列表中搜索调用，效率更高。
    for (int i = 0; i < count; i++) {
        if (i == 0) {
            [percentPath appendFormat:@"?%@=%@", keys[i], params[keys[i]]];
        } else {
            [percentPath appendFormat:@"&%@=%@", keys[i], params[keys[i]]];
        }
    }
    // 把字符串中的中文转为%号形式
    return [percentPath stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
}

+ (id)getTuWanListType:(TuWanListType)type start:(NSInteger)start completionHandler:(void (^)(TuWanModel *, NSError *))completionHandler{
    NSString *path = kPath;
    NSDictionary *parms = @{};
    switch (type) {
        case TuWanListTouTiao:
            parms = @{kAppid, kClassmore, kAppver, @"start":@(start)};
            break;
        case TuWanListDuJia:
            parms = @{kAppid, kClass, @"mod":@"八卦",kAppver , @"start":@(start)};
            break;
        case TuWanListAnHei:
            parms = @{kAppid, @"dtid":@"83623", kClassmore, kAppver, @"start":@(start)};
            break;
        case TuWanListMoShou:
            parms = @{kAppid, @"dtid":@"31537", kClassmore, kAppver, @"start":@(start)};
            break;
        case TuWanListFengBao:
            parms = @{kAppid, @"dtid":@"31538", kClassmore, kAppver, @"start":@(start)};
            break;
        case TuWanListLuShi:
            parms = @{kAppid, @"dtid":@"31528", kClassmore, kAppver, @"start":@(start)};
            break;
        case TuWanListXingJi:
            parms = @{kAppid, @"dtid":@"91821", kAppver, @"start":@(start)};
            break;
        case TuWanListShouWang:
            parms = @{kAppid, @"dtid":@"57067", kAppver, @"start":@(start)};
            break;
        case TuWanListTuPian:
            parms = @{kAppid, @"type":@"pic", KDtid, kAppver, @"start":@(start)};
            break;
        case TuWanListShiPin:
            parms = @{kAppid, @"type":@"video", KDtid, kAppver, @"start":@(start)};
            break;
        case TuWanListGongLue:
            parms = @{kAppid, @"type":@"guide", KDtid, kAppver, @"start":@(start)};
            break;
        case TuWanListHuanHua:
            parms = @{kAppid, kClass, @"mod":@"幻化", kAppver, @"start":@(start)};
            break;
        case TuWanListQuWen:
            parms = @{kAppid, @"dtid":@"0", kClass, @"mod":@"趣闻", kClassmore, kAppver, @"strat":@(start)};
            break;
        case TuWanListCOS:
            parms = @{kAppid, @"class":@"cos", @"mod":@"mod", kClassmore, @"dtid":@"0", kAppver, @"start":@(start)};
            break;
        case TuWanListMeiNv:
            parms = @{kAppid, kClass, @"mod":@"", kClassmore, @"typechild":@"cos", kAppver, @"start":@(start)};
            break;
        case TuWanListTuiJian:
            parms = @{kAppid, @"class":@"cookielike", @"id":@"", kAppver, @"start":@(start)};
            break;
        default:
            break;
    }
    return [self GET:path parameters:parms completionHandler:^(id responseObj, NSError *error) {
        completionHandler([TuWanModel mj_objectWithKeyValues:responseObj], error);
    }];
}
@end
