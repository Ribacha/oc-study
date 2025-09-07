//
//  VCSearchPage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/21.
//

#import "VCSearchPage.h"
#import "VCDetail2.h"
#import "VCUpload.h"
@interface VCSearchPage ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField* textField;
@property (nonatomic, strong) UIScrollView* scrollView;
@end

@implementation VCSearchPage

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 402, 800)];
    self.scrollView.contentSize = CGSizeMake(394, 600);
    self.scrollView.scrollEnabled = NO;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    UITextField* textField = [[UITextField alloc] initWithFrame:CGRectMake(5, 0, 395, 40)];
    textField.placeholder = @"搜索 用户名 作品分类 文章";
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    [self.scrollView addSubview:textField];
    self.textField = textField;
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PressTap)];
    [self.view addGestureRecognizer:tapGesture];
    
    UIImage* iconImage = [UIImage imageNamed:@"上传"];
    UIBarButtonItem* iconButton = [[UIBarButtonItem alloc] initWithImage:iconImage style:UIBarButtonItemStylePlain target:self action:@selector(NextPage)];
    self.navigationItem.rightBarButtonItem = iconButton;
    
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(5, 70, 70, 30)];
    label.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    NSMutableAttributedString* attrStr = [[NSMutableAttributedString alloc] init];//富文本
    UIImage* symbolImage = [UIImage systemImageNamed:@"bookmark.fill"];
    NSTextAttachment* attachment = [[NSTextAttachment alloc] init];
    attachment.image = symbolImage;
    attachment.bounds = CGRectMake(10, -3, 16, 16);
    NSAttributedString* imageAttr = [NSAttributedString attributedStringWithAttachment:attachment];
    [attrStr appendLocalizedFormat:imageAttr];
    NSAttributedString* textAttr = [[NSAttributedString alloc] initWithString:@"分类" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [attrStr appendAttributedString:textAttr];
    label.attributedText = attrStr;
    [self.scrollView addSubview:label];
    
    UIImage* image1 = [UIImage imageNamed:@"home_line"];
    UIImageView* imageView1 = [[UIImageView alloc] initWithImage:image1];
    imageView1.frame = CGRectMake(75, 98, 320, 2);
    [self.scrollView addSubview:imageView1];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 200, 70, 30)];
    label2.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    NSMutableAttributedString* attrStr2 = [[NSMutableAttributedString alloc] init];//富文本
    UIImage* symbolImage2 = [UIImage systemImageNamed:@"bookmark.fill"];
    NSTextAttachment* attachment2 = [[NSTextAttachment alloc] init];
    attachment2.image = symbolImage2;
    attachment2.bounds = CGRectMake(10, -3, 16, 16);
    NSAttributedString* imageAttr2 = [NSAttributedString attributedStringWithAttachment:attachment];
    [attrStr2 appendLocalizedFormat:imageAttr2];
    NSAttributedString* textAttr2 = [[NSAttributedString alloc] initWithString:@"推荐" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [attrStr2 appendAttributedString:textAttr2];
    label2.attributedText = attrStr2;
    [self.scrollView addSubview:label2];
    
    UIImage* image2 = [UIImage imageNamed:@"home_line"];
    UIImageView* imageView2 = [[UIImageView alloc] initWithImage:image2];
    imageView2.frame = CGRectMake(75, 228, 320, 2);
    [self.scrollView addSubview:imageView2];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(5, 320, 70, 30)];
    label3.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    NSMutableAttributedString* attrStr3 = [[NSMutableAttributedString alloc] init];//富变文本
    UIImage* symbolImage3 = [UIImage systemImageNamed:@"bookmark.fill"];
    NSTextAttachment* attachment3 = [[NSTextAttachment alloc] init];
    attachment3.image = symbolImage3;
    attachment3.bounds = CGRectMake(10, -3, 16, 16);
    NSAttributedString* imageAttr3 = [NSAttributedString attributedStringWithAttachment:attachment3];
    [attrStr3 appendLocalizedFormat:imageAttr3];
    NSAttributedString* textAttr3 = [[NSAttributedString alloc] initWithString:@"时间" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    [attrStr3 appendAttributedString:textAttr3];
    label3.attributedText = attrStr3;
    [self.scrollView addSubview:label3];
    
    UIImage* image3 = [UIImage imageNamed:@"home_line"];
    UIImageView* imageView3 = [[UIImageView alloc] initWithImage:image3];
    imageView3.frame = CGRectMake(75, 348, 320, 2);
    [self.scrollView addSubview:imageView3];
    
    
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(5, 110, 80, 30);
    button.layer.cornerRadius = 1;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    button.layer.borderWidth = 0.8;
    button.backgroundColor = [UIColor whiteColor];
    [button setTitle:[NSString stringWithFormat:@"平面设计"] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button];
    
    UIButton* button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = CGRectMake(95, 110, 80, 30);
    button2.layer.cornerRadius = 1;
    button2.layer.borderColor = [UIColor grayColor].CGColor;
    button2.layer.borderWidth = 0.8;
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setTitle:[NSString stringWithFormat:@"网页设计"] forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button2];
    
    UIButton* button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = CGRectMake(185, 110, 80, 30);
    button3.layer.cornerRadius = 1;
    button3.layer.borderColor = [UIColor grayColor].CGColor;
    button3.layer.borderWidth = 0.8;
    button3.backgroundColor = [UIColor whiteColor];
    [button3 setTitle:[NSString stringWithFormat:@"UI/icon"] forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button3];
    
    UIButton* button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = CGRectMake(275, 110, 95, 30);
    button4.layer.cornerRadius = 1;
    button4.layer.borderColor = [UIColor grayColor].CGColor;
    button4.layer.borderWidth = 0.8;
    button4.backgroundColor = [UIColor whiteColor];
    [button4 setTitle:[NSString stringWithFormat:@"插画/手绘"] forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button4];
    
    UIButton* button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.frame = CGRectMake(5, 160, 120, 30);
    button5.layer.cornerRadius = 1;
    button5.layer.borderColor = [UIColor grayColor].CGColor;
    button5.layer.borderWidth = 0.8;
    button5.backgroundColor = [UIColor whiteColor];
    [button5 setTitle:[NSString stringWithFormat:@"虚拟与设计"] forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button5];
    
    UIButton* button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.frame = CGRectMake(135, 160, 80, 30);
    button6.layer.cornerRadius = 1;
    button6.layer.borderColor = [UIColor grayColor].CGColor;
    button6.layer.borderWidth = 0.8;
    button6.backgroundColor = [UIColor whiteColor];
    [button6 setTitle:[NSString stringWithFormat:@" 影视"] forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button6];
    
    UIButton* button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.frame = CGRectMake(225, 160, 80, 30);
    button7.layer.cornerRadius = 1;
    button7.layer.borderColor = [UIColor grayColor].CGColor;
    button7.layer.borderWidth = 0.8;
    button7.backgroundColor = [UIColor whiteColor];
    [button7 setTitle:[NSString stringWithFormat:@" 摄影"] forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button7];
    
    UIButton* button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.frame = CGRectMake(315, 160, 80, 30);
    button8.layer.cornerRadius = 1;
    button8.layer.borderColor = [UIColor grayColor].CGColor;
    button8.layer.borderWidth = 0.8;
    button8.backgroundColor = [UIColor whiteColor];
    [button8 setTitle:[NSString stringWithFormat:@" 其他"] forState:UIControlStateNormal];
    [button8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
    [self.scrollView addSubview:button8];
    
    NSArray* arr1 = @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"];
    for (int i = 0; i < 4; i++) {
        UIButton* button9 = [UIButton buttonWithType:UIButtonTypeCustom];
        button9.frame = CGRectMake(5 + i * 90, 260, 80, 30);
        button9.tag = 100 + i;
        button9.layer.cornerRadius = 1;
        button9.layer.borderColor = [UIColor grayColor].CGColor;
        button9.layer.borderWidth = 0.8;
        button9.backgroundColor = [UIColor whiteColor];
        [button9 setTitle:[NSString stringWithFormat:arr1[i]] forState:UIControlStateNormal];
        [button9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button9 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button9];
    }
    NSArray* arr2 = @[@"30分钟前", @"1小时前", @"1月前", @"1年前"];
    for (int i = 0; i < 4; i++) {
        UIButton* button0 = [UIButton buttonWithType:UIButtonTypeCustom];
        button0.frame = CGRectMake(5 + i * 90, 370, 80, 30);
        button0.tag = 100 + i;
        button0.layer.cornerRadius = 1;
        button0.layer.borderColor = [UIColor grayColor].CGColor;
        button0.layer.borderWidth = 0.8;
        button0.backgroundColor = [UIColor whiteColor];
        [button0 setTitle:[NSString stringWithFormat:arr2[i]] forState:UIControlStateNormal];
        [button0 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button0 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.scrollView addSubview:button0];
    }
    [self.view addSubview:self.scrollView];
}
- (void)PressTap {
    [self.view endEditing:YES];
}
- (void)buttonTapped:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    } else {
        sender.backgroundColor = [UIColor whiteColor];
    }
}
- (void) confirmButtonTapped: (UIButton*)sender {
    NSString* inputText = self.textField.text;
    if ([inputText isEqual:@"大白"]) {
        VCDetail2* detailVC = [[VCDetail2 alloc] init];
        detailVC.searchText = self.textField.text;
        [self.navigationController pushViewController:detailVC animated:YES];
    } else {
        
    }
}
- (void) NextPage {
    VCUpload* nextVC = [[VCUpload alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [self confirmButtonTapped:nil];
    return YES;
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
