//
//  VCHomePage.m
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "VCHomePage.h"
#import "MySecondCell.h"
#import "MyThirdCell.h"
#import "MyForthCell.h"
#import "MyFifthCell.h"
#import "MySixthCell.h"
@interface VCHomePage ()<UITableViewDelegate, UITableViewDataSource> {
    UITableView* tableview2;
}

@end

@implementation VCHomePage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.tableView registerClass:[MySecondCell class] forCellReuseIdentifier:@"MySecondCell"];
    [self.tableView registerClass:[MyThirdCell class] forCellReuseIdentifier:@"MyThirdCell"];
    [self.tableView registerClass:[MyForthCell class] forCellReuseIdentifier:@"MyForthCell"];
    [self.tableView registerClass:[MyFifthCell class] forCellReuseIdentifier:@"MyFifthCell"];
    [self.tableView registerClass:[MySixthCell class] forCellReuseIdentifier:@"MySixthCell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    CGFloat textFieldWidth = self.view.bounds.size.width - 120;
    CGFloat textFieldHeight = 36;
    CGFloat yPosition = 50;

    // 左侧图标
    UIImageView *classification = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"三条杠"]];
    classification.frame = CGRectMake(20, yPosition, 30, 30);
    classification.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:classification];

    // 搜索框
    UITextField* searchField = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetMaxX(classification.frame) + 10, yPosition, textFieldWidth, textFieldHeight)];
    searchField.placeholder = @"  搜索你喜欢的歌曲";
    searchField.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1.0];
    searchField.layer.cornerRadius = 18;
    searchField.layer.masksToBounds = YES;
    searchField.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:searchField];

    // 右侧麦克风
    UIImageView *mic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"麦克风"]];
    mic.frame = CGRectMake(CGRectGetMaxX(searchField.frame) + 10, yPosition, 30, 30);
    mic.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:mic];
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1; // 只有一个section
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;  // 只有1个 cell 展示轮播图
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        MySecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySecondCell" forIndexPath:indexPath];
        
        [cell setupScrollViewWithImages];  // 配置 scrollView 和图片
        
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        MyForthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyForthCell" forIndexPath:indexPath];
        return cell;
    }
    
    if (indexPath.section == 0 && indexPath.row == 2) {
        MyThirdCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyThirdCell" forIndexPath:indexPath];
        cell.songsData = @[
            @{@"cover": @"home1", @"song": @"Every Second", @"artist": @"Mina Okabe"},
            @{@"cover": @"home2", @"song": @"LAst DAy oN EaRTh", @"artist": @"Tai VerDes"},
            @{@"cover": @"home3", @"song": @"Always", @"artist": @"Daniel Caesar"},
            @{@"cover": @"home8", @"song": @"人间天堂", @"artist": @"王以太"}
        ];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        MyFifthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyFifthCell" forIndexPath:indexPath];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 4) {
        MySixthCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySixthCell"];
        cell.imageNames = @[@"rool0", @"rool1", @"rool2", @"rool3"];
        return cell;
    }
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 180;
        } else if (indexPath.row == 1) {
            return 30;
        } else if (indexPath.row == 2) {
            return 280;
        } else if (indexPath.row == 3) {
            return 30;
        } else if (indexPath.row == 4) {
            return 120;
        } else if (indexPath.row == 5) {
            return 200;
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
