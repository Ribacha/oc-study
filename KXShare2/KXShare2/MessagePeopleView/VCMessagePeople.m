//
//  VCMessagePeople.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/26.
//

#import "VCMessagePeople.h"
#import "MessagePeopleCell.h"
#import "VCMessage.h"

@interface VCMessagePeople ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<NSDictionary *> *dataSource;
@end

@implementation VCMessagePeople

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // 模拟数据（可以换成接口数据）
    self.dataSource = @[
        @{@"icon": @"img1", @"title": @"share西西", @"detail": @"你好呀"},
        @{@"icon": @"img2", @"title": @"李四", @"detail": @"今天去吗"},
        @{@"icon": @"img3", @"title": @"王五", @"detail": @"在忙吗"},
        @{@"icon": @"img4", @"title": @"赵六", @"detail": @"收到文件了吗"},
        @{@"icon": @"img5", @"title": @"小明", @"detail": @"哈哈哈"}
    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[MessagePeopleCell class] forCellReuseIdentifier:@"MessagePeopleCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.rowHeight = 80;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MessagePeopleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MessagePeopleCell" forIndexPath:indexPath];
    NSDictionary *data = self.dataSource[indexPath.row];
    [cell configureWithIcon:data[@"icon"] title:data[@"title"] detail:data[@"detail"]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        VCMessage *detailVC = [[VCMessage alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 点击后取消高亮
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
