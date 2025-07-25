//
//  VCRegister.h
//  KXShare
//
//  Created by 开开心心的macbook air on 2025/7/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol StringDelegate <NSObject>

- (void) stringMode: (NSMutableDictionary*) dictionary;

@end

@interface VCRegister : UIViewController<UITextFieldDelegate>

@property (nonatomic, assign) id <StringDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
