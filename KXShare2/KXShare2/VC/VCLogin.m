//
//  VCLogin.m
//  KXShare
//
//  Created by 开开心心的macbook air on 2025/7/19.
//

#import "VCLogin.h"
#import "VCRegister.h"
#import "VCSearchPage.h"
#import "VCMyPage.h"
#import "VCArticlePage.h"
#import "VCActivityPage.h"
#import "VCHomePage.h"
@interface VCLogin ()
@property (nonatomic, strong) UITextField* usernameField;
@property (nonatomic, strong) UITextField* passwordField;
@property (nonatomic, strong) UIButton* ButtonLogin;
@property (nonatomic, strong) UIButton* ButtonRegister;
@property (nonatomic, strong) UIButton* AutoRegisterBtn;
@property (nonatomic, strong) UIScrollView* scrollView;
@property (nonatomic, strong) UILabel* AutoRegisterLabel;
@property (nonatomic, strong) NSString* userStr;
@property (nonatomic, strong) NSString* keyStr;
@property (nonatomic) NSMutableDictionary* dict;
@end

@implementation VCLogin

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.dict = [[NSMutableDictionary alloc] init];
    self.dict = [@{
        @"a" : @"a"
    } mutableCopy];
    [self setupSubviews];
    
}

- (void) setupSubviews {
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
    
    
    self.usernameField = [[UITextField alloc] initWithFrame:CGRectMake(50, 300, self.view.frame.size.width - 100, 40)];
    self.usernameField.placeholder = @"请输入用户名";
    self.usernameField.delegate = self;
    self.usernameField.borderStyle = UITextBorderStyleRoundedRect;
    
    self.passwordField = [[UITextField alloc] initWithFrame:CGRectMake(50, 360, self.view.frame.size.width - 100, 40)];
    self.passwordField.placeholder = @"请输入密码";
    self.passwordField.delegate = self;
    self.passwordField.borderStyle = UITextBorderStyleRoundedRect;
    self.passwordField.secureTextEntry = YES;
    
    self.ButtonLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ButtonLogin.frame = CGRectMake(50, 430, 120, 44);
    [self.ButtonLogin setTitle:@"登录" forState:UIControlStateNormal];
    self.ButtonLogin.layer.borderWidth = 1.0f;
    self.ButtonLogin.layer.borderColor = [UIColor blackColor].CGColor;
    [self.ButtonLogin addTarget:self action:@selector(PressLogin) forControlEvents:UIControlEventTouchUpInside];
    
    self.ButtonRegister = [UIButton buttonWithType:UIButtonTypeCustom];
    self.ButtonRegister.frame = CGRectMake(212, 430, 120, 44);
    [self.ButtonRegister setTitle:@"注册" forState:UIControlStateNormal];
    self.ButtonRegister.layer.borderWidth = 1.0f;
    self.ButtonRegister.layer.borderColor = [UIColor blackColor].CGColor;
    [self.ButtonRegister addTarget:self action:@selector(PressRegister) forControlEvents:UIControlEventTouchUpInside];
    
    self.AutoRegisterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.AutoRegisterBtn setImage:[UIImage imageNamed:@"方框1"] forState:UIControlStateNormal];
    [self.AutoRegisterBtn addTarget:self action:@selector(PressSelect) forControlEvents:UIControlEventTouchUpInside];
    [self.AutoRegisterBtn setImage:[UIImage imageNamed:@"方框2"] forState:UIControlStateSelected];
    self.AutoRegisterBtn.frame = CGRectMake(50, 480, 20, 20);
    self.AutoRegisterLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 480, 80, 20)];
    self.AutoRegisterLabel.text = @"自动登录";
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PressTap)];
    [self.scrollView addSubview:logoImage];
    [self.scrollView addSubview:logoLabel];
    [self.scrollView addSubview:self.usernameField];
    [self.scrollView addSubview:self.passwordField];
    [self.scrollView addSubview:self.ButtonLogin];
    [self.scrollView addSubview:self.ButtonRegister];
    [self.scrollView addSubview:self.AutoRegisterBtn];
    [self.scrollView addSubview:self.AutoRegisterLabel];
    [self.view addSubview:self.scrollView];
    [self.view addGestureRecognizer:tap];
}
- (void) PressSelect {
    if (self.AutoRegisterBtn.selected == NO) {
        self.AutoRegisterBtn.selected = YES;
    } else {
        self.AutoRegisterBtn.selected = NO;
    }
}
- (void) PressLogin {
    self.keyStr = [self.dict valueForKey:self.usernameField.text];
    if ((self.keyStr != nil) && [self.passwordField.text isEqual:self.keyStr]) {
        VCHomePage* homePage = [[VCHomePage alloc] init];
        VCArticlePage* articlePage = [[VCArticlePage alloc] init];
        VCActivityPage* activityPage = [[VCActivityPage alloc] init];
        VCSearchPage* searchPage = [[VCSearchPage alloc] init];
        VCMyPage* myPage = [[VCMyPage alloc] init];
        
        UINavigationController* navhomePage = [[UINavigationController alloc] initWithRootViewController:homePage];
        UINavigationController* navarticalPage = [[UINavigationController alloc] initWithRootViewController:articlePage];
        UINavigationController* navactivityPage = [[UINavigationController alloc] initWithRootViewController:activityPage];
        UINavigationController* navsearchPage = [[UINavigationController alloc] initWithRootViewController:searchPage];
        UINavigationController* navmypage = [[UINavigationController alloc] initWithRootViewController:myPage];
        
        UITabBarController* tabBar3G = [[UITabBarController alloc] init];
        
        homePage.title = @"SHARE";
        searchPage.title = @"搜索";
        articlePage.title = @"文章";
        myPage.title = @"个人信息";
        
        UITabBarItem* tabBarHome = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button1_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        homePage.tabBarItem = tabBarHome;
        UITabBarItem* tabBarSearch = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button2_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button2_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        searchPage.tabBarItem = tabBarSearch;
        UITabBarItem* tabBarArticle = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button3_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button3_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        articlePage.tabBarItem = tabBarArticle;
        UITabBarItem* tabBarActicity = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button4_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button4_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        activityPage.tabBarItem = tabBarActicity;
        UITabBarItem* tabBarMy = [[UITabBarItem alloc] initWithTitle:nil image:[[UIImage imageNamed:@"button5_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"button5_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        myPage.tabBarItem = tabBarMy;
        
        tabBar3G.tabBar.tintColor = [UIColor colorWithRed:79 / 225.0f green:141 / 225.0f blue:198 / 225.0f alpha:1];
        NSArray* arr = [NSArray arrayWithObjects:navhomePage, navsearchPage, navarticalPage, navactivityPage, navmypage, nil];
        tabBar3G.viewControllers = arr;
        
        [self.tabBardelegate tabBarMode:tabBar3G];
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"请输入正确的密码和账户" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction* confirm = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:confirm];
        [self presentViewController:alert animated:YES completion:nil];
    }
}
- (void) PressRegister {
    VCRegister* registerVC = [[VCRegister alloc] init];
    registerVC.delegate = self;
    [self presentViewController:registerVC animated:YES completion:nil];
    
}

- (void) PressTap {
    [self.usernameField resignFirstResponder];
    [self.passwordField resignFirstResponder];
    [self.scrollView setContentOffset:CGPointMake(0, 0) animated:true];
}

- (void) textFieldDidBeginEditing:(UITextField *)textField {
    [self.scrollView setContentOffset:CGPointMake(0, 100) animated:true];
}

- (void)stringMode:(NSMutableDictionary *)dictionary {
    [self.dict addEntriesFromDictionary:dictionary];
    NSLog(@"%@", self.dict);
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
