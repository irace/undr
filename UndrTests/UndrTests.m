//
//  UndrTests.m
//  UndrTests
//
//  Created by Bryan Irace on 11/30/12.
//
//

#import "UndrTests.h"

#import "NSArray+Undr.h"

@implementation UndrTests

// https://github.com/documentcloud/underscore/blob/master/test/collections.js

#pragma mark - Each

- (void)testIteratorsProvideValueAndIterationCount {
    [@[ @1, @2, @3 ] each:^(NSNumber *number, NSUInteger index) {
        STAssertEquals([number unsignedIntValue], index + 1,
                       @"each iterators provide value and iteration count");
    }];
}

- (void)testHandlesProperly {
}

@end
