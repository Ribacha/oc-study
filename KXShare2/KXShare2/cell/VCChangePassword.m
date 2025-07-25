//
//  VCChangePassword.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "VCChangePassword.h"

@interface VCChangePassword ()<UITextFieldDelegate>
@property (nonatomic, strong) UITextField* textOldkey;
@property (nonatomic, strong) UITextField* textNewkey;
@property (nonatomic, strong) UITextField* textRepeatkey;
@property (nonatomic, strong) UIButton* ConfirmBtn;
@end

@implementation VCChangePassword

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupSubviews];
}
- (void) setupSubviews {
    self.textOldkey = [[UITextField alloc] initWithFrame:CGRectMake(50, 150, self.view.frame.size.width - 100, 40)];
    self.textOldkey.delegate = self;
    self.textOldkey.borderStyle = UITextBorderStyleRoundedRect;
    self.textOldkey.placeholder = @"请输入旧密码";
    
    self.textNewkey = [[UITextField alloc] initWithFrame:CGRectMake(50, 200, self.view.frame.size.width - 100, 40)];
    self.textNewkey.delegate = self;
    self.textNewkey.borderStyle = UITextBorderStyleRoundedRect;
    self.textNewkey.placeholder = @"请输入新密码";
    
    self.textRepeatkey= [[UITextField alloc] initWithFrame:CGRectMake(50, 250, self.view.frame.size.width - 100, 40)];
    self.textRepeatkey.delegate = self;
    self.textRepeatkey.borderStyle = UITextBorderStyleRoundedRect;
    self.textRepeatkey.placeholder = @"请再一次输入新密码";
    
    self.ConfirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.ConfirmBtn.frame = CGRectMake(100, 470, self.view.frame.size.width - 200, 40);
    [self.ConfirmBtn setTitle:@"确认" forState:UIControlStateNormal];
    self.ConfirmBtn.layer.borderColor = [UIColor blackColor].CGColor;
    self.ConfirmBtn.layer.borderWidth = 1.0f;
    self.ConfirmBtn.tintColor = [UIColor blackColor];
    [self.ConfirmBtn addTarget:self action:@selector(PressConfirm) forControlEvents:UIControlEventTouchUpInside];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PressTap)];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addGestureRecognizer:tap];
    [self.view addSubview:self.textNewkey];
    [self.view addSubview:self.textOldkey];
    [self.view addSubview:self.textRepeatkey];
    [self.view addSubview:self.ConfirmBtn];
}
- (void) PressConfirm {
    if (![self.textNewkey.text isEqual:self.textRepeatkey.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"两次密码不一致" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else if (![self isPasswordValid:self.textNewkey.text] || ![self isPasswordValid:self.textNewkey.text]) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册失败" message:@"请使用英文和数字" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"注册成功" message:@"点击确认返回" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction* _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (BOOL)isPasswordValid: (NSString*)password {
    NSString* regex = @"^[A-Za-z0-9]+$";
    NSPredicate* predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:password];
}
- (void) PressTap {
    [self.textOldkey resignFirstResponder];
    [self.textNewkey resignFirstResponder];
    [self.textRepeatkey resignFirstResponder];
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
