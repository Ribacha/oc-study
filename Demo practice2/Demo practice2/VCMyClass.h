//
//  VCMyClass.h
//  Demo practice2
//
//  Created by 开开心心的macbook air on 2025/7/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VCMyClass : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong) UITableView* tableView;
@end

NS_ASSUME_NONNULL_END
