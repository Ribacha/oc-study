//
//  MyInformation.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "MyInformation.h"
#import "InformationCell.h"
#import "VCAttention.h"
#import "VCMessage.h"
#import "VCMessagePeople.h"

@interface MyInformation ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray *data; // 存放每一行的数据
@end

@implementation MyInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = @[
        @{@"icon": @"play.fill", @"title": @"评论"},
        @{@"icon": @"play.fill", @"title": @"推荐我的"},
        @{@"icon": @"play.fill", @"title": @"新关注的"},
        @{@"icon": @"play.fill", @"title": @"私信"},
        @{@"icon": @"play.fill", @"title": @"我上传的"}
    ];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[InformationCell class] forCellReuseIdentifier:@"InformationCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:@"InformationCell" forIndexPath:indexPath];
    
    NSDictionary *item = self.data[indexPath.row];
    cell.titleLabel.text = item[@"title"];
    cell.iconView.image = [UIImage imageNamed:item[@"icon"]];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 2) {
        VCAttention *vc = [[VCAttention alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if (indexPath.row == 3) {
        VCMessagePeople *vc = [[VCMessagePeople alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
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
