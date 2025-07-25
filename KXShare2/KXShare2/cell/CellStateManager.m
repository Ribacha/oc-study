//
//  CellStateManager.m
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/25.
//

#import "CellStateManager.h"

@implementation CellStateManager

+ (instancetype)sharedManager {
    static CellStateManager* manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[CellStateManager alloc] init];
        manager.stateDict = [NSMutableDictionary dictionary];
    });
    return manager;
}
- (BOOL)stateForIndex:(NSInteger)index {
    return [self.stateDict[@(index)] boolValue];
}
- (void)setState:(BOOL)state forIndex:(NSInteger)index {
    self.stateDict[@(index)] = @(state);
}
@end
