//
//  AttentionFirstCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface AttentionFirstCell : UITableViewCell
@property (nonatomic, assign) NSInteger index;
- (void) configureWithIndex: (NSInteger) index;
@end

NS_ASSUME_NONNULL_END
