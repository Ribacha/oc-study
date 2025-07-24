//
//  VCRegister.m
//  KXShare
//
//  Created by 开开心心的macbook air on 2025/7/19.
//

#import "VCRegister.h"

@interface VCRegister ()
@property (nonatomic, strong) UITextField* textFieldKey;
@property (nonatomic, strong) UITextField* textFieldrepeatKey;
@property (nonatomic, strong) UITextField* textFieldUsername;
@property (nonatomic, strong) UIButton* ConfirmBtn;
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic) NSMutableDictionary* dict2;
@end

@implementation VCRegister

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}
- (void) setupSubviews {
    self.dict2 = [[NSMutableDictionary alloc] init];
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.scrollView.contentSize = CGSizeMake(394, 1252);
    self.scrollView.scrollEnabled = NO;
    UIImageView* logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(144, 110, 110, 110)];
    logoImage.image = [UIImage imageNamed:@"logo"];
    logoImage.contentMode = UIViewContentModeScaleAspectFit;
    UILabel* logoLabel = [[UILabel alloc]initWithFrame:CGRectMake(133, 225, 250, 50)];
    logoLabel.textColor = [UIColor whiteColor];
    logoLabel.text = @"SHARE";
    logoLabel.font = [UIFont systemFontOfSize:42];
    self.view.backgroundColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
    
    self.textFieldUsername = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 40)];
    self.textFieldUsername.delegate = self;
    self.textFieldUsername.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldUsername.placeholder = @"请输入用户名";
    
    self.textFieldKey = [[UITextField alloc] initWithFrame:CGRectMake(50, 350, self.view.frame.size.width - 100, 40)];
    self.textFieldKey.delegate = self;
    self.textFieldKey.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldKey.placeholder = @"请输入密码";
    
    self.textFieldrepeatKey = [[UITextField alloc] initWithFrame:CGRectMake(50, 400, self.view.frame.size.width - 100, 40)];
    self.textFieldrepeatKey.delegate = self;
    self.textFieldrepeatKey.borderStyle = UITextBorderStyleRoundedRect;
    self.textFieldrepeatKey.placeholder = @"请再次输入密码";
    
    self.ConfirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.ConfirmBtn.frame = CGRectMake(100, 470, self.view.frame.size.width - 200, 40);
    [self.ConfirmBtn setTitle:@"注册" forState:UIControlStateNormal];
    self.ConfirmBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    self.ConfirmBtn.layer.borderWidth = 1.0f;
    self.ConfirmBtn.tintColor = [UIColor whiteColor];
    [self.ConfirmBtn addTarget:self action:@selector(PressConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PressTap)];
    [self.scrollView addSubview:self.textFieldKey];
    [self.scrollView addSubview:self.textFieldrepeatKey];
    [self.scrollView addSubview:self.textFieldUsername];
    [self.scrollView addSubview:self.ConfirmBtn];
    [self.scrollView addSubview:logoImage];
    [self.scrollView addSubview:logoLabel];
    [self.view addSubview:self.scrollView];
    [self.view addGestureRecognizer:tap];
}
- (void) PressTap {
    [self.textFieldKey resignFirstResponder];
    [self.textFieldrepeatKey resignFirstResponder];
    [self.textFieldUsername resignFirstResponder];
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:true];
}
- (void) PressConfirm {
    if (self.textFieldKey.text.length > 10 || self.textFieldUsername.text.length > 10) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账号和密码不能超过十位" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
//        else if ([self.textFieldKey.text isEqual:@" "] || [self.textFieldrepeatKey.text isEqual:@" "] || [self.textFieldUsername.text isEqual:@" "]) {
//        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"账号和密码不能为空" preferredStyle:UIAlertControllerStyleAlert];
//        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
//        [alert addAction:confirm];
//        [self presentViewController:alert animated:YES completion:nil];
//    }
        else if (![self.textFieldKey.text isEqual:self.textFieldrepeatKey.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"两次密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (![self isPasswordValid:self.textFieldKey.text] || ![self isPasswordValid:self.textFieldKey.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"请使用英文和数字" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        NSString* strName = self.textFieldUsername.text;
        NSString* strKey = self.textFieldKey.text;
        NSDictionary* dict = [NSDictionary dictionaryWithObject:strKey forKey:strName];
        [self.dict2 addEntriesFromDictionary:dict];
        [self.delegate stringMode:self.dict2];
    }
}
- (BOOL)isPasswordValid: (NSString*)password {
    NSString* regex = @"^[A-Za-z0-9]+$";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:password];
}
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, 100) animated:true];
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
