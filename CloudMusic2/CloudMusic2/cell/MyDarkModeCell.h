//
//  MyDarkModeCell.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyDarkModeCell : UITableViewCell
@property (nonatomic, strong) UISwitch *modeSwitch;
@property (nonatomic, copy) void (^modeSwitchChangedHandler)(BOOL isOn);
- (void)configureSwitchState:(BOOL)isOn;
@end

NS_ASSUME_NONNULL_END
