//
//  VCUpload.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/23.
//

#import "VCUpload.h"
#import "PhotoWallViewController.h"
@interface VCUpload ()<UITableViewDelegate, UITableViewDataSource, UITextViewDelegate>
@property (nonatomic, strong) UIImageView* imageView;
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) NSArray* dataSource;
@property (nonatomic, assign) BOOL isExpanded;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) UIButton *toggleButton;
@property (nonatomic, strong) UITextView* textView1;
@property (nonatomic, strong) UILabel* placeholderLabel;
@property (nonatomic, strong) UITextView* textView2;
@property (nonatomic, strong) UILabel* placeholderLabel2;
@property (nonatomic, strong) UIButton* AutoRegisterBtn;
@property (nonatomic, strong) UILabel* AutoRegisterLabel;
@property (nonatomic, assign) NSInteger selectedImageCount;
@property (nonatomic, strong) UILabel *imageCountLabel;
@property (nonatomic, strong) UILabel *badgeLabel;
@end

@implementation VCUpload

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithWhite:0.98 alpha:1.0];
    self.imageView = [[UIImageView alloc] init];
    self.imageView.image = [UIImage imageNamed:@"imageno"];
    self.imageView.frame = CGRectMake(10, 110, 200, 100);
    self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    self.imageView.clipsToBounds = YES;
    self.imageView.userInteractionEnabled = YES;
    [self.view addSubview:self.imageView];
    UITapGestureRecognizer* tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imageTapped)];
    [self.imageView addGestureRecognizer:tapGesture];
    
    self.dataSource = @[@" 原创作品", @" 设计资料", @" 设计师观点", @" 设计教程"];
    self.isExpanded = NO;
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(250, 170, 110, 30) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.layer.borderColor = [UIColor grayColor].CGColor;
    self.tableView.layer.borderWidth = 0.4;
//    self.tableView.layer.cornerRadius = 15;
//    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.selectedIndex = 0;
    self.toggleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.toggleButton.frame = CGRectMake(360, 175, 20, 20);
    [self.toggleButton setImage:[UIImage imageNamed:@"左箭头"] forState:UIControlStateNormal];
    [self.toggleButton addTarget:self action:@selector(toggleTableView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.toggleButton];
    
    self.badgeLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame) - 15, self.imageView.frame.origin.y - 5, 20, 20)];
    self.badgeLabel.backgroundColor = [UIColor redColor];
    self.badgeLabel.textColor = [UIColor whiteColor];
    self.badgeLabel.font = [UIFont boldSystemFontOfSize:12];
    self.badgeLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeLabel.layer.cornerRadius = 10;
    self.badgeLabel.layer.masksToBounds = YES;
    self.badgeLabel.hidden = YES;
    [self.view addSubview:self.badgeLabel];
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 230, 80, 30);
    button.layer.cornerRadius = 1;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.8;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:[NSString stringWithFormat:@"平面设计"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(95, 230, 80, 30);
    button2.layer.cornerRadius = 1;
    button2.layer.borderColor = [UIColor grayColor].CGColor;
    button2.layer.borderWidth = 0.8;
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setTitle:[NSString stringWithFormat:@"网页设计"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton* button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(185, 230, 80, 30);
    button3.layer.cornerRadius = 1;
    button3.layer.borderColor = [UIColor grayColor].CGColor;
    button3.layer.borderWidth = 0.8;
    button3.backgroundColor = [UIColor whiteColor];
    [button3 setTitle:[NSString stringWithFormat:@"UI/icon"] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton* button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(275, 230, 95, 30);
    button4.layer.cornerRadius = 1;
    button4.layer.borderColor = [UIColor grayColor].CGColor;
    button4.layer.borderWidth = 0.8;
    button4.backgroundColor = [UIColor whiteColor];
    [button4 setTitle:[NSString stringWithFormat:@"插画/手绘"] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton* button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(5, 280, 120, 30);
    button5.layer.cornerRadius = 1;
    button5.layer.borderColor = [UIColor grayColor].CGColor;
    button5.layer.borderWidth = 0.8;
    button5.backgroundColor = [UIColor whiteColor];
    [button5 setTitle:[NSString stringWithFormat:@"虚拟与设计"] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIButton* button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(135, 280, 80, 30);
    button6.layer.cornerRadius = 1;
    button6.layer.borderColor = [UIColor grayColor].CGColor;
    button6.layer.borderWidth = 0.8;
    button6.backgroundColor = [UIColor whiteColor];
    [button6 setTitle:[NSString stringWithFormat:@" 影视"] forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton* button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(225, 280, 80, 30);
    button7.layer.cornerRadius = 1;
    button7.layer.borderColor = [UIColor grayColor].CGColor;
    button7.layer.borderWidth = 0.8;
    button7.backgroundColor = [UIColor whiteColor];
    [button7 setTitle:[NSString stringWithFormat:@" 摄影"] forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    UIButton* button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(315, 280, 80, 30);
    button8.layer.cornerRadius = 1;
    button8.layer.borderColor = [UIColor grayColor].CGColor;
    button8.layer.borderWidth = 0.8;
    button8.backgroundColor = [UIColor whiteColor];
    [button8 setTitle:[NSString stringWithFormat:@" 其他"] forState:UIControlStateNormal];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    [self.view addSubview:self.tableView];
    
    self.textView1 = [[UITextView alloc] initWithFrame:CGRectMake(0, 340, 395, 30)];
    self.textView1.backgroundColor = [UIColor whiteColor];
    self.textView1.textColor = [UIColor blackColor];
    self.textView1.font = [UIFont systemFontOfSize:14];
    self.textView1.delegate = self;
    [self.view addSubview:self.textView1];
    
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, 290, 30)];
    self.placeholderLabel.text = @"作品名称";
    self.placeholderLabel.textColor = [UIColor grayColor];
    self.placeholderLabel.font = self.textView1.font;
    [self.textView1 addSubview:self.placeholderLabel];
    
    self.textView2 = [[UITextView alloc] initWithFrame:CGRectMake(0, 400, 395, 120)];
    self.textView2.backgroundColor = [UIColor whiteColor];
    self.textView2.textColor = [UIColor blackColor];
    self.textView2.font = [UIFont systemFontOfSize:14];
    self.textView2.delegate = self;
    [self.view addSubview:self.textView2];
    
    self.placeholderLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(8, 0, 290, 30)];
    self.placeholderLabel2.text = @"请添加作品说明/文章内容……";
    self.placeholderLabel2.textColor = [UIColor grayColor];
    self.placeholderLabel2.font = self.textView1.font;
    [self.textView2 addSubview:self.placeholderLabel2];
    
    UIButton* buttonload = [UIButton buttonWithType:UIButtonTypeCustom];
    buttonload.frame = CGRectMake(3, 540, 395, 50);
    buttonload.layer.cornerRadius = 1;
    buttonload.layer.borderColor = [UIColor grayColor].CGColor;
    buttonload.layer.borderWidth = 0.8;
    buttonload.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    [buttonload setTitle:[NSString stringWithFormat:@"发布"] forState:UIControlStateNormal];
    [buttonload setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [buttonload addTarget:self action:@selector(showAlertBeforeExit) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonload];

    self.AutoRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.AutoRegisterBtn setImage:[UIImage imageNamed:@"方框1"] forState:UIControlStateNormal];
    [self.AutoRegisterBtn addTarget:self action:@selector(PressSelect) forControlEvents:UIControlEventTouchUpInside];
    [self.AutoRegisterBtn setImage:[UIImage imageNamed:@"方框2"] forState:UIControlStateSelected];
    self.AutoRegisterBtn.frame = CGRectMake(7, 600, 20, 20);
    self.AutoRegisterLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 600, 80, 20)];
    self.AutoRegisterLabel.text = @"禁止下载";
    [self.view addSubview:self.AutoRegisterBtn];
    [self.view addSubview:self.AutoRegisterLabel];
    
    UIImageView* imageViewx = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"地点"]];
    imageViewx.frame = CGRectMake(250, 137.5, 20, 20);
    [self.view addSubview:imageViewx];
    
    UIButton* button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    button10.frame = CGRectMake(270, 135, 80, 25);
    button10.layer.cornerRadius = 13;
    button10.layer.borderWidth = 0.8;
    button10.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    [button10 setTitle:[NSString stringWithFormat:@"陕西省，西安市"] forState:UIControlStateNormal];
    [button10 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button10.titleLabel.font = [UIFont systemFontOfSize:10];
    [self.view addSubview:button10];

}
- (void)imageTapped {
    PhotoWallViewController *photoWallVC = [[PhotoWallViewController alloc] init];
    photoWallVC.selectedImagesCallback = ^(NSArray* selectedImages) {
        self.imageView.image = [UIImage imageNamed:selectedImages.firstObject];
        self.selectedImageCount = selectedImages.count;
        if (self.selectedImageCount > 0) {
            self.badgeLabel.hidden = NO;
            self.badgeLabel.text = [NSString stringWithFormat:@"%ld", (long)self.selectedImageCount];
        } else {
            self.badgeLabel.hidden = YES;
        }    };
    [self.navigationController pushViewController:photoWallVC animated:YES];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.isExpanded ? self.dataSource.count + 1 : 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellID = @"cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    if (indexPath.row == 0) {
            cell.textLabel.text = self.dataSource[self.selectedIndex];
            cell.textLabel.textColor = [UIColor blackColor];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        } else {
            cell.textLabel.text = self.dataSource[indexPath.row - 1];
            cell.textLabel.textColor = [UIColor blackColor];
            cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        }
        cell.textLabel.font = [UIFont systemFontOfSize:13];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        [self toggleTableView];
    } else {
        self.selectedIndex = indexPath.row - 1;
        [self toggleTableView];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)toggleTableView {
    self.isExpanded = !self.isExpanded;
    NSString *imageName = self.isExpanded ? @"下箭头" : @"左箭头";
    [self.toggleButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    CGRect frame = self.tableView.frame;
    if (self.isExpanded) {
        frame.size.height = 30 * (self.dataSource.count + 1); // 5行高度
    } else {
        frame.size.height = 30;
    }
    self.tableView.frame = frame;
    
    [self.tableView reloadData];
}
- (void)buttonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    } else {
        sender.backgroundColor = [UIColor whiteColor];
    }
}
- (void)textViewDidChange:(UITextView *)textView {
    if (textView == self.textView1) {
        self.placeholderLabel.hidden = textView.text.length > 0;
    } else if (textView == self.textView2) {
        self.placeholderLabel2.hidden = textView.text.length > 0;
    }
}
- (void)showAlertBeforeExit {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"message:@"确定要放弃编辑并返回吗？" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    [self.navigationController popViewControllerAnimated:YES];
    }];
    [alert addAction:cancelAction];
    [alert addAction:confirmAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (void) PressSelect {
    if (self.AutoRegisterBtn.selected == NO) {
        self.AutoRegisterBtn.selected = YES;
    } else {
        self.AutoRegisterBtn.selected = NO;
    }
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES; // 隐藏底部 TabBar
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO; // 离开页面时恢复显示 TabBar
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
