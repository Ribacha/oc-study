//
//  ViewController.m
//  Demo cell
//
//  Created by 开开心心的macbook air on 2025/6/9.
//

#import "ViewController.h"
#import "MyInfoCell.h"
#import "MyNextCell.h"
@interface ViewController ()

@end

static NSString *str = @"id";
static NSString *str2 = @"id2";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [_tableView registerClass:[MyInfoCell class] forCellReuseIdentifier:str];
    [_tableView registerClass:[MyNextCell class] forCellReuseIdentifier:str2];
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    if (section == 1) {
        return 2;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100; // 头像那行比较高
    } else {
        return 50; // 其他为普通高度
    }
}
// 设置组头高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10; // 想要的间隔高度
}

//// 设置组头视图
//- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
//    UIView *headerView = [[UIView alloc] init];
//    headerView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:1]; // 浅灰色
//    return headerView;
//}
//
//// 同理也可以设置 footer（可选）
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0.01; // 避免系统默认黑线
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyInfoCell* cell = [self.tableView dequeueReusableCellWithIdentifier:str];
        return cell;
    }
    MyNextCell* cell = [tableView dequeueReusableCellWithIdentifier:str2];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            cell.tablelabel.text = @"支付";
            cell.tableImage.image = [UIImage imageNamed:@"金额.PNG"];
        } else if (indexPath.row == 1) {
            cell.tablelabel.text = @"收藏";
            cell.tableImage.image = [UIImage imageNamed:@"收藏.PNG"];
        }
    } else if (indexPath.section == 2) {
            cell.tablelabel.text = @"设置";
            cell.tableImage.image = [UIImage imageNamed:@"设置.PNG"];
        }
    return cell;
}

@end
