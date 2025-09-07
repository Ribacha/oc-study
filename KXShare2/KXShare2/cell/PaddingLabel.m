//
//  PaddingLabel.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/26.
//

#import "PaddingLabel.h"

@implementation PaddingLabel

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        _textInsets = UIEdgeInsetsMake(10, 10, 10, 10); // 默认上下左右 padding
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

- (CGSize)intrinsicContentSize {
    CGSize size = [super intrinsicContentSize];
    size.width += self.textInsets.left + self.textInsets.right;
    size.height += self.textInsets.top + self.textInsets.bottom;
    return size;
}

@end
