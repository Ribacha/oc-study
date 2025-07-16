//
//  VCMyClass.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "VCMyClass.h"
#import "MyInfoCell.h"
#import "MyNextCell.h"
#import "MyJumpVC.h"
@interface VCMyClass ()

@end
static NSString *str = @"id";
static NSString *str2 = @"id2";
@implementation VCMyClass

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
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MyJumpVC* detailVC = [[MyJumpVC alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}//点击跳转函数
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
