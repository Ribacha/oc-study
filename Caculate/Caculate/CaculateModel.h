//
//  CaculateModel.h
//  Caculate
//
//  Created by 开开心心的macbook air on 2025/9/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CaculateModel : NSObject
- (NSDecimalNumber *)calculateExpression:(NSString *)expression;
@end

NS_ASSUME_NONNULL_END
