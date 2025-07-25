//
//  MySet.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "MySet.h"
#import "SetFirstCell.h"
#import "SetSecondCell.h"
#import "SetThirdCell.h"
#import "SetFourthCell.h"
#import "SetFifthCell.h"
#import "VCBasicInformation.h"
#import "VCChangePassword.h"
#import "VCInformationSet.h"
@interface MySet ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation MySet

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[SetFirstCell class] forCellReuseIdentifier:@"SetFirstCell"];
    [self.tableView registerClass:[SetSecondCell class] forCellReuseIdentifier:@"SetSecondCell"];
    [self.tableView registerClass:[SetThirdCell class] forCellReuseIdentifier:@"SetThirdCell"];
    [self.tableView registerClass:[SetFourthCell class] forCellReuseIdentifier:@"SetFourthCell"];
    [self.tableView registerClass:[SetFifthCell class] forCellReuseIdentifier:@"SetFifthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        SetFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SetFirstCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 1) {
        SetSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SetSecondCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 2) {
        SetThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SetThirdCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 3) {
        SetFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SetFourthCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 4) {
        SetFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"SetFifthCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 60;
        }
        if (indexPath.row == 1) {
            return 60;
        }
        if (indexPath.row == 2) {
            return 60;
        }
        if (indexPath.row == 3) {
            return 60;
        }
        if (indexPath.row == 4) {
            return 60;
        }
        if (indexPath.row == 5) {
            return 60;
        }
    }
    return 44;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        VCBasicInformation* detailVC = [[VCBasicInformation alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
    if (indexPath.row == 1) {
        VCChangePassword* detailVC2 = [[VCChangePassword alloc] init];
        [self.navigationController pushViewController:detailVC2 animated:YES];
    }
    if (indexPath.row == 2) {
        VCInformationSet* detailVC3 = [[VCInformationSet alloc] init];
        [self.navigationController pushViewController:detailVC3 animated:YES];
    }
    if (indexPath.row == 4) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"确定要清除缓存吗？" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
               // 弹出“缓存已清除”提示
               UIAlertController *successAlert = [UIAlertController alertControllerWithTitle:nil
                                                                                     message:@"缓存已清除"
                                                                              preferredStyle:UIAlertControllerStyleAlert];
               [self presentViewController:successAlert animated:YES completion:nil];
               // 1 秒后自动消失
               dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                   [successAlert dismissViewControllerAnimated:YES completion:nil];
               });
           }];

           [alert addAction:cancelAction];
           [alert addAction:confirmAction];
           [self presentViewController:alert animated:YES completion:nil];
    }
    
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
