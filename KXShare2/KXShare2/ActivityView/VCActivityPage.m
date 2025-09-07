//
//  VCActivityPage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCActivityPage.h"
#import "ActivityCell.h"

@interface VCActivityPage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray *data;
@end

@implementation VCActivityPage

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 模拟三条数据（以后也可以从接口获取）
    self.data = @[
        @{@"image": @"main_img1", @"title": @"活动 1 - 下厨也要美美的"},
        @{@"image": @"main_img2", @"title": @"活动 2 - 夏日清凉挑战赛"},
        @{@"image": @"main_img3", @"title": @"活动 3 - 社区运动嘉年华"}
    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[ActivityCell class] forCellReuseIdentifier:@"ActivityCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    UIView* blackView = [[UIView alloc] initWithFrame:CGRectMake(0,
        self.view.frame.size.height - 34,
        self.view.frame.size.width,
        34)];
    blackView.backgroundColor = [UIColor blackColor];
    blackView.tag = 9999;
    [self.view addSubview:blackView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ActivityCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityCell" forIndexPath:indexPath];
    NSDictionary *item = self.data[indexPath.row];
    [cell configureWithImage:item[@"image"] title:item[@"title"]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 210;
}

@end
