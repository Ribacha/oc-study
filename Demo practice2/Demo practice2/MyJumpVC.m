//
//  MyJumpVC.m
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import "MyJumpVC.h"
#import "MyJumpCell.h"
#import "MyJumpCell2.h"
@interface MyJumpVC ()

@end
static NSString* str1 = @"jump1";
static NSString* str2 = @"jump2";
@implementation MyJumpVC
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerClass:[MyJumpCell class] forCellReuseIdentifier:str1];
    [_tableView registerClass:[MyJumpCell2 class] forCellReuseIdentifier:str2];
    [self.view addSubview:_tableView];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 80;
    } else {
        return 50;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MyJumpCell* cell = [self.tableView dequeueReusableCellWithIdentifier:str1 forIndexPath:indexPath];
        return cell;
    } else {
        MyJumpCell2* cell = [self.tableView dequeueReusableCellWithIdentifier:str2 forIndexPath:indexPath];
        return cell;
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
