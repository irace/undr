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
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [result addObject:block(object)];
    }];
    
    return [NSArray arrayWithArray:result];
}

- (id)reduce:(id(^)(id, id))block memo:(id)memo {
    __block id result = memo;

    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        result = block(memo, object);
    }];
    
    return result;
}

- (id)reduceRight:(id(^)(id, id))block memo:(id)memo {
    __block id result = memo;
    
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id object, NSUInteger index, BOOL *stop) {
        result = block(memo, object);
    }];
    
    return result;
}

- (id)find:(BOOL(^)(id))block {
    __block id result = nil;
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (block(self)) {
            result = self;
            *stop = YES;
        }
    }];

    return result;
}

- (NSArray *)filter:(BOOL(^)(id))block {
    NSMutableArray *result = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (block(object))
            [result addObject:self];
    }];
    
    return [NSArray arrayWithArray:result];
}

- (NSArray *)reject:(BOOL(^)(id))block {
    NSMutableArray *result = [NSMutableArray array];
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object))
            [result addObject:self];
    }];
    
    return result;
}

- (BOOL)every:(BOOL(^)(id))block {
    __block BOOL result = YES;
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object)) {
            result = NO;
            *stop = YES;
        }
    }];
    
    return result;
}

- (BOOL)some:(BOOL(^)(id))block {
    __block BOOL result = NO;
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object)) {
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
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
    
    return result;
}

@end
