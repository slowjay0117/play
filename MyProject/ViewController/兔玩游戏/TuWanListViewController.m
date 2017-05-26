//
//  TuWanListViewController.m
//  MyProject
//
//  Created by will on 2017/5/25.
//  Copyright © 2017年 will. All rights reserved.
//

#import "TuWanListViewController.h"
#import "TuWanListCell.h"
#import "TuWanViewModel.h"
#import "TuWanImageCell.h"
#import <iCarousel.h>

@interface TuWanListViewController ()<iCarouselDelegate,iCarouselDataSource>
@property (nonatomic,strong) TuWanViewModel *tuwanVM;
@end

@implementation TuWanListViewController
{//添加成员变量，因为不需要懒加载，所以不需要是属性
    iCarousel *_ic;
    UIPageControl *_pageControl;
    UILabel *_titleLb;
    NSTimer *_timer;
}
/** 头部滚动视图 */
- (UIView *)headerView{
    [_timer invalidate];
    // 如果当前没有头部视图，返回nil
    if(!self.tuwanVM.isExistIndexPic) return nil;
    // 头部视图 origin无效，宽度无效，肯定是与table同宽
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, kWindowW/750 * 500)];
    // 添加底部视图
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = kRGBColor(240, 240, 240);
    [headView addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(0);
        make.height.mas_equalTo(35);
    }];
    _titleLb = [UILabel new];
    [bottomView addSubview:_titleLb];
    [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(0);
    }];
    _pageControl = [UIPageControl new];
    _pageControl.numberOfPages = self.tuwanVM.indexPicNumber;
    [bottomView addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(0);
        make.width.mas_lessThanOrEqualTo(60);
        make.width.mas_greaterThanOrEqualTo(20);
        make.left.mas_equalTo(_titleLb.mas_right).mas_equalTo(-10);
    }];
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:0];
    // 添加滚动栏
    _ic = [iCarousel new];
    [headView addSubview:_ic];
    [_ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(0);
        make.bottom.mas_equalTo(bottomView.mas_top).mas_equalTo(0);
    }];
    _ic.delegate = self;
    _ic.dataSource = self;
    _ic.pagingEnabled = YES;
    _ic.scrollSpeed = 1;
    // 如果只有一张图，则不显示圆点
    _pageControl.hidesForSinglePage = YES;
    // 如果只有一张图，则不可以滚动
    _ic.scrollEnabled = self.tuwanVM.indexPicNumber != 1;
    _pageControl.pageIndicatorTintColor = [UIColor redColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor blueColor];
    if (self.tuwanVM.indexPicNumber > 1) {
        _timer = [NSTimer bk_scheduledTimerWithTimeInterval:3 block:^(NSTimer *timer) {
            [_ic scrollToItemAtIndex:_ic.currentItemIndex+1 animated:YES];
        } repeats:YES];
    }
    // 小圆点 不能与用户交互
    _pageControl.userInteractionEnabled = NO;
    return headView;
}
#pragma mark - iCarouselDelegate
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.tuwanVM.indexPicNumber;
}
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view{
    if (!view) {
        view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, kWindowW/750 * 500 - 35)];
        UIImageView *imageView = [UIImageView new];
        [view addSubview:imageView];
        imageView.tag = 100;
        imageView.contentMode = 2;
        view.clipsToBounds = YES;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    [imageView setImageWithURL:[self.tuwanVM iconURLForRowInIndexPic:index] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
    return view;
}
/** 允许循环滚动 */
- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option == iCarouselOptionWrap) {
        return YES;
    }
    return value;
}
/** 监控当前滚动到第几个 */
- (void)carouselCurrentItemIndexDidChange:(iCarousel *)carousel{
    //DDLogVerbose(@"%ld", carousel.currentItemIndex);
    _titleLb.text = [self.tuwanVM titleForRowInIndexPic:carousel.currentItemIndex];
    _pageControl.currentPage = carousel.currentItemIndex;
}

- (TuWanViewModel *)tuwanVM{
    if (!_tuwanVM) {
        _tuwanVM = [[TuWanViewModel alloc]initWithType:_infoType.integerValue];
    }
    return _tuwanVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerClass:[TuWanListCell class] forCellReuseIdentifier:@"ListCell"];
    [self.tableView registerClass:[TuWanImageCell class] forCellReuseIdentifier:@"ImageCell"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.tuwanVM refreshDataCompletionHandle:^(NSError *error) {
           self.tableView.tableHeaderView = [self headerView];
           [self.tableView.mj_header endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
       [self.tuwanVM getMoreDataCompletionHandle:^(NSError *error) {
           self.tableView.tableHeaderView = [self headerView];
           [self.tableView.mj_footer endRefreshing];
           [self.tableView reloadData];
       }];
    }];
    [self.tableView.mj_header beginRefreshing];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tuwanVM.rowNumber;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.tuwanVM containImages:indexPath.row]) {
        TuWanImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ImageCell"];
        cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
        cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
        [cell.iconIV0.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][0] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV1.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][1] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        [cell.iconIV2.imageView setImageWithURL:[self.tuwanVM iconURLSForRowInList:indexPath.row][2] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_1"]];
        return cell;
    }
    TuWanListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ListCell" forIndexPath:indexPath];
    // placeholderImage当图片没有下载完成之前显示的图片
    [cell.iconIV.imageView setImageWithURL:[self.tuwanVM iconURLForRowInList:indexPath.row] placeholderImage:[UIImage imageNamed:@"cell_bg_noData_5"]];
    cell.titleLb.text = [self.tuwanVM titleForRowInList:indexPath.row];
    cell.longTitleLb.text = [self.tuwanVM descForRowInList:indexPath.row];
    cell.clicksNumLb.text = [self.tuwanVM clicksForRowInList:indexPath.row];
    return cell;
}
/** 去掉分割线左侧缝隙 */
kRemoveCellSeparator

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return [self.tuwanVM containImages:indexPath.row] ? 135 : 100;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
