//
//  VCLogin.h
//  KXShare
//
//  Created by 开开心心的macbook air on 2025/7/19.
//

#import <UIKit/UIKit.h>
#import "VCRegister.h"
NS_ASSUME_NONNULL_BEGIN
@protocol TabBarDelegate <NSObject>

- (void) tabBarMode: (UITabBarController*) tabBar;

@end
@interface VCLogin : UIViewController<UITextFieldDelegate, StringDelegate, UITabBarDelegate>
@property (nonatomic, assign) id <TabBarDelegate> tabBardelegate;
@end

NS_ASSUME_NONNULL_END
