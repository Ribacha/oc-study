//
//  VCActivityPage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCActivityPage.h"
#import "ActivityFirstCell.h"
#import "ActivitThirdCell.h"
#import "ActivitSecondCell.h"
@interface VCActivityPage ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView* tableView;
@end

@implementation VCActivityPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[ActivityFirstCell class] forCellReuseIdentifier:@"ActivityFirstCell"];
    [self.tableView registerClass:[ActivitSecondCell class] forCellReuseIdentifier:@"ActivitSecondCell"];
    [self.tableView registerClass:[ActivitThirdCell class] forCellReuseIdentifier:@"ActivitThirdCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ActivityFirstCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ActivityFirstCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 1) {
        ActivitSecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ActivitSecondCell" forIndexPath:indexPath];
        return cell;
    } else if (indexPath.row == 2) {
        ActivitThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"ActivitThirdCell" forIndexPath:indexPath];
        return cell;
    } else {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 210;
        } else if (indexPath.row == 1) {
            return 210;
        } else if (indexPath.row == 2) {
            return 210;
        }
    }
    return 44;
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
