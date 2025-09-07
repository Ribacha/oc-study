//
//  BasicInformationFourthCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "BasicInformationFourthCell.h"
#import "CellStateManager.h"
@interface  BasicInformationFourthCell ()
@property (nonatomic, strong) UIButton* Button1;
@property (nonatomic, strong) UIButton* Button2;
@end
@implementation BasicInformationFourthCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 40, 30)];
        label.text = @"性别";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        
        self.Button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.Button1.frame = CGRectMake(100, 20, 25, 25);
        [self.Button1 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.Button1.tag = 0;
        [self.contentView addSubview:self.Button1];
        
        self.Button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        self.Button2.frame = CGRectMake(170, 20, 25, 25);
        [self.Button2 addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        self.Button2.tag = 1;
        [self.contentView addSubview:self.Button2];
    }
    return self;
}
- (void)configureWithIndex:(NSInteger)index {
    self.index = index;
    NSInteger index1 = index * 10 + 0;
    NSInteger index2 = index * 10 + 1;
    BOOL state1 = [[CellStateManager sharedManager] stateForIndex:index1];
    BOOL state2 = [[CellStateManager sharedManager] stateForIndex:index2];
    NSString *image1 = state1 ? @"男生1" : @"男生";
    NSString *image2 = state2 ? @"女生1" : @"女生";
    [self.Button1 setImage:[UIImage imageNamed:image1] forState:UIControlStateNormal];
    [self.Button2 setImage:[UIImage imageNamed:image2] forState:UIControlStateNormal];
}

- (void)buttonTapped:(UIButton *)sender {
    NSInteger index1 = self.index * 10 + 0; // 男
    NSInteger index2 = self.index * 10 + 1; // 女

    BOOL isFirst = (sender.tag == 0);

    [[CellStateManager sharedManager] setState:isFirst forIndex:index1];
    [[CellStateManager sharedManager] setState:!isFirst forIndex:index2];

    BOOL state1 = [[CellStateManager sharedManager] stateForIndex:index1];
    BOOL state2 = [[CellStateManager sharedManager] stateForIndex:index2];

    NSString *image1 = state1 ? @"男生1" : @"男生";
    NSString *image2 = state2 ? @"女生1" : @"女生";

    [self.Button1 setImage:[UIImage imageNamed:image1] forState:UIControlStateNormal];
    [self.Button2 setImage:[UIImage imageNamed:image2] forState:UIControlStateNormal];
}
@end
