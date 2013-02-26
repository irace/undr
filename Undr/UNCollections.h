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

NSArray *reject(NSArray *, BOOL(^block)(id));

BOOL *every(NSArray *, BOOL(^block)(id));

BOOL *some(NSArray *, BOOL(^block)(id));

/// http://underscorejs.org/#arrays
