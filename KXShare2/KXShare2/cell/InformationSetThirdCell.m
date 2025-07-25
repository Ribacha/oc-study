//
//  InformationSetThirdCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "InformationSetThirdCell.h"
#import "CellStateManager.h"
@interface InformationSetThirdCell ()
@property (nonatomic, strong) UIButton* AttentionButton;
@end
@implementation InformationSetThirdCell

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
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(30, 14, 180, 30)];
        label.text = @"声音";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        
        self.AttentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.AttentionButton.frame = CGRectMake(300, 18, 20, 20);
        [self.AttentionButton addTarget:self action:@selector(AttentionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.AttentionButton];
    }
    return self;
}
- (void)configureWithIndex:(NSInteger)index {
    self.index = index;
    BOOL isPlaying = [[CellStateManager sharedManager] stateForIndex:index];
    NSString* imageName = isPlaying ? @"圆圈对勾" : @"圆圈对勾1";
    [self.AttentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
- (void) AttentionButtonTapped: (UIButton*) sender {
    BOOL currentState = [[CellStateManager sharedManager] stateForIndex:self.index];
    BOOL newState = !currentState;
    [[CellStateManager sharedManager] setState:newState forIndex:self.index];
    NSString* imageName = newState ? @"圆圈对勾" : @"圆圈对勾1";
    [self.AttentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
@end
