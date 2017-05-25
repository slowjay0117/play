//
//  TuWanListViewController.h
//  MyProject
//
//  Created by will on 2017/5/25.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TuWanListViewController : UITableViewController
/** 接收外部传参，决定当前控制器显示哪种类型的信息 */
@property (nonatomic,strong) NSNumber *infoType;
@end
