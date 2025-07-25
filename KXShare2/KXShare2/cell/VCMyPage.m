//
//  VCMyPage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCMyPage.h"
#import "MyPersonCell.h"
#import "MyFirstCell.h"
#import "MySecondCell.h"
#import "MyThirdCell.h"
#import "MyFourthCell.h"
#import "MyFifthCell.h"
#import "MySixthCell.h"
#import "MyPersonUpload.h"
#import "MyInformation.h"
#import "MySet.h"
#import "VCInformationSet.h"
@interface VCMyPage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation VCMyPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[MyPersonCell class] forCellReuseIdentifier:@"MyPersonCell"];
    [self.tableView registerClass:[MyFirstCell class] forCellReuseIdentifier:@"MyFirstCell"];
    [self.tableView registerClass:[MySecondCell class] forCellReuseIdentifier:@"MySecondCell"];
    [self.tableView registerClass:[MyThirdCell class] forCellReuseIdentifier:@"MyThirdCell"];
    [self.tableView registerClass:[MyFourthCell class] forCellReuseIdentifier:@"MyFourthCell"];
    [self.tableView registerClass:[MyFifthCell class] forCellReuseIdentifier:@"MyFifthCell"];
    [self.tableView registerClass:[MySixthCell class] forCellReuseIdentifier:@"MySixthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else {
        return 6;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            MyPersonCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyPersonCell" forIndexPath:indexPath];
            return cell;
        } else {
            return nil;
        }
    } else {
        if (indexPath.row == 0) {
            MyFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyFirstCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 1) {
            MySecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySecondCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 2) {
            MyThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyThirdCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 3) {
            MyFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyFourthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 4) {
            MyFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyFifthCell" forIndexPath:indexPath];
            return cell;
        } else if (indexPath.row == 5) {
            MySixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySixthCell" forIndexPath:indexPath];
            return cell;
        } else {
            return nil;
        }
    }
    return nil;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return nil;
    }
    UIView *spacer = [[UIView alloc] init];
    spacer.backgroundColor = [UIColor systemGroupedBackgroundColor];
    return spacer;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return (section == 0) ? 0.01 : 12;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 180;
        }
    }
    if (indexPath.section == 1) {
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
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            MyPersonUpload* detailVC = [[MyPersonUpload alloc] init];
            [self.navigationController pushViewController:detailVC animated:YES];
        }
        if (indexPath.row == 1) {
            MyInformation* detailVC2 = [[MyInformation alloc] init];
            [self.navigationController pushViewController:detailVC2 animated:YES];
        }
        if (indexPath.row == 4) {
            MySet* detailVC3 = [[MySet alloc] init];
            [self.navigationController pushViewController:detailVC3 animated:YES];
        }
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
