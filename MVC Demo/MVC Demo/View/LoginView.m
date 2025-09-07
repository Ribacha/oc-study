//
//  LoginView.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "LoginView.h"

@implementation LoginView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _usernameField = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 250, 40)];
        _usernameField.placeholder = @"用户名";
        _usernameField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_usernameField];
        
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(80, 200, 250, 40)];
        _passwordField.placeholder = @"密码";
        _passwordField.secureTextEntry = YES;
        _passwordField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_passwordField];
        
        _loginButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _loginButton.frame = CGRectMake(80, 260, 100, 40);
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [self addSubview:_loginButton];
        
        _goRegisterButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _goRegisterButton.frame = CGRectMake(230, 260, 100, 40);
        [_goRegisterButton setTitle:@"注册" forState:UIControlStateNormal];
        [self addSubview:_goRegisterButton];
    }
    return self;
}
@end
