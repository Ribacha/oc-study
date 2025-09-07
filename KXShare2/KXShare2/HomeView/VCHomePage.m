//
//  VCHomePage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCHomePage.h"
#import "HomeFirstCell.h"
#import "HomeSecondCell.h"
#import "VCDetail.h"
#import "HomeThirdCell.h"
#import "HomeFourthCell.h"
#import "HomeFifthCell.h"
@interface VCHomePage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSMutableArray<MyModel *> *dataSource;
@end

@implementation VCHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dataSource = [NSMutableArray array];
    MyModel *model = [[MyModel alloc] init];
    model.isLiked = NO;
    [self.dataSource addObject:model];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height - self.tabBarController.tabBar.frame.size.height) style:UITableViewStylePlain];
    [self.tableView registerClass:[HomeFirstCell class] forCellReuseIdentifier:@"HomeFirstCell"];
    [self.tableView registerClass:[HomeSecondCell class] forCellReuseIdentifier:@"HomeSecondCell"];
    [self.tableView registerClass:[HomeThirdCell class] forCellReuseIdentifier:@"HomeThirdCell"];
    [self.tableView registerClass:[HomeFourthCell class] forCellReuseIdentifier:@"HomeFourthCell"];
    [self.tableView registerClass:[HomeFifthCell class] forCellReuseIdentifier:@"HomeFifthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    UITabBarAppearance *appearance = [[UITabBarAppearance alloc] init];
    [appearance configureWithTransparentBackground]; // 透明背景
    self.tabBarController.tabBar.standardAppearance = appearance;
    if (@available(iOS 15.0, *)) {
        self.tabBarController.tabBar.scrollEdgeAppearance = appearance;
    }
    self.dataSource = [NSMutableArray array];
        for (int i = 0; i < 5; i++) {
            MyModel *model = [[MyModel alloc] init];
            model.isLiked = NO;
            model.likeCount = 0;
            [self.dataSource addObject:model];
        }
    UIView* blackView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height - 34,self.view.frame.size.width,34)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.tag = 9999;
    [self.view addSubview:blackView];
    [self.view bringSubviewToFront:blackView];
//    self.tabBarController.tabBar.translucent = NO;
//    self.tabBarController.tabBar.backgroundColor = [UIColor blackColor];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        HomeFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFirstCell" forIndexPath:indexPath];
        cell.imageNames = @[@"main_img1", @"main_img2", @"main_img3", @"main_img4"];
        return cell;
    } else if(indexPath.row == 1) {
        HomeSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSecondCell" forIndexPath:indexPath];
        MyModel* model = self.dataSource[indexPath.row];
        [cell configureWithModel:model];
        __weak typeof(cell) weakCell = cell;
        cell.likeButtonAction = ^{
            if (model.isLiked) {
                model.likeCount -= 1;
            } else {
                model.likeCount += 1;
            }
            model.isLiked = !model.isLiked;
            __strong typeof(weakCell) strongCell = weakCell;
            if (!strongCell) return;

            strongCell.likeCountLabel1.text = [NSString stringWithFormat:@"%ld", (long)model.likeCount];
            NSString *imageName = model.isLiked ? @"红心" : @"蓝心";
            [strongCell.likeButton2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        };
        return cell;
    } else if (indexPath.row == 2){
        HomeThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeThirdCell" forIndexPath:indexPath];
        MyModel* model = self.dataSource[indexPath.row];
        [cell configureWithModel:model];
        __weak typeof(cell) weakCell = cell;
        cell.likeButtonAction = ^{
            if (model.isLiked) {
                model.likeCount -= 1;
            } else {
                model.likeCount += 1;
            }
            model.isLiked = !model.isLiked;
            __strong typeof(weakCell) strongCell = weakCell;
            if (!strongCell) return;

            strongCell.likeCountLabel1.text = [NSString stringWithFormat:@"%ld", (long)model.likeCount];
            NSString *imageName = model.isLiked ? @"红心" : @"蓝心";
            [strongCell.likeButton2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        };
        return cell;
    } else if (indexPath.row == 3) {
        HomeFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFourthCell" forIndexPath:indexPath];
        MyModel* model = self.dataSource[indexPath.row];
        [cell configureWithModel:model];
        __weak typeof(cell) weakCell = cell;
        cell.likeButtonAction = ^{
            if (model.isLiked) {
                model.likeCount -= 1;
            } else {
                model.likeCount += 1;
            }
            model.isLiked = !model.isLiked;
            __strong typeof(weakCell) strongCell = weakCell;
            if (!strongCell) return;

            strongCell.likeCountLabel1.text = [NSString stringWithFormat:@"%ld", (long)model.likeCount];
            NSString *imageName = model.isLiked ? @"红心" : @"蓝心";
            [strongCell.likeButton2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        };
        return cell;
    } else if (indexPath.row == 4) {
        HomeFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFifthCell" forIndexPath:indexPath];
        MyModel* model = self.dataSource[indexPath.row];
        [cell configureWithModel:model];
        __weak typeof(cell) weakCell = cell;
        cell.likeButtonAction = ^{
            if (model.isLiked) {
                model.likeCount -= 1;
            } else {
                model.likeCount += 1;
            }
            model.isLiked = !model.isLiked;
            __strong typeof(weakCell) strongCell = weakCell;
            if (!strongCell) return;

            strongCell.likeCountLabel1.text = [NSString stringWithFormat:@"%ld", (long)model.likeCount];
            NSString *imageName = model.isLiked ? @"红心" : @"蓝心";
            [strongCell.likeButton2 setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
        };
        return cell;
    } else {
        return nil;
    }
 }
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 240;
        } else if (indexPath.row == 1) {
            return 160;
        } else if (indexPath.row == 2) {
            return 160;
        } else if (indexPath.row == 3) {
            return 160;
        } else if (indexPath.row == 4) {
            return 160;
        }
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 1) {
        MyModel *model = self.dataSource[0];
        VCDetail *detailVC = [[VCDetail alloc] initWithModel:model];
        detailVC.likeStatusChanged = ^{
            [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
        };
        [self.navigationController pushViewController:detailVC animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

