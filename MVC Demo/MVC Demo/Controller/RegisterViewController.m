//
//  RegisterViewController.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "RegisterViewController.h"
#import "RegisterView.h"
#import "UserModel.h"

@interface RegisterViewController ()
@property RegisterView *registerView;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    
    self.registerView = [[RegisterView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.registerView];
    
    [self.registerView.registerButton addTarget:self action:@selector(handleRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleRegister {
    NSString *username = self.registerView.usernameField.text;
    NSString *password = self.registerView.passwordField.text;
    
    if (username.length == 0 || password.length == 0) {
        [self showAlert:@"用户名或密码不能为空"];
        return;
    }
    
    BOOL success = [self.userManager registerUser:[[UserModel alloc] initWithUsername:username password:password]];
    if (success) {
        [self showAlert:@"注册成功"];
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self showAlert:@"用户名已存在"];
    }
}

- (void)showAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}
@end
