//
//  NSArray+Undr.h
//  Undr
//
//  Created by Bryan Irace on 11/30/12.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (Undr)

- (void)each:(void(^)(id))block;

- (NSArray *)map:(id(^)(id))block;

- (id)reduce:(id(^)(id, id))block memo:(id)memo;

- (id)reduceRight:(id(^)(id, id))block memo:(id)memo;

- (id)find:(BOOL(^)(id))block;

- (NSArray *)filter:(BOOL(^)(id))block;

@end
