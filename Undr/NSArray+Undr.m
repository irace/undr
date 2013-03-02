//
//  NSArray+Undr.m
//  Undr
//
//  Created by Bryan Irace on 11/30/12.
//

#import "NSArray+Undr.h"

#import "UNCollections.h"

@implementation NSArray (Undr)

- (void)each:(void(^)(id, NSUInteger))block {
    each(self, block);
}

- (NSArray *)map:(id(^)(id))block {
    return map(self, block);
}

- (id)reduce:(id(^)(id, id))block memo:(id)memo {
    return reduce(self, block, memo);
}

- (id)reduceRight:(id(^)(id, id))block memo:(id)memo {
    return reduceRight(self, block, memo);
}

- (id)find:(BOOL(^)(id))block {
    return find(self, block);
}

- (NSArray *)filter:(BOOL(^)(id))block {
    return filter(self, block);
}

- (NSArray *)reject:(BOOL(^)(id))block {
    return reject(self, block);
}

- (BOOL)every:(BOOL(^)(id))block {
    return every(self, block);
}

- (BOOL)some:(BOOL(^)(id))block {
    return some(self, block);
}

- (BOOL)contains:(id)value {
    return contains(self, value);
}

- (void)invoke:(NSString *)methodName {
    return invoke(self, methodName);
}

- (NSArray *)pluck:(NSString *)propertyName {
    return pluck(self, propertyName);
}

- (NSNumber *)max:(NSNumber *(^)(id))block {
    return max(self, block);
}

- (NSNumber *)min:(NSNumber *(^)(id))block {
    return min(self, block);
}

#pragma mark - Arrays

- (id)first {
    return first(self);
}

- (id)first:(int)n {
    return first(self, n);
}

- (id)last {
    return last(self);
}

- (id)last:(int)n {
    return last(self, n);
}

- (id)rest {
    return rest(self);
}

- (id)rest:(int)n {
    return rest(self, n);
}

- (id)without:(id)value, ... {
    va_list ap;
    va_start(ap, value);
    
    return without(self, ap);
    
    va_end(ap);
}

@end
