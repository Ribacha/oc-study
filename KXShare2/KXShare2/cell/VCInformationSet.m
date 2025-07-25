//
//  VCInformationSet.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCInformationSet.h"
#import "InformationSetFifthCell.h"
#import "InformationSetSecondCell.h"
#import "InformationSetThirdCell.h"
#import "InformationSetFirstCell.h"
#import "InformationSetFourthCell.h"
@interface VCInformationSet ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation VCInformationSet

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[InformationSetFirstCell class] forCellReuseIdentifier:@"InformationSetFirstCell"];
    [self.tableView registerClass:[InformationSetSecondCell class] forCellReuseIdentifier:@"InformationSetSecondCell"];
    [self.tableView registerClass:[InformationSetThirdCell class] forCellReuseIdentifier:@"InformationSetThirdCell"];
    [self.tableView registerClass:[InformationSetFifthCell class] forCellReuseIdentifier:@"InformationSetFifthCell"];
    [self.tableView registerClass:[InformationSetFourthCell class] forCellReuseIdentifier:@"InformationSetFourthCell"];
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
        InformationSetFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetFirstCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 1) {
        InformationSetSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetSecondCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 2) {
        InformationSetThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetThirdCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 3) {
        InformationSetFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetFourthCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 4) {
        InformationSetFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"InformationSetFifthCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 60;
    } else if (indexPath.row == 1) {
        return 60;
    } else if (indexPath.row == 2) {
        return 60;
    } else if (indexPath.row == 3) {
        return 60;
    } else if (indexPath.row == 4) {
        return 60;
    } else {
        return 44;
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
