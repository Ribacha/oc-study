//
//  VCMessage.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/26.
//

#import "VCMessage.h"
#import "ChatCell.h"
@interface VCMessage ()<UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>
@property (nonatomic, strong) UITableView* tableView;
@property (nonatomic, strong) UITextField* inputField;
@property (nonatomic, strong) NSMutableArray<NSDictionary*>* messages;
@property (nonatomic, strong) NSMutableArray* isSenderArray;
@property (nonatomic, strong) UIButton* sendButton;
@end

@implementation VCMessage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.messages = [NSMutableArray array];
    self.isSenderArray = [NSMutableArray array];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[ChatCell class] forCellReuseIdentifier:@"ChatCell"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    
    self.inputField = [[UITextField alloc] initWithFrame:CGRectMake(20, self.view.frame.size.height - 60, self.view.frame.size.width - 100, 40)];
    self.inputField.backgroundColor = [UIColor whiteColor];
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.inputField];
    
    self.sendButton = [UIButton buttonWithType:UIButtonTypeSystem];
    self.sendButton.frame = CGRectMake(self.view.frame.size.width - 80, self.view.frame.size.height - 60, 70, 40);
    [self.sendButton setTitle:@"发送" forState:UIControlStateNormal];
    self.sendButton.backgroundColor = [UIColor blueColor];
    [self.sendButton addTarget:self action:@selector(sendMessage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendButton];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PressTap)];
    [self.view addGestureRecognizer:tap];
    
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"与share西西的对话";
    titleLabel.font = [UIFont boldSystemFontOfSize:18];
    titleLabel.textColor = [UIColor blackColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [titleLabel sizeToFit]; // 自动调整大小以适应内容
    self.navigationItem.titleView = titleLabel;
    [self.inputField becomeFirstResponder];
//    [self.view bringSubviewToFront:self.inputField];
//    [self.view bringSubviewToFront:self.sendButton];
}

- (void)sendMessage {
    if (self.inputField.text.length == 0) return;

    static BOOL isSender = YES;

    // 获取当前时间
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    NSString *timeString = [formatter stringFromDate:[NSDate date]];

    NSDictionary *message = @{
        @"text": self.inputField.text,
        @"time": timeString,
        @"isSender": @(isSender)
    };

    [self.messages addObject:message];
    isSender = !isSender;

    [self.tableView reloadData];
    [self.tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:self.messages.count - 1 inSection:0]
                          atScrollPosition:UITableViewScrollPositionBottom
                                  animated:YES];
    
    self.inputField.text = @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.messages.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *msgData = self.messages[indexPath.row];
    NSString *msg = msgData[@"text"];

    CGSize size = [msg boundingRectWithSize:CGSizeMake(220, MAXFLOAT)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:16]}
                                    context:nil].size;

    return size.height + 50; // 原来+30，现在多加时间戳
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ChatCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChatCell"];
    NSDictionary *msgData = self.messages[indexPath.row];
    NSString *text = msgData[@"text"];
    BOOL isSender = [msgData[@"isSender"] boolValue];
    NSString *time = msgData[@"time"];

    [cell setMessage:text isSender:isSender time:time];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (void)keyboardWillShow:(NSNotification *)notification {
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat kbHeight = keyboardFrame.size.height;

    UIEdgeInsets insets = self.tableView.contentInset;
    insets.bottom = kbHeight + 60; // 60 是输入框的高度
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;

    CGFloat y = self.view.frame.size.height - kbHeight - 60;
    self.inputField.frame = CGRectMake(20, y, self.view.frame.size.width - 100, 40);
    self.sendButton.frame = CGRectMake(self.view.frame.size.width - 80, y, 70, 40);

    if (self.messages.count > 0) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.01 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSIndexPath *lastIndexPath = [NSIndexPath indexPathForRow:self.messages.count - 1 inSection:0];
            [self.tableView scrollToRowAtIndexPath:lastIndexPath
                                  atScrollPosition:UITableViewScrollPositionBottom
                                          animated:YES];
        });
    }
}

- (void)keyboardWillHide:(NSNotification *)notification {
    UIEdgeInsets insets = self.tableView.contentInset;
    insets.bottom = 0;
    self.tableView.contentInset = insets;
    self.tableView.scrollIndicatorInsets = insets;
    CGFloat y = self.view.frame.size.height - 60;
    self.inputField.frame = CGRectMake(20, y, self.view.frame.size.width - 100, 40);
    self.sendButton.frame = CGRectMake(self.view.frame.size.width - 80, y, 70, 40);
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.tabBarController.tabBar.hidden = NO;

    // 移除监听
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void) PressTap {
    [self.inputField resignFirstResponder];
}
@end
