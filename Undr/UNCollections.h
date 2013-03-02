//
//  UNCollections.h
//  Undr
//
//  Created by Bryan Irace on 2/25/13.
//

#define OVERLOADABLE __attribute__((overloadable))

/// http://underscorejs.org/#collections

OVERLOADABLE void each(NSArray *, void((^block)(id)));

OVERLOADABLE void each(NSArray *, void((^block)(id, NSUInteger)));

NSArray *map(NSArray *, id((^block)(id)));

id reduce(NSArray *, id((^block)(id, id)), id memo);

id reduceRight(NSArray *, id((^block)(id, id)), id memo);

id find(NSArray *, BOOL(^block)(id));

NSArray *filter(NSArray *, BOOL(^block)(id));

// TODO: `where`

// TODO: `findWhere`

NSArray *reject(NSArray *, BOOL(^block)(id));

BOOL *every(NSArray *, BOOL(^block)(id));

BOOL *some(NSArray *, BOOL(^block)(id));

BOOL contains(NSArray *, id value);

void invoke(NSArray *, NSString *methodName);

NSArray *pluck(NSArray *, NSString *propertyName);

NSNumber *max(NSArray *, NSNumber *(^block)(id));

NSNumber *min(NSArray *, NSNumber *(^block)(id));

// TODO: `sortBy`

// TODO: `groupBy`

// TODO: `countBy`

// TODO: `shuffle`

// TODO: `toArray`

// TODO: `size1`

/// http://underscorejs.org/#arrays

OVERLOADABLE id first(NSArray *array);

OVERLOADABLE id first(NSArray *array, int n);

OVERLOADABLE id last(NSArray *array);

OVERLOADABLE id last(NSArray *array, int n);

OVERLOADABLE id rest(NSArray *array);

OVERLOADABLE id rest(NSArray *array, int n);

// TODO: `compact`

// TODO: `flatten`

id without(NSArray *array, ...);