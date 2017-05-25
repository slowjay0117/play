//
//  TuWanListCell.h
//  MyProject
//
//  Created by will on 2017/5/25.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListCell : UITableViewCell
/** 左侧图片 */
@property (nonatomic,strong) UIImageView *iconIV;
/** 题目标签 */
@property (nonatomic,strong) UILabel *titleLb;
/** 长题目标签 */
@property (nonatomic,strong) UILabel *longTitleLb;
/** 点击数标签 */
@property (nonatomic,strong) UILabel *clicksNumLb;
@end
