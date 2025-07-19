//
//  VCMyCloud.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import "VCMyCloud.h"
#import "MyCloudCell.h"
#import "MyContentModel.h"
@interface VCMyCloud () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray<MyContentModel *> *dataSource;
@end

@implementation VCMyCloud

- (void)viewDidLoad {
    [super viewDidLoad];
    [self applyInterfaceStyle:self.isDarkMode];
    if (self.isDarkMode) {
        self.view.backgroundColor = [UIColor blackColor];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
    }
    UIBarButtonItem* customBackButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"1_微笑"] style:UIBarButtonItemStylePlain target:self action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = customBackButton;
    
    
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"歌曲", @"声音", @"有声书", @"歌单"]];
    segmentedControl.frame = CGRectMake(20, 120, self.view.bounds.size.width - 40, 30);
    [segmentedControl addTarget:self action:@selector(segmentChanged:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedControl];
    
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 160, self.view.bounds.size.width, self.view.bounds.size.height - 160) style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[MyCloudCell class] forCellReuseIdentifier:@"MyCloudCell"];
    self.tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.tableView];
    self.dataSource = [self generateSampleData];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
}

- (void)applyInterfaceStyle:(BOOL)isDark {
    if (@available(iOS 13.0, *)) {
        self.overrideUserInterfaceStyle = isDark ? UIUserInterfaceStyleDark : UIUserInterfaceStyleLight;
    }
}
- (void)backAction {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void) segmentChanged: (UISegmentedControl* )sender {
    [self.tableView reloadData];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10; // 示例，实际根据 segmentIndex 决定
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyCloudCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyCloudCell" forIndexPath:indexPath];
    MyContentModel* model = self.dataSource[indexPath.row];
    [cell configureWithModel:model];
    
    NSArray *songTitles = @[
        @"从前以后PT.1",
        @"迈克的生日",
        @"东京下雨夜",
        @"碎碎念",
        @"Last Day",
        @"Rapping freestyle",
        @"20 Minutes Freestyle (2022)",
        @"123 (Doremi)",
        @"Do That",
        @"First Song（第一首歌）"
    ];
    NSArray *artists = @[
        @"盛宇D-SHINE/KEY.L刘聪 - 奎壹",
        @"Andreyun & 艾福杰尼",
        @"ljz329/AZ阿之",
        @"那奇沃夫/ljz329",
        @"ljz329/YuGo",
        @"ICE杨长青/ljz329",
        @"ljz329/Drunker",
        @"SSr/ljz329",
        @"ljz329/马思唯",
        @"ljz329"
    ];
    cell.titleLabel.text = songTitles[indexPath.row];
    cell.subtitleLabel.text = artists[indexPath.row];
    return cell;
}
- (NSArray<MyContentModel *> *)generateSampleData {
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < 10; i++) {
        MyContentModel *model = [[MyContentModel alloc] init];
        model.title = [NSString stringWithFormat:@"歌曲 %d", i + 1];
        model.subtitle = @"歌手名 - 专辑名";
        model.extraInfo = @"超清母带";
        [array addObject:model];
    }
    return array;
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
