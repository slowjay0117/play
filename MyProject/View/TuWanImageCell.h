//
//  TuWanImageCell.h
//  MyProject
//
//  Created by will on 2017/5/25.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanImageCell : UITableViewCell
/** 题目标签 */
@property (nonatomic,strong) UILabel *titleLb;
/** 点击数标签 */
@property (nonatomic,strong) UILabel *clicksNumLb;
/** 图片1 */
@property (nonatomic,strong) UIImageView *iconIV0;
/** 图片2 */
@property (nonatomic,strong) UIImageView *iconIV1;
/** 图片3 */
@property (nonatomic,strong) UIImageView *iconIV2;

@end
