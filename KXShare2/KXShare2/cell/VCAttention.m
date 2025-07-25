//
//  VCAttention.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCAttention.h"
#import "AttentionFirstCell.h"
#import "AttentionSecondCell.h"
#import "AttentionThirdCell.h"
#import "AttentionFourthCell.h"
#import "AttentionFifthCell.h"
#import "AttentionSixthCell.h"
@interface VCAttention ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation VCAttention

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerClass:[AttentionFirstCell class] forCellReuseIdentifier:@"AttentionFirstCell"];
    [self.tableView registerClass:[AttentionSecondCell class] forCellReuseIdentifier:@"AttentionSecondCell"];
    [self.tableView registerClass:[AttentionThirdCell class] forCellReuseIdentifier:@"AttentionThirdCell"];
    [self.tableView registerClass:[AttentionFourthCell class] forCellReuseIdentifier:@"AttentionFourthCell"];
    [self.tableView registerClass:[AttentionFifthCell class] forCellReuseIdentifier:@"AttentionFifthCell"];
    [self.tableView registerClass:[AttentionSixthCell class] forCellReuseIdentifier:@"AttentionSixthCell"];
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
        AttentionFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionFirstCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 1) {
        AttentionSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionSecondCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 2) {
        AttentionThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionThirdCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 3) {
        AttentionFourthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionFourthCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 4) {
        AttentionFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionFifthCell" forIndexPath:indexPath];
        [cell configureWithIndex:indexPath.row];
        return cell;
    }
    if (indexPath.row == 5) {
        AttentionSixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"AttentionSixthCell" forIndexPath:indexPath];
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
    } else if (indexPath.row == 5) {
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
