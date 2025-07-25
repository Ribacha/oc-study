//
//  MyModel.h
//  KXShare2
//
//  Created by 开开心心的macbook air on 2025/7/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL isLiked;
@property (nonatomic, assign) NSInteger likeCount;
@end

NS_ASSUME_NONNULL_END
