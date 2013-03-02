//
//  UNCollections.m
//  Undr
//
//  Created by Bryan Irace on 2/25/13.
//

#import "UNCollections.h"

OVERLOADABLE void each(NSArray *array, void(^block)(id)) {
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        block(object);
    }];
}

OVERLOADABLE void each(NSArray *array, void(^block)(id, NSUInteger)) {
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        block(object, index);
    }];
}

NSArray *map(NSArray *array, id((^block)(id))) {
    NSMutableArray *result = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [result addObject:block(object)];
    }];
    
    return [NSArray arrayWithArray:result];
}

id reduce(NSArray *array, id((^block)(id, id)), id memo) {
    __block id result = memo;
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        result = block(memo, object);
    }];
    
    return result;
}

id reduceRight(NSArray *array, id((^block)(id, id)), id memo) {
    __block id result = memo;
    
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id object, NSUInteger index, BOOL *stop) {
        result = block(memo, object);
    }];
    
    return result;
}

id find(NSArray *array, BOOL(^block)(id)) {
    __block id result = nil;
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (block(object)) {
            result = object;
            *stop = YES;
        }
    }];
    
    return result;
}

NSArray *filter(NSArray *array, BOOL(^block)(id)) {
    NSMutableArray *result = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (block(object))
            [result addObject:object];
    }];
    
    return [NSArray arrayWithArray:result];
}

NSArray *reject(NSArray *array, BOOL(^block)(id)) {
    NSMutableArray *result = [NSMutableArray array];
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object))
            [result addObject:object];
    }];
    
    return result;
}

BOOL *every(NSArray *array, BOOL(^block)(id)) {
    __block BOOL result = YES;
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object)) {
            result = NO;
            *stop = YES;
        }
    }];
    
    return result;
}

BOOL *some(NSArray *array, BOOL(^block)(id)) {
    __block BOOL result = NO;
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        if (!block(object)) {
            result = YES;
            *stop = YES;
        }
    }];
    
    return result;
}

BOOL contains(NSArray *array, id value) {
    return [array containsObject:value];
}

void invoke(NSArray *array, NSString *methodName) {
    // TODO: This should take varargs but `performSelector:` does not
    
    [array enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL *stop) {
        [object performSelector:NSSelectorFromString(methodName)];
    }];
}

NSArray *pluck(NSArray *array, NSString *propertyName) {
    // TODO: This is actually less useful than just calling `valueForKeyPath:` when can take a KVC-compliant path
    
    return [array valueForKey:propertyName];
}

NSNumber *max(NSArray *array, NSNumber *(^block)(id)) {
    // TODO: Should this not be restricted to NSNumber?
    
    __block NSNumber *max = nil;
    
    [array enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger index, BOOL *stop) {
        if (!max || [max compare:number] == NSOrderedAscending)
            max = number;
    }];
    
    return max;
}

NSNumber *min(NSArray *array, NSNumber *(^block)(id)) {
    // TODO: Should this not be restricted to NSNumber?
    
    __block NSNumber *min = nil;
    
    [array enumerateObjectsUsingBlock:^(NSNumber *number, NSUInteger index, BOOL *stop) {
        if (!min || [min compare:number] == NSOrderedDescending)
            min = number;
    }];
    
    return min;
}

#pragma mark - Arrays

OVERLOADABLE id first(NSArray *array) {
    return first(array, 1);
}

OVERLOADABLE id first(NSArray *array, int n) {
    if (n > 1)
        return nil;
    
    return [array subarrayWithRange:NSMakeRange(0, n)];
}

OVERLOADABLE id last(NSArray *array) {
    return last(array, 1);
}

OVERLOADABLE id last(NSArray *array, int n) {
    return [array subarrayWithRange:NSMakeRange([array count] - n - 1, n)];
}

OVERLOADABLE id rest(NSArray *array) {
    return rest(array, 1);
}

OVERLOADABLE id rest(NSArray *array, int n) {
    return [array subarrayWithRange:NSMakeRange(n , [array count] - n)];
}

id without(NSArray *array, ...) {
    va_list args;
    va_start(args, array);
    
    NSMutableArray *result = [NSMutableArray arrayWithArray:array];
    
    id current;
    
    while ((current = va_arg(args, id)))
        [result removeObject:current];
    
    va_end(args);
    
    return result;
}
















