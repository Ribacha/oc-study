//
//  VCAttention.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCAttention.h"
#import "AttentionCell.h"

@interface VCAttention ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *dataArray;
@end

@implementation VCAttention

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.dataArray = @[
        @{@"icon":@"a1",@"name":@"share小明"},
        @{@"icon":@"a2",@"name":@"share小红"},
        @{@"icon":@"a3",@"name":@"share小刚"},
        @{@"icon":@"a4",@"name":@"share库里"},
        @{@"icon":@"a5",@"name":@"share小李"},
        @{@"icon":@"a6",@"name":@"share小王"}
    ];

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[AttentionCell class] forCellReuseIdentifier:@"AttentionCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    AttentionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionCell" forIndexPath:indexPath];
    [cell configureWithData:self.dataArray[indexPath.row] index:indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;
}

@end
