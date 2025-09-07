//
//  VCInformationSet.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCInformationSet.h"
#import "InformationSetCell.h"

@interface VCInformationSet ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSString *> *titles;
@end

@implementation VCInformationSet

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titles = @[
        @"接受新消息通知",
        @"通知显示栏",
        @"声音",
        @"振动",
        @"关注更新"
    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[InformationSetCell class] forCellReuseIdentifier:@"InformationSetCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InformationSetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetCell" forIndexPath:indexPath];
    NSString *title = self.titles[indexPath.row];
    [cell configureWithTitle:title atIndex:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
