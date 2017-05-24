//
//  AlbumModel.m
//  MyProject
//
//  Created by will on 2017/5/11.
//  Copyright © 2017年 will. All rights reserved.
//

#import "AlbumModel.h"

@implementation AlbumModel
@end
@implementation AlbumAlbumModel
@end
@implementation AlbumTracksModel
+ (NSDictionary *)objectClassInArray{
    return @{@"list" : [AlbumTracksListModel class]};
}
@end
@implementation AlbumTracksListModel
@end


