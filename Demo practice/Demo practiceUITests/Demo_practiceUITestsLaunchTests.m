//
//  Demo_practiceUITestsLaunchTests.m
//  Demo practiceUITests
//
//  Created by 开开心心的macbook air on 2025/6/11.
//

#import <XCTest/XCTest.h>

@interface Demo_practiceUITestsLaunchTests : XCTestCase

@end

@implementation Demo_practiceUITestsLaunchTests

+ (BOOL)runsForEachTargetApplicationUIConfiguration {
    return YES;
}

- (void)setUp {
    self.continueAfterFailure = NO;
}

- (void)testLaunch {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Insert steps here to perform after app launch but before taking a screenshot,
    // such as logging into a test account or navigating somewhere in the app

    XCTAttachment *attachment = [XCTAttachment attachmentWithScreenshot:XCUIScreen.mainScreen.screenshot];
    attachment.name = @"Launch Screen";
    attachment.lifetime = XCTAttachmentLifetimeKeepAlways;
    [self addAttachment:attachment];
}

@end
