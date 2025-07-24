//
//  VCArticlePage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCArticlePage.h"
#import "ArticleFirstCell.h"
#import "ArticleSecondCell.h"
#import "ArticleThirdCell.h"
#import "ArticleFourthCell.h"
#import "ArticleFifthCell.h"
#import "ArticleSixthCell.h"
#import "HomeSecondCell.h"
#import "HomeThirdCell.h"
#import "HomeFourthCell.h"
@interface VCArticlePage ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UISegmentedControl* segmentedControl;
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UITableView* tableView2;
@property (nonatomic, strong) UITableView* tableView3;
@end

@implementation VCArticlePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"精选文章", @"热门推荐", @"全部文章"]];
    self.segmentedControl.frame = CGRectMake(0, 110, self.view.frame.size.width, 50);
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    CGFloat y = CGRectGetMaxY(self.segmentedControl.frame) + 10;
    CGFloat scrollViewHeight = self.view.frame.size.height - y;
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, self.view.frame.size.width, scrollViewHeight)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.showsHorizontalScrollIndicator = YES;
    self.scrollView.delegate = self;
    self.scrollView.directionalLockEnabled = YES;
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 3, scrollViewHeight);
    
    CGFloat screenWidth = self.view.frame.size.width;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 2, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView registerClass:[ArticleFirstCell class] forCellReuseIdentifier:@"ArticleFirstCell"];
    [self.tableView registerClass:[ArticleSecondCell class] forCellReuseIdentifier:@"ArticleSecondCell"];
    [self.tableView registerClass:[ArticleThirdCell class] forCellReuseIdentifier:@"ArticleThirdCell"];
    [self.tableView registerClass:[ArticleFourthCell class] forCellReuseIdentifier:@"ArticleFourthCell"];
    [self.tableView registerClass:[ArticleFifthCell class] forCellReuseIdentifier:@"ArticleFifthCell"];
    [self.tableView registerClass:[ArticleSixthCell class] forCellReuseIdentifier:@"ArticleSixthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView];
    
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(self.view.frame.size.width * 1, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView2 registerClass:[ArticleFourthCell class] forCellReuseIdentifier:@"ArticleFourthCell"];
    [self.tableView2 registerClass:[ArticleFifthCell class] forCellReuseIdentifier:@"ArticleFifthCell"];
    [self.tableView2 registerClass:[ArticleSixthCell class] forCellReuseIdentifier:@"ArticleSixthCell"];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView2];
    
    self.tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView3 registerClass:[HomeThirdCell class] forCellReuseIdentifier:@"HomeThirdCell"];
    [self.tableView3 registerClass:[HomeFourthCell class] forCellReuseIdentifier:@"HomeFourthCell"];
    [self.tableView3 registerClass:[HomeSecondCell class] forCellReuseIdentifier:@"HomeSecondCell"];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    self.tableView3.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView3];
}

- (void) segmentChanged: (UISegmentedControl*) sender {
    NSInteger index = sender.selectedSegmentIndex;
    CGFloat offsetX = index * self.view.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView == self.scrollView) {
        NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
        self.segmentedControl.selectedSegmentIndex = index;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) {
            return 6;
        } else if (tableView == self.tableView2) {
            return 3;
        } else if (tableView == self.tableView3) {
            return 3;
        }
        return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView) {
        if (indexPath.row == 0) {
            ArticleFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleFirstCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            ArticleSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleSecondCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            ArticleThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleThirdCell" forIndexPath:indexPath];
            return cell;
        } else  if (indexPath.row == 3) {
            ArticleFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleFourthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 4) {
            ArticleFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleFifthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 5) {
            ArticleSixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleSixthCell" forIndexPath:indexPath];
            return cell;
        } else {
            return nil;
        }
    } else if (tableView == self.tableView2) {
        if (indexPath.row == 0) {
            ArticleFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleFourthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            ArticleFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleFifthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            ArticleSixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleSixthCell" forIndexPath:indexPath];
            return cell;
        } else {
            return nil;
        }
    } else if (tableView == self.tableView3) {
        if (indexPath.row == 0) {
            HomeThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeThirdCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            HomeFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeFourthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            HomeSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"HomeSecondCell" forIndexPath:indexPath];
            return cell;
        } else {
            return nil;
        }
    }
    return [[UITableViewCell alloc] init];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.tableView) {
        switch (indexPath.row) {
            case 0: return 180;
            case 1: return 180;
            case 2: return 180;
            case 3: return 150;
            case 4: return 200;
            case 5: return 160;
            default: return 44;
        }
    } else if (tableView == self.tableView2) {
        return 160;
    } else if (tableView == self.tableView3) {
        return 140;
    }
    return 44;
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
