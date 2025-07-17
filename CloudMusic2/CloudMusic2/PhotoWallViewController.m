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

@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSArray* avatarNames = @[@"avatar1", @"avatar2", @"avatar3", @"avatar4", @"avatar5", @"avatar6", @"avatar7", @"avatar8"];
    CGFloat imageSize = 70;
    CGFloat margin = 24;
    CGFloat startX = margin;
    CGFloat startY = 100;
    int itemsPerRow = 4;
    for (int i = 0; i < avatarNames.count; i++) {
        int row = i / itemsPerRow;    // 当前是第几行
        int col = i % itemsPerRow;    // 当前行的第几个

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
        
    }
    
}
- (void)avatarTapped:(UITapGestureRecognizer*) gesture {
    NSInteger index = gesture.view.tag;
    NSArray* avatarNames = @[@"avatar1", @"avatar2", @"avatar3", @"avatar4", @"avatar5", @"avatar6", @"avatar7", @"avatar8"];
    NSString* selectedAvatar = avatarNames[index];
    if (self.avatarSelectedHandler) {
        self.avatarSelectedHandler(selectedAvatar);
    }
    [self.navigationController popViewControllerAnimated:YES];
}


@end
