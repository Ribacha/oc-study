//
//  PhotoWallViewController.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/15.
//

#import "PhotoWallViewController.h"
#import "MyAvatarCell.h"
#import "VCMyClass.h"
@interface PhotoWallViewController ()
@property (nonatomic, strong) NSMutableArray<NSString *> *selectedAvatars;
@property (nonatomic, strong) NSMutableArray<UIImageView *> *avatarImageViews;
@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:194/255.0 green:12/255.0 blue:12/255.0 alpha:1.0];
    self.selectedAvatars = [NSMutableArray array];
    self.avatarImageViews = [NSMutableArray array];

    NSArray* avatarNames = @[@"avatar1", @"avatar2", @"avatar3", @"avatar4", @"avatar5", @"avatar6", @"avatar7", @"avatar8"];
    CGFloat imageSize = 70;
    CGFloat margin = 24;
    CGFloat startX = margin;
    CGFloat startY = 100;
    int itemsPerRow = 4;

    for (int i = 0; i < avatarNames.count; i++) {
        int row = i / itemsPerRow;
        int col = i % itemsPerRow;

        CGFloat x = startX + col * (imageSize + margin);
        CGFloat y = startY + row * (imageSize + margin);
        UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:avatarNames[i]]];
        imageView.frame = CGRectMake(x, y, imageSize, imageSize);
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        imageView.layer.cornerRadius = imageSize / 2;
        imageView.layer.masksToBounds = YES;
        
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(avatarTapped:)];
        [imageView addGestureRecognizer:tap];
        [self.view addSubview:imageView];
        
        [self.avatarImageViews addObject:imageView];
    }

    UIButton *confirmButton = [UIButton buttonWithType:UIButtonTypeSystem];
    confirmButton.frame = CGRectMake(120, 500, 150, 40);
    confirmButton.backgroundColor = [UIColor colorWithRed:212/255.0 green:185/255.0 blue:150/255.0 alpha:1.0];
    confirmButton.layer.cornerRadius = 18;
    [confirmButton setTitle:@"确认选择" forState:UIControlStateNormal];
    [confirmButton addTarget:self action:@selector(confirmSelection) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:confirmButton];
}

- (void)avatarTapped:(UITapGestureRecognizer*)gesture {
    NSInteger index = gesture.view.tag;
    NSArray* avatarNames = @[@"avatar1", @"avatar2", @"avatar3", @"avatar4", @"avatar5", @"avatar6", @"avatar7", @"avatar8"];
    NSString* tappedAvatar = avatarNames[index];

    if ([self.selectedAvatars containsObject:tappedAvatar]) {
        [self.selectedAvatars removeObject:tappedAvatar];
    } else {
        [self.selectedAvatars addObject:tappedAvatar];
    }
    
    [self updateAvatarHighlights];
}

- (void)confirmSelection {
    if (self.selectedAvatars.count == 0) {
        [self showAlertWithTitle:@"提示" message:@"请至少选择一个头像"];
    } else if (self.selectedAvatars.count > 1) {
        // 超过一个就提示并重置
        [self showAlertWithTitle:@"提示" message:@"不能选择多个头像，已重置"];
        [self.selectedAvatars removeAllObjects];
        [self updateAvatarHighlights];
    } else {
        // 正确选了一个，确认更换
        NSString *selectedAvatar = self.selectedAvatars.firstObject;
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认更换"
                                                                       message:[NSString stringWithFormat:@"确认更换为 %@ 吗？", selectedAvatar]
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (self.avatarSelectedHandler) {
                self.avatarSelectedHandler(selectedAvatar);
            }
            [[NSNotificationCenter defaultCenter] postNotificationName:@"AvatarDidChangeNotification"
                                                                object:[ProfileModel sharedInstance]];
            [self.navigationController popViewControllerAnimated:YES];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        
        [alert addAction:okAction];
        [alert addAction:cancelAction];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}

- (void)updateAvatarHighlights {
    NSArray* avatarNames = @[@"avatar1", @"avatar2", @"avatar3", @"avatar4", @"avatar5", @"avatar6", @"avatar7", @"avatar8"];
    for (int i = 0; i < self.avatarImageViews.count; i++) {
        UIImageView *imgView = self.avatarImageViews[i];
        NSString *avatarName = avatarNames[i];
        if ([self.selectedAvatars containsObject:avatarName]) {
            imgView.layer.borderWidth = 2.0;
            imgView.layer.borderColor = UIColor.yellowColor.CGColor;
        } else {
            imgView.layer.borderWidth = 0;
        }
    }
}

- (void)showAlertWithTitle:(NSString*)title message:(NSString*)message {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* okAction = [UIAlertAction actionWithTitle:@"好的"
                                                       style:UIAlertActionStyleDefault
                                                     handler:nil];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
