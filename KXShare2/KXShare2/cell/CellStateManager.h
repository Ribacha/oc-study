//
//  CellStateManager.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CellStateManager : NSObject
+ (instancetype) sharedManager;
- (BOOL)stateForIndex:(NSInteger)index;
- (void)setState:(BOOL)state forIndex: (NSInteger)index;
@property (nonatomic, strong) NSMutableDictionary<NSNumber *, NSNumber *> *stateDict;
@end

NS_ASSUME_NONNULL_END
