//
//  AttentionSecondCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "AttentionSecondCell.h"
#import "CellStateManager.h"
@interface AttentionSecondCell ()
@property (nonatomic, strong) UIButton* AttentionButton;
@end
@implementation AttentionSecondCell

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
        UIImageView* iconView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 50, 50)];
        iconView.image = [UIImage imageNamed:@"a1"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
        
        UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(80, 14, 80, 30)];
        label.text = @"share嘟嘟";
        label.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:label];
        
        self.AttentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.AttentionButton.frame = CGRectMake(300, 13, 60, 30);
        [self.AttentionButton addTarget:self action:@selector(AttentionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.AttentionButton];
    }
    return self;
}
- (void)configureWithIndex:(NSInteger)index {
    self.index = index;
    BOOL isPlaying = [[CellStateManager sharedManager] stateForIndex:index];
    NSString* imageName = isPlaying ? @"已关注" : @"没关注";
    [self.AttentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
- (void) AttentionButtonTapped: (UIButton*) sender {
    BOOL currentState = [[CellStateManager sharedManager] stateForIndex:self.index];
    BOOL newState = !currentState;
    [[CellStateManager sharedManager] setState:newState forIndex:self.index];
    NSString* imageName = newState ? @"已关注" : @"没关注";
    [self.AttentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}
@end
