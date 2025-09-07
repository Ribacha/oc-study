//
//  AttentionCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/28.
//

// AttentionCell.m
#import "AttentionCell.h"
#import "CellStateManager.h"

@interface AttentionCell()
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UIButton *attentionButton;
@end

@implementation AttentionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.iconView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 5, 50, 50)];
        self.iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:self.iconView];

        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 14, 150, 30)];
        self.nameLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:self.nameLabel];

        self.attentionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionButton.frame = CGRectMake(300, 13, 60, 30);
        [self.attentionButton addTarget:self action:@selector(attentionButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.attentionButton];
    }
    return self;
}

- (void)configureWithData:(NSDictionary *)data index:(NSInteger)index{
    self.index = index;
    self.iconView.image = [UIImage imageNamed:data[@"icon"]];
    self.nameLabel.text = data[@"name"];

    BOOL isFollowing = [[CellStateManager sharedManager] stateForIndex:index];
    NSString *imageName = isFollowing ? @"已关注" : @"没关注";
    [self.attentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)attentionButtonTapped:(UIButton *)sender{
    BOOL currentState = [[CellStateManager sharedManager] stateForIndex:self.index];
    BOOL newState = !currentState;
    [[CellStateManager sharedManager] setState:newState forIndex:self.index];
    NSString *imageName = newState ? @"已关注" : @"没关注";
    [self.attentionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end
