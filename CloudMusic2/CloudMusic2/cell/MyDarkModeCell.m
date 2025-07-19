//
//  MyDarkModeCell.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import "MyDarkModeCell.h"

@implementation MyDarkModeCell

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
        UIImageView *iconView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 23, 25, 25)];
        iconView.image = [UIImage imageNamed:@"月亮"];
        iconView.contentMode = UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:iconView];
                    
                    
        UILabel* label =  [[UILabel alloc] initWithFrame:CGRectMake(55, 20, 150, 30)];
        label.text = @"深色模式";
        label.font = [UIFont boldSystemFontOfSize:16];
        label.textColor = [UIColor labelColor];
        [self.contentView addSubview:label];
        
        self.modeSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(350, 20, 0, 0)];
        [self.modeSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:self.modeSwitch];
    }
    return self;
}
- (void) configureSwitchState: (BOOL)isOn {
    [self.modeSwitch setOn:isOn animated:NO];
}
- (void) switchChanged: (UISwitch*)sender {
    if (self.modeSwitchChangedHandler) {
        self.modeSwitchChangedHandler(sender.isOn);
    }
}
@end
