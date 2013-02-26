//
//  UNCollections.h
//  Undr
//
//  Created by Bryan Irace on 2/25/13.
//

#define OVERLOADABLE __attribute__((overloadable))

OVERLOADABLE void each(NSArray *, void((^block)(id)));
OVERLOADABLE void each(NSArray *, void((^block)(id, NSUInteger)));

NSArray *map(NSArray *, id((^block)(id)));

id reduce(NSArray *, id((^block)(id, id)), id memo);

id reduceRight(NSArray *, id((^block)(id, id)), id memo);

id find(NSArray *, BOOL(^block)(id));
