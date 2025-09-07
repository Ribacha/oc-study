//
//  RegisterView.m
//  MVC Demo
//
//  Created by 开开心心的macbook air on 2025/9/6.
//

#import "RegisterView.h"

@implementation RegisterView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        
        _usernameField = [[UITextField alloc] initWithFrame:CGRectMake(80, 150, 250, 40)];
        _usernameField.placeholder = @"用户名";
        _usernameField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_usernameField];
        
        _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(80, 200, 250, 40)];
        _passwordField.placeholder = @"密码";
//        _passwordField.secureTextEntry = YES;
        _passwordField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_passwordField];
        
        _registerButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _registerButton.frame = CGRectMake(80, 260, 250, 40);
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [self addSubview:_registerButton];
    }
    return self;
}
@end
