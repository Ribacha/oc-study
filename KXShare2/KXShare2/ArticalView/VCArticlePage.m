//
//  VCArticlePage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCArticlePage.h"
#import "ArticleCell.h"

@interface VCArticlePage ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITableView *tableView2;
@property (nonatomic, strong) UITableView *tableView3;
@property (nonatomic, strong) NSArray *data1;
@property (nonatomic, strong) NSArray *data2;
@property (nonatomic, strong) NSArray *data3;
@end

@implementation VCArticlePage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data1 = @[
        @{@"icon":@"img3",@"title":@"卡密",@"type":@"原创-插画-练习习作",@"time":@"15分钟前",@"author":@"share小李",@"likes":@0,@"views":@6,@"shares":@2},
        @{@"icon":@"img6",@"title":@"破败",@"type":@"原创-插画-练习习作",@"time":@"15分钟前",@"author":@"share佛耶戈",@"likes":@0,@"views":@6,@"shares":@2},
    ];
    
    self.data2 = @[
        @{@"icon":@"img4",@"title":@"文章4",@"type":@"原创-插画",@"time":@"10分钟前",@"author":@"作者A",@"likes":@3,@"views":@12,@"shares":@1},
        @{@"icon":@"img5",@"title":@"文章5",@"type":@"原创-插画",@"time":@"20分钟前",@"author":@"作者B",@"likes":@5,@"views":@8,@"shares":@0},
        @{@"icon":@"img6",@"title":@"文章6",@"type":@"原创-插画",@"time":@"30分钟前",@"author":@"作者C",@"likes":@2,@"views":@4,@"shares":@3}
    ];
    
    self.data3 = @[
        @{@"icon":@"img7",@"title":@"文章7",@"type":@"原创-插画",@"time":@"1小时前",@"author":@"作者D",@"likes":@1,@"views":@2,@"shares":@0},
        @{@"icon":@"img8",@"title":@"文章8",@"type":@"原创-插画",@"time":@"2小时前",@"author":@"作者E",@"likes":@0,@"views":@1,@"shares":@2},
        @{@"icon":@"img9",@"title":@"文章9",@"type":@"原创-插画",@"time":@"3小时前",@"author":@"作者F",@"likes":@4,@"views":@7,@"shares":@1}
    ];
    
    [self setupUI];
}

- (void)setupUI {
    CGFloat screenWidth = self.view.frame.size.width;
    
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"精选文章", @"热门推荐", @"全部文章"]];
    self.segmentedControl.frame = CGRectMake(0, 110, screenWidth, 50);
    self.segmentedControl.selectedSegmentIndex = 0;
    [self.segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.segmentedControl];
    
    CGFloat y = CGRectGetMaxY(self.segmentedControl.frame) + 10;
    CGFloat scrollViewHeight = self.view.frame.size.height - y;
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, y, screenWidth, scrollViewHeight)];
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(screenWidth*3, scrollViewHeight);
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView registerClass:[ArticleCell class] forCellReuseIdentifier:@"ArticleCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView];
    
    self.tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView2 registerClass:[ArticleCell class] forCellReuseIdentifier:@"ArticleCell"];
    self.tableView2.delegate = self;
    self.tableView2.dataSource = self;
    self.tableView2.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView2];
    
    self.tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(screenWidth*2, 0, screenWidth, scrollViewHeight) style:UITableViewStylePlain];
    [self.tableView3 registerClass:[ArticleCell class] forCellReuseIdentifier:@"ArticleCell"];
    self.tableView3.delegate = self;
    self.tableView3.dataSource = self;
    self.tableView3.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.scrollView addSubview:self.tableView3];
    
    UIView* blackView = [[UIView alloc] initWithFrame:CGRectMake(0,self.view.frame.size.height - 34, screenWidth, 34)];
    blackView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:blackView];
}

#pragma mark - 分段控制和滚动
- (void)segmentChanged:(UISegmentedControl *)sender {
    CGFloat offsetX = sender.selectedSegmentIndex * self.view.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger index = scrollView.contentOffset.x / scrollView.frame.size.width;
    self.segmentedControl.selectedSegmentIndex = index;
}

#pragma mark - TableView DataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView { return 1; }

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.tableView) return self.data1.count;
    if (tableView == self.tableView2) return self.data2.count;
    if (tableView == self.tableView3) return self.data3.count;
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 180; // 统一高度，也可以根据数据动态设置
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ArticleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ArticleCell" forIndexPath:indexPath];
    NSDictionary *data;
    if (tableView == self.tableView) data = self.data1[indexPath.row];
    else if (tableView == self.tableView2) data = self.data2[indexPath.row];
    else if (tableView == self.tableView3) data = self.data3[indexPath.row];
    [cell configureWithData:data];
    return cell;
}

@end
