//
//  VCClassification.m
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "VCClassification.h"
#import "MyAvatarCell.h"
#import "ProfileModel.h"
#import "MySecondCell.h"
#import "MySeventhCell.h"
@interface VCClassification ()<UITableViewDelegate, UITableViewDelegate, MyAvatarCellDelegate>

@end

@implementation VCClassification

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[MyAvatarCell class] forCellReuseIdentifier:@"MyAvatarCell"];
    [self.tableView registerClass:[MySecondCell class] forCellReuseIdentifier:@"MySecondCell"];
    [self.tableView registerClass:[MySeventhCell class] forCellReuseIdentifier:@"MySeventhCell"];
    [self.view addSubview:self.tableView];
    
    self.profileModel = [ProfileModel sharedInstance];
    self.profileModel.username = @"字架";
    self.profileModel.vipStatus = @"乙巳";
    self.profileModel.bio = @"永不退缩";
    self.profileModel.badgeDesc = @"♂ | 日常摸鱼中 | 黑胶收藏者";
    self.profileModel.stats = @[@"180\n关注", @"7\n粉丝", @"Lv.9\n等级", @"1830\n时长"];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                                selector:@selector(handleAvatarChanged:)
                                                    name:@"AvatarDidChangeNotification"
                                                  object:nil];
}
- (void) handleAvatarChanged: (NSNotification*) notification {
    ProfileModel* updatedProfile = notification.object;
    
    // 直接替换
    self.profileModel = updatedProfile;
    
    NSLog(@"分类页面收到头像变化：%@", self.profileModel.avatarName);
    
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleAvatarChanged:)
                                                 name:@"AvatarDidChangeNotification"
                                               object:nil];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        MyAvatarCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyAvatarCell"];
        [cell configureWithModel:self.profileModel];
        cell.delegate = self;
        
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        MySecondCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySecondCell" forIndexPath:indexPath];
        [cell setupScrollViewWithImages];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        MySeventhCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MySeventhCell" forIndexPath:indexPath];
        cell.songsData = @[
            @{
                @"cover": @"hom1",
                @"song": @"从前以后PT.1",
                @"artist": @"盛宇D-SHINE/KEY.L刘聪 - 叁壹",
                @"badges": @[@"超清母带"]
            },
            @{
                @"cover": @"hom2",
                @"song": @"勘ぐれい（灰心感）",
                @"artist": @"ずっと真夜中でいいのに。- 勘ぐ...",
                @"badges": @[@"VIP", @"超清母带"]
            },
            @{
                @"cover": @"hom3",
                @"song": @"50 Feet",
                @"artist": @"SoMo - 50 Feet",
                @"badges": @[@"VIP", @"超清母带"],
                @"special": @"E"
            },
            @{
                @"cover": @"home8",
                @"song": @"挂羊头卖狗肉",
                @"artist": @"王以太 - 演.说.家",
                @"badges": @[@"超清母带"]
            }
        ];
        return cell;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 250;
    } else if (indexPath.row == 1) {
        return 220;
    } else if (indexPath.row == 2) {
        return 280;
    } else if (indexPath.row == 3) {
        return 350;
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
