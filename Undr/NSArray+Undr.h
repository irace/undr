//
//  NSArray+Undr.h
//  Undr
//
//  Created by Bryan Irace on 11/30/12.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (Undr)

/// http://underscorejs.org/#collections

- (void)each:(void(^)(id))block;

- (NSArray *)map:(id(^)(id))block;

- (id)reduce:(id(^)(id, id))block memo:(id)memo;

- (id)reduceRight:(id(^)(id, id))block memo:(id)memo;

- (id)find:(BOOL(^)(id))block;

- (NSArray *)filter:(BOOL(^)(id))block;

// TODO: `where`

// TODO: `findWhere`

- (NSArray *)reject:(BOOL(^)(id))block;

- (BOOL)every:(BOOL(^)(id))block;

- (BOOL)some:(BOOL(^)(id))block;

- (BOOL)contains:(id)value;

- (void)invoke:(NSString *)methodName;

- (NSArray *)pluck:(NSString *)propertyName;

- (NSNumber *)max:(NSNumber *(^)(id))block;

- (NSNumber *)min:(NSNumber *(^)(id))block;

// TODO: `sortBy`

// TODO: `groupBy`

// TODO: `countBy`

// TODO: `shuffle`

// TODO: `toArray`

// TODO: `size1`

/// http://underscorejs.org/#arrays

- (id)first;

- (id)first:(int)n;

- (id)last;

- (id)last:(int)n;

- (id)rest;

- (id)rest:(int)n;

// TODO: `compact`

// TODO: `flatten`

- (id)without:(id)value, ...;

@end
