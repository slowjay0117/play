//
//  AlbumModel.h
//  MyProject
//
//  Created by will on 2017/5/11.
//  Copyright © 2017年 will. All rights reserved.
//

#import "BaseModel.h"

@class AlbumAlbumModel,AlbumTracksModel,AlbumTracksListModel;
@interface AlbumModel : BaseModel

@property (nonatomic, strong) AlbumTracksModel *tracks;

@property (nonatomic, strong) AlbumAlbumModel *album;

@property (nonatomic, copy) NSString *msg;

@property (nonatomic, assign) NSInteger ret;

@end
@interface AlbumAlbumModel : NSObject

@property (nonatomic, assign) NSInteger playTimes;

@property (nonatomic, assign) long long updatedAt;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, assign) NSInteger categoryId;

@property (nonatomic, copy) NSString *shortIntro;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) BOOL hasNew;

@property (nonatomic, assign) NSInteger serializeStatus;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *introRich;

@property (nonatomic, assign) BOOL isFavorite;

@property (nonatomic, assign) BOOL isVerified;

@property (nonatomic, assign) NSInteger playTrackId;

@property (nonatomic, assign) NSInteger shares;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, copy) NSString *intro;

@property (nonatomic, copy) NSString *coverLargePop;

@property (nonatomic, assign) NSInteger unReadAlbumCommentCount;

@property (nonatomic, assign) BOOL canShareAndStealListen;

@property (nonatomic, assign) BOOL isRecordDesc;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, copy) NSString *categoryName;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger serialState;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, assign) NSInteger followers;

@property (nonatomic, assign) long long lastUptrackAt;

@property (nonatomic, copy) NSString *coverOrigin;

@property (nonatomic, copy) NSString *tags;

@property (nonatomic, assign) NSInteger offlineType;

@property (nonatomic, assign) BOOL canInviteListen;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, copy) NSString *coverWebLarge;

@property (nonatomic, assign) NSInteger tracks;

@property (nonatomic, assign) BOOL isFollowed;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *shortIntroRich;

@property (nonatomic, copy) NSString *customSubTitle;

@property (nonatomic, copy) NSString *avatarPath;

@property (nonatomic, assign) NSInteger refundSupportType;

@property (nonatomic, copy) NSString *coverSmall;

@end

@interface AlbumTracksModel : NSObject

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, strong) NSArray<AlbumTracksListModel *> *list;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger totalCount;

@end

@interface AlbumTracksListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger userSource;

@property (nonatomic, assign) NSInteger processState;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger likes;

@property (nonatomic, copy) NSString *playPathHq;

@property (nonatomic, copy) NSString *coverMiddle;

@property (nonatomic, assign) BOOL isPaid;

@property (nonatomic, assign) NSInteger shares;

@property (nonatomic, copy) NSString *playPathAacv224;

@property (nonatomic, assign) long long createdAt;

@property (nonatomic, copy) NSString *smallLogo;

@property (nonatomic, assign) NSInteger albumId;

@property (nonatomic, assign) NSInteger playtimes;

@property (nonatomic, copy) NSString *playUrl64;

@property (nonatomic, copy) NSString *playPathAacv164;

@property (nonatomic, copy) NSString *playUrl32;

@property (nonatomic, assign) NSInteger uid;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, copy) NSString *coverLarge;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, assign) NSInteger trackId;

@property (nonatomic, assign) NSInteger opType;

@property (nonatomic, assign) BOOL isPublic;

@end

