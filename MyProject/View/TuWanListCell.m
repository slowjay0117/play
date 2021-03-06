//
//  TuWanListCell.m
//  MyProject
//
//  Created by will on 2017/5/25.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TuWanListCell.h"

@implementation TuWanListCell
- (MyImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [MyImageView new];
        // 内容模式：保持比例，填充满
        //_iconIV.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _iconIV;
}

- (UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [UILabel new];
        _titleLb.font = [UIFont systemFontOfSize:17];
    }
    return _titleLb;
}

- (UILabel *)longTitleLb{
    if (!_longTitleLb) {
        _longTitleLb = [UILabel new];
        _longTitleLb.font = [UIFont systemFontOfSize:14];
        _longTitleLb.textColor = [UIColor lightGrayColor];
        _longTitleLb.numberOfLines = 0;
    }
    return _longTitleLb;
}

- (UILabel *)clicksNumLb{
    if (!_clicksNumLb) {
        _clicksNumLb = [UILabel new];
        _clicksNumLb.textColor = [UIColor lightGrayColor];
        _clicksNumLb.font = [UIFont systemFontOfSize:12];
    }
    return _clicksNumLb;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self.contentView addSubview:self.iconIV];
        [self.contentView addSubview:self.titleLb];
        [self.contentView addSubview:self.longTitleLb];
        [self.contentView addSubview:self.clicksNumLb];
        
        // 图片 左10，宽高92、70，竖向居中
        [self.iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(92, 90));
            make.centerY.mas_equalTo(0);
        }];
        // 题目 距离图片右边缘8，右边缘10，上边缘比图片上边缘矮3
        [self.titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(8);
            make.right.mas_equalTo(-10);
            make.topMargin.mas_equalTo(self.iconIV.mas_topMargin).mas_equalTo(3);
        }];
        // 长题目 左右边缘与题目一样，上边距离题目下边8像素
        [self.longTitleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leftMargin.mas_equalTo(self.titleLb.mas_leftMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(8);
        }];
        // 点击数 下边缘与图片对齐，右边缘与任意title对齐
        [self.clicksNumLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottomMargin.mas_equalTo(self.iconIV.mas_bottomMargin);
            make.rightMargin.mas_equalTo(self.titleLb.mas_rightMargin);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
