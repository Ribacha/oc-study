//
//  ProfileModel.m
//  CloudMusic2
//
//  Created by 开开心心的macbook air on 2025/7/16.
//

#import "ProfileModel.h"

@implementation ProfileModel
+ (instancetype)sharedInstance {
    static ProfileModel *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[ProfileModel alloc] init];
    });
    return instance;
}

@end
