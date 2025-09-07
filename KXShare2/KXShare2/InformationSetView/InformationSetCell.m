//
//  InformationSetCell.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/31.
//

// InformationSetCell.m
#import "InformationSetCell.h"
#import "CellStateManager.h"

@interface InformationSetCell ()
@property (nonatomic, assign) NSInteger index;
@end

@implementation InformationSetCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 14, 200, 30)];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
        [self.contentView addSubview:self.titleLabel];
        
        self.actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.actionButton.frame = CGRectMake(300, 18, 20, 20);
        [self.actionButton addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:self.actionButton];
    }
    return self;
}

- (void)configureWithTitle:(NSString *)title atIndex:(NSInteger)index {
    self.index = index;
    self.titleLabel.text = title;
    
    BOOL isSelected = [[CellStateManager sharedManager] stateForIndex:index];
    NSString *imageName = isSelected ? @"圆圈对勾" : @"圆圈对勾1";
    [self.actionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

- (void)buttonTapped:(UIButton *)sender {
    BOOL current = [[CellStateManager sharedManager] stateForIndex:self.index];
    BOOL newState = !current;
    [[CellStateManager sharedManager] setState:newState forIndex:self.index];
    
    NSString *imageName = newState ? @"圆圈对勾" : @"圆圈对勾1";
    [self.actionButton setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
}

@end
