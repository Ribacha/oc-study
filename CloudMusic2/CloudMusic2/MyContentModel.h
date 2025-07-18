//
//  MyContentModel.h
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyContentModel : NSObject
@property (nonatomic, copy) NSString *iconName;      // 图片名
@property (nonatomic, copy) NSString *title;         // 标题
@property (nonatomic, copy) NSString *subtitle;      // 副标题
@property (nonatomic, copy) NSString *extraInfo;     // 额外信息
@end

NS_ASSUME_NONNULL_END
