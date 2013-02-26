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
    return [self containsObject:value];
}

- (void)invoke:(NSString *)methodName {
    // TODO: This should take varargs but `performSelector:` does not
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [object performSelector:NSSelectorFromString(methodName)];
    }];
}

- (NSArray *)pluck:(NSString *)propertyName {
    // TODO: This is actually less useful than just calling `valueForKeyPath:` when can take a KVC-compliant path
    
    return [self valueForKey:propertyName];
}

- (NSNumber *)max:(NSNumber *(^)(id))block {
    // TODO: Should this not be restricted to NSNumber?

    __block NSNumber *max = nil;
    
    [self enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger index, BOOL *stop) {
        if (!max || [max compare:number] == NSOrderedAscending)
            max = number;
    }];
    
    return max;
}

- (NSNumber *)min:(NSNumber *(^)(id))block {
    // TODO: Should this not be restricted to NSNumber?
    
    __block NSNumber *min = nil;
    
    [self enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger index, BOOL *stop) {
        if (!min || [min compare:number] == NSOrderedDescending)
            min = number;
    }];
    
    return min;
}

#pragma mark - Arrays

- (id)first {
    return [self first:1];
}

- (id)first:(int)n {
    if (n > 1)
        return nil;
    
    return [self subarrayWithRange:NSMakeRange(0, n)];
}

- (id)last {
    return [self last:1];
}

- (id)last:(int)n {
    return [self subarrayWithRange:NSMakeRange([self count] - n - 1, n)];
}

- (id)rest {
    return [self rest:1];
}

- (id)rest:(int)n {
    return [self subarrayWithRange:NSMakeRange(n , [self count] - n)];
}

- (id)without:(id)value, ... {
    va_list args;
    va_start(args, value);
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:self];
    
    id current;
    
    while ((current = va_arg(args, id)))
        [result removeObject:current];
    
    va_end(args);
    
    return result;
}

@end
