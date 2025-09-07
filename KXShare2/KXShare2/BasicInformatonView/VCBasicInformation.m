//
//  VCBasicInformation.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCBasicInformation.h"
#import "BasicInformationFirstCell.h"
#import "BasicInformationSecondCell.h"
#import "BasicInformationThirdCell.h"
#import "BasicInformationFourthCell.h"
#import "BasicInformationFifthCell.h"
@interface VCBasicInformation ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation VCBasicInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[BasicInformationFirstCell class] forCellReuseIdentifier:@"BasicInformationFirstCell"];
    [self.tableView registerClass:[BasicInformationSecondCell class] forCellReuseIdentifier:@"BasicInformationSecondCell"];
    [self.tableView registerClass:[BasicInformationThirdCell class] forCellReuseIdentifier:@"BasicInformationThirdCell"];
    [self.tableView registerClass:[BasicInformationFourthCell class] forCellReuseIdentifier:@"BasicInformationFourthCell"];
    [self.tableView registerClass:[BasicInformationFifthCell class] forCellReuseIdentifier:@"BasicInformationFifthCell"];
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
        BasicInformationFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BasicInformationFirstCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 1) {
        BasicInformationSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BasicInformationSecondCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 2) {
        BasicInformationThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BasicInformationThirdCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 3) {
        BasicInformationFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BasicInformationFourthCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 4) {
        BasicInformationFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"BasicInformationFifthCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 120;
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
