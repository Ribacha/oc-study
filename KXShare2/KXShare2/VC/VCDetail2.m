//
//  VCDetail2.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/23.
//

#import "VCDetail2.h"
#import "DetailCell1.h"
#import "DetailCell2.h"
@interface VCDetail2 ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView* tableView;
@end

@implementation VCDetail2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, 395, 1100)];
    [self.tableView registerClass:[DetailCell1 class] forCellReuseIdentifier:@"DetailCell1"];
    [self.tableView registerClass:[DetailCell2 class] forCellReuseIdentifier:@"DetailCell2"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    self.view.backgroundColor = [UIColor whiteColor];
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(5, 110, 395, 40)];
    self.textField.placeholder = @"搜索 用户名 作品分类 文章";
    self.textField.borderStyle = UITextBorderStyleRoundedRect;
    self.textField.text = self.searchText;
    [self.view addSubview:self.textField];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        DetailCell1* cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell1" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1){
        DetailCell2* cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell2" forIndexPath:indexPath];
        return cell;
    } else {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 160;
    } else if (indexPath.row == 1) {
        return 160;
    }
    return 44;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES; // 隐藏底部 TabBar
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO; // 离开页面时恢复显示 TabBar
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
