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
    for (id object in self) block(object);
}

- (NSArray *)map:(id(^)(id))block {
    NSMutableArray *result = [NSMutableArray array];
    
    for (id object in self) [result addObject:block(object)];
    
    return result;
}

- (id)reduce:(id(^)(id, id))block memo:(id)memo {
    id result = memo;
    
    for (id object in self) result = block(memo, object);
    
    return result;
}

- (id)reduceRight:(id(^)(id, id))block memo:(id)memo {
    id result = memo;
    
    for (id object in [self reverseObjectEnumerator]) result = block(memo, object);
    
    return result;
}

- (id)find:(BOOL(^)(id))block {
    for (id object in self) if (block(self)) return self;
    
    return nil;
}

- (NSArray *)filter:(BOOL(^)(id))block {
    NSMutableArray *result = [NSMutableArray array];
    
    for (id object in self) if (block(object)) [result addObject:self];
    
    return result;
}

@end
