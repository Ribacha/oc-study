//
//  NetWorkManager.h
//  AFNetworking Demo
//
//  Created by 开开心心的macbook air on 2025/9/17.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkManager : NSObject
+(instancetype)sharedManager;
- (void)getArtistInfoWithID:(NSString *)artistID token:(NSString *)accessToken success:(void (^)(NSDictionary *response))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
