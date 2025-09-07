//
//  LoginViewController.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "UserManagerModel.h"
#import "RegisterViewController.h"
@interface LoginViewController ()
@property LoginView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登录";
    
    self.userManagerModel = [[UserManagerModel alloc] init];
    
    self.loginView = [[LoginView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.loginView];
    
    [self.loginView.loginButton addTarget:self action:@selector(handleLogin) forControlEvents:UIControlEventTouchUpInside];
    [self.loginView.goRegisterButton addTarget:self action:@selector(goRegister) forControlEvents:UIControlEventTouchUpInside];
}

- (void)handleLogin {
    BOOL success = [self.userManagerModel loginWithUsername:self.loginView.usernameField.text
                                               password:self.loginView.passwordField.text];
    [self showAlert:success ? @"登录成功" : @"用户名或密码错误"];
}

- (void)goRegister {
    RegisterViewController *registerVC = [[RegisterViewController alloc] init];
    registerVC.userManager = self.userManagerModel;
    [self.navigationController pushViewController:registerVC animated:YES];
}

- (void)showAlert:(NSString *)message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示"
                                                                   message:message
                                                            preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil]];
    [self presentViewController:alert animated:YES completion:nil];
}

@end
