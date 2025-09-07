//
//  ViewController.m
//  FoldCell
//
//  Created by 开开心心的macbook air on 2025/9/4.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *zhedie;
@property (nonatomic, strong) NSString *selectedItem;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.dataArray = [NSMutableArray arrayWithObjects:@"cell1", @"cell2", @"cell3", nil];
    self.selectedItem = self.dataArray.firstObject;
    
    // tableView
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(270, 200, 95, 20)
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.zhedie = [UIButton buttonWithType:UIButtonTypeSystem];
    self.zhedie.frame = CGRectMake(270 + 95, 200, 40, 20);
    self.zhedie.backgroundColor = [UIColor clearColor];
//    [self.zhedie setTitle:@"展开" forState:UIControlStateNormal];
    [self.zhedie setImage:[UIImage imageNamed:@"向左箭头"] forState:UIControlStateNormal];
    [self.zhedie setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.zhedie addTarget:self action:@selector(pressUp:) forControlEvents:UIControlEventTouchUpInside];
    self.zhedie.tag = 1001;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return (self.zhedie.tag == 1001) ? 1 : 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.zhedie.tag == 1001) {
        return 1;
    } else {
        if (section == 0) return 1;
        return self.dataArray.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"ID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    if (self.zhedie.tag == 1001) {
        cell.textLabel.text = self.selectedItem;
    } else {
        if (indexPath.section == 0) {
            cell.textLabel.text = self.selectedItem;
            cell.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
        } else {
            cell.textLabel.text = self.dataArray[indexPath.row];
            cell.backgroundColor = [UIColor whiteColor];
        }
    }
    
    cell.textLabel.font = [UIFont systemFontOfSize:12.0];
    return cell;
}
- (void)toggleFold {
    if (self.zhedie.tag == 1002) {
        // 折叠
//        [self.zhedie setTitle:@"展开" forState:UIControlStateNormal];
        [self.zhedie setImage:[UIImage imageNamed:@"向左箭头"] forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(270, 200, 95, 20);
        self.zhedie.tag = 1001;
    } else {
        // 展开
//        [self.zhedie setTitle:@"折叠" forState:UIControlStateNormal];
        [self.zhedie setImage:[UIImage imageNamed:@"向下箭头"] forState:UIControlStateNormal];
        self.tableView.frame = CGRectMake(270, 200, 95, 80);
        self.zhedie.tag = 1002;
    }
    [self.tableView reloadData];
}
- (void)pressUp:(UIButton *)btn {
    [self toggleFold];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        self.selectedItem = self.dataArray[indexPath.row];
        [self toggleFold];
    }
}
@end
