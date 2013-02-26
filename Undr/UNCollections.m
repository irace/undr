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