//
//  VCMyClass.m
//  CloudMusic
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "VCMyClass.h"
#import "MySecondCell.h"
#import "MyThirdCell.h"
#import "MyAvatarCell.h"
#import "ProfileModel.h"
#import "MyTollCell.h"
#import "PhotoWallViewController.h"
#import "VCMyCloud.h"
#import "MyDarkModeCell.h"
#import "MyLabelCell.h"
#define DarkModeKey @"DarkModePreference"
@interface VCMyClass ()<UITableViewDelegate, UITableViewDataSource, MyAvatarCellDelegate>

@end

@implementation VCMyClass

- (void)viewDidLoad {
//    UIImageView *bgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"backgroun"]];
//    bgView.contentMode = UIViewContentModeScaleAspectFill;
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerClass:[MyAvatarCell class] forCellReuseIdentifier:@"MyAvatarCell"];
    [self.tableView registerClass:[MyTollCell class] forCellReuseIdentifier:@"MyTollCell"];
    [self.tableView registerClass:[MyDarkModeCell class] forCellReuseIdentifier:@"MyDarkModeCell"];
    [self.tableView registerClass:[MyLabelCell class] forCellReuseIdentifier:@"MyLabelCell"];
    
    [self.view addSubview:self.tableView];
//    self.tableView.backgroundView = bgView;
    
    self.profileModel = [ProfileModel sharedInstance];
    self.profileModel = [[ProfileModel alloc] init];
    self.profileModel.avatarName = @"avatar";
    self.profileModel.username = @"字架";
    self.profileModel.vipStatus = @"乙巳";
    self.profileModel.bio = @"永不退缩";
    self.profileModel.badgeDesc = @"♂ | 日常摸鱼中 | 黑胶收藏者";
    self.profileModel.stats = @[@"180\n关注", @"7\n粉丝", @"Lv.9\n等级", @"1830\n时长"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"云朵-copy"]
                                                                       style:UIBarButtonItemStyleDone
                                                                      target:self
                                                                      action:@selector(NextVC)];
        self.navigationItem.leftBarButtonItem = leftButton;
    BOOL isDark = [[NSUserDefaults standardUserDefaults] boolForKey:DarkModeKey];
    [self applyInterfaceStyle:isDark];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row == 0) {
        MyAvatarCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyAvatarCell"];
        [cell configureWithModel:self.profileModel];
        cell.delegate = self;
        
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 1) {
        MyTollCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyTollCell"];
        [cell setupScrollViewWithImages];
        return cell;
    }
    if (indexPath.section == 0 && indexPath.row == 2) {
        MyDarkModeCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyDarkModeCell"];
        BOOL isDark = [[NSUserDefaults standardUserDefaults] boolForKey:DarkModeKey];
        [cell configureSwitchState: isDark];
        
        __weak typeof(self) weakSelf = self;
        cell.modeSwitchChangedHandler = ^(BOOL isOn) {
            [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:DarkModeKey];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
            [weakSelf applyInterfaceStyle: isOn];
        };
        return cell;
        
    }
    if (indexPath.section == 0 && indexPath.row == 3) {
        MyLabelCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyLabelCell"];
        cell.labelData = @[
            @{@"cover":@"贝壳", @"label":@"云贝"},
            @{@"cover":@"商城", @"label":@"云有商城"},
            @{@"cover":@"时间", @"label":@"最近播放"},
            @{@"cover":@"发票", @"label":@"云村有票"},
            @{@"cover":@"邮件", @"label":@"邮件"}
        ];
        return cell;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 250;
    } else if (indexPath.row == 1) {
        return 80;
    } else if (indexPath.row == 2) {
        return 70;
    } else if (indexPath.row == 3) {
        return 350;
    } else {
        return 44;
    }
}

- (void)avatarCellDidTapAvatar:(MyAvatarCell *)cell {
    NSLog(@"跳转到照片墙");
    PhotoWallViewController* photoWallVC = [[PhotoWallViewController alloc] init];
    photoWallVC.avatarSelectedHandler = ^(NSString * selectedAvatarName) {
        NSLog(@"选中了 %@", selectedAvatarName);
        self.profileModel.avatarName = selectedAvatarName;
        [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:0 inSection:0]] withRowAnimation:UITableViewRowAnimationNone];

        // 发通知
        [[NSNotificationCenter defaultCenter] postNotificationName:@"AvatarDidChangeNotification"
                                                            object:self.profileModel];
    };
    [self.navigationController pushViewController:photoWallVC animated:YES];
}
- (void)NextVC {
    VCMyCloud *modelVC = [[VCMyCloud alloc] init];
    modelVC.modalPresentationStyle = UIModalPresentationPageSheet;

    BOOL isDark = [[NSUserDefaults standardUserDefaults] boolForKey:DarkModeKey];
    modelVC.isDarkMode = isDark;  // 在 push/present 之前赋值

    [self.navigationController pushViewController:modelVC animated:YES];
}
- (void)applyInterfaceStyle:(BOOL)isDark {
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = isDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
        UIApplication.sharedApplication.keyWindow.overrideUserInterfaceStyle = isDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
    }
}
- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO; // 禁止高亮
}
@end
