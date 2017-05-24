//
//  XiMaNetManager.h
//  MyProject
//
//  Created by will on 2017/5/5.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseNetManager.h"

@interface XiMaNetManager : BaseNetManager
+ (id)getRankingListWithPageID:(NSInteger)page completionHandle:(void(^)(id responseObj, NSError *error))complete;
+ (id)getAlbumModelWithID:(NSInteger)ID pageID:(NSInteger)pageID completionHandle:(void(^)(id responseObj, NSError *error))complete;
@end
