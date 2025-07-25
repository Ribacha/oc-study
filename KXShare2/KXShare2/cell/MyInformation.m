//
//  MyInformation.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "MyInformation.h"
#import "InformationFirstCell.h"
#import "InformationFifthCell.h"
#import "InformationForthCell.h"
#import "InformationThirdCell.h"
#import "InformationSecondCell.h"
#import "InformationSixthCell.h"
#import "VCAttention.h"
@interface MyInformation ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation MyInformation

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[InformationFirstCell class] forCellReuseIdentifier:@"InformationFirstCell"];
    [self.tableView registerClass:[InformationSecondCell class] forCellReuseIdentifier:@"InformationSecondCell"];
    [self.tableView registerClass:[InformationThirdCell class] forCellReuseIdentifier:@"InformationThirdCell"];
    [self.tableView registerClass:[InformationForthCell class] forCellReuseIdentifier:@"InformationForthCell"];
    [self.tableView registerClass:[InformationFifthCell class] forCellReuseIdentifier:@"InformationFifthCell"];
    [self.tableView registerClass:[InformationSixthCell class] forCellReuseIdentifier:@"InformationSixthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 6;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        InformationFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationFirstCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 1) {
        InformationSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSecondCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 2) {
        InformationThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationThirdCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 3) {
        InformationForthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationForthCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 4) {
        InformationFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationFifthCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.row == 5) {
        InformationSixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSixthCell" forIndexPath:indexPath];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    return 66;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 2) {
        VCAttention* detailVC = [[VCAttention alloc] init];
        [self.navigationController pushViewController:detailVC animated:YES];
    }
//    if (indexPath.row == 3) {
//        
//    }
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
