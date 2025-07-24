//
//  PhotoWallViewController.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/23.
//

#import "PhotoWallViewController.h"

@interface PhotoWallViewController ()
@property (nonatomic, strong) NSMutableArray *selectedImages;
@property (nonatomic, strong) NSArray *imageNames;
@end

@implementation PhotoWallViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.selectedImages = [NSMutableArray array];
    
    self.imageNames = @[@"img1", @"img2", @"img3", @"img4", @"img5", @"img6", @"img7", @"img8", @"img9"];
    
    int numberOfColumns = 3;
    CGFloat padding = 24;
    CGFloat imageWidth = 100;
    CGFloat imageHeight = 100;
    
    for (int i = 0; i < self.imageNames.count; i++) {
        int row = i / numberOfColumns;
        int column = i % numberOfColumns;
        
        CGFloat x = padding + column * (imageWidth + padding);
        CGFloat y = padding + row * (imageHeight + padding);
        
        UIView *container = [[UIView alloc] initWithFrame:CGRectMake(x, y, imageWidth, imageHeight)];
        container.tag = 200 + i;
        container.backgroundColor = [UIColor clearColor];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:container.bounds];
        imageView.image = [UIImage imageNamed:self.imageNames[i]];
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
        imageView.tag = i;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped:)];
        [imageView addGestureRecognizer:tap];
        
        UIView *maskView = [[UIView alloc] initWithFrame:container.bounds];
        maskView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.4];
        maskView.userInteractionEnabled = NO;
        maskView.tag = 300 + i; // 用 tag 管理
        maskView.hidden = YES;
        
        [container addSubview:imageView];
        [container addSubview:maskView];
        [self.view addSubview:container];
    }
    UIBarButtonItem* iconButton = [[UIBarButtonItem alloc] initWithTitle:@"确认" style:UIBarButtonItemStylePlain target:self action:@selector(showAlertBeforeExit)];
    self.navigationItem.rightBarButtonItem = iconButton;
}

- (void)imageTapped:(UITapGestureRecognizer *)tap {
    UIImageView *imageView = (UIImageView *)tap.view;
    NSInteger index = imageView.tag;
    NSString *imageName = self.imageNames[index];
    
    UIView *maskView = [self.view viewWithTag:(300 + index)];
    if (![self.selectedImages containsObject:imageName]) {
        [self.selectedImages addObject:imageName];
        maskView.hidden = NO;
        NSLog(@" 添加 %@，当前选中：%@", imageName, self.selectedImages);
    } else {
        [self.selectedImages removeObject:imageName];
        maskView.hidden = YES;
        NSLog(@" 取消 %@，当前选中：%@", imageName, self.selectedImages);
    }
}
- (void)showAlertBeforeExit {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"确定要放弃继续编辑并返回吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        if (self.selectedImagesCallback) {
            self.selectedImagesCallback(self.selectedImages);
        }
    [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
