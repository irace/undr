//
//  NSArray+Undr.m
//  Undr
//
//  Created by Bryan Irace on 11/30/12.
//
//

#import "NSArray+Undr.h"

@implementation NSArray (Undr)

- (void)each:(void(^)(id))block {
    for (id object in self)
        block(object);
}

- (NSArray *)map:(id(^)(id))block {
    NSMutableArray *result = [NSMutableArray array];
    
    for (id object in self) [result addObject:block(object)];
    
    return result;
}

@end
