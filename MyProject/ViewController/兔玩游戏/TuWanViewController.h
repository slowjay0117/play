//
//  TuWanViewController.h
//  MyProject
//
//  Created by will on 2017/5/12.
//  Copyright © 2017年 will. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WMPageController.h>

@interface TuWanViewController : WMPageController

// 内容页的首页应该是单例的，每次进程都只初始化一次
+ (UINavigationController *)standardTuWanNavi;

@end
