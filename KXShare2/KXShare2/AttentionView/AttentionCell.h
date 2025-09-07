//
//  AttentionCell.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/8/28.
//

// AttentionCell.h
#import <UIKit/UIKit.h>

@interface AttentionCell : UITableViewCell
@property (nonatomic, assign) NSInteger index;
- (void)configureWithData:(NSDictionary *)data index:(NSInteger)index;
@end


