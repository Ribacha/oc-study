//
//  CaculateView.m
//  Caculate
//
//  Created by 开开心心的macbook air on 2025/9/24.
//

#import "CaculateView.h"
#import "Masonry.h"
@implementation CaculateView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat SIZE = [UIScreen mainScreen].bounds.size.width / 5;
        NSArray *grayArray = @[@"AC", @"(", @")"];
        NSArray *orangeArray = @[@"×", @"÷", @"+", @"-", @"="];
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                _baseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                _baseButton.layer.cornerRadius = SIZE / 2;
                _baseButton.titleLabel.font = [UIFont systemFontOfSize:42];
                _baseButton.tag = j + 4 + i * 4;
                [self addSubview:_baseButton];
                [_baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.bottom.equalTo(self).offset(-(75 + (SIZE + 17) * (i + 1)));
                    make.left.equalTo(self).offset(5 + [UIScreen mainScreen].bounds.size.width / 4 * j);
                    make.width.mas_equalTo(SIZE);
                    make.height.mas_offset(SIZE);
                }];
                if (j < 3) {
                    if (i < 3) {
                        [_baseButton setBackgroundColor:[UIColor colorWithWhite:0.15 alpha:1]];
                        [_baseButton setTitle:[NSString stringWithFormat:@"%d", j * 1 + i * 3 + 1] forState:UIControlStateNormal];
                        [_baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                    } else {
                        [_baseButton setBackgroundColor:[UIColor lightGrayColor]];
                        [_baseButton setTitle:grayArray[j] forState:UIControlStateNormal];
                        [_baseButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                    }
                } else {
                    [_baseButton setBackgroundColor:[UIColor colorWithRed:0.9 green:0.58 blue:0 alpha:1]];
                    [_baseButton setTitle:orangeArray[i] forState:UIControlStateNormal];
                    [_baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                }
                if (j == 0 && i == 3) {
                    _baseButton.titleLabel.font = [UIFont systemFontOfSize:34];
                }
            }
        }
        _baseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _baseButton.layer.cornerRadius = SIZE / 2;
        _baseButton.titleLabel.font = [UIFont systemFontOfSize:42];
        _baseButton.tag = 20;
        [self addSubview:_baseButton];
        [_baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-SIZE);
            make.left.equalTo(self).offset(5);
            make.width.mas_equalTo(2 * SIZE + 20);
            make.height.mas_equalTo(SIZE);
        }];
        [_baseButton setBackgroundColor:[UIColor colorWithWhite:0.15 alpha:1]];
        [_baseButton setTitle:[NSString stringWithFormat:@"0"] forState:UIControlStateNormal];
        [_baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _baseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _baseButton.layer.cornerRadius = SIZE / 2;
        _baseButton.titleLabel.font = [UIFont systemFontOfSize:42];
        _baseButton.tag = 21;
        [self addSubview:_baseButton];
        [_baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-SIZE);
            make.left.equalTo(self).offset(5 + [UIScreen mainScreen].bounds.size.width / 4 * 2);
            make.width.mas_equalTo(SIZE);
            make.height.mas_equalTo(SIZE);
        }];
        [_baseButton setBackgroundColor:[UIColor colorWithWhite:0.15 alpha:1]];
        [_baseButton setTitle:[NSString stringWithFormat:@"."] forState:UIControlStateNormal];
        [_baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        _baseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _baseButton.layer.cornerRadius = SIZE / 2;
        _baseButton.titleLabel.font = [UIFont systemFontOfSize:42];
        _baseButton.tag = 22;
        [self addSubview:_baseButton];
        [_baseButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self).offset(-SIZE);
            make.left.equalTo(self).offset(5 + [UIScreen mainScreen].bounds.size.width / 4 * 3);
            make.width.mas_equalTo(SIZE);
            make.height.mas_equalTo(SIZE);
        }];
        [_baseButton setBackgroundColor:[UIColor colorWithRed:0.9 green:0.58 blue:0 alpha:1]];
        [_baseButton setTitle:orangeArray[4] forState:UIControlStateNormal];
        [_baseButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        self.displayTextField = [[UITextField alloc] init];
        self.displayTextField.textColor = [UIColor whiteColor];
        self.displayTextField.textAlignment = NSTextAlignmentRight;
        self.displayTextField.font = [UIFont systemFontOfSize:88 weight:UIFontWeightLight];
        self.displayTextField.text = @"0";
        self.displayTextField.userInteractionEnabled = NO;
        self.displayTextField.adjustsFontSizeToFitWidth = YES;
        self.displayTextField.minimumFontSize = 30;
        [self addSubview:self.displayTextField];
        [self.displayTextField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self).offset(140);
            make.left.equalTo(self).offset(12.0);
            make.right.equalTo(self).offset(-12.0);
            make.height.mas_equalTo(120);
        }];
    }
    return self;
}

@end
