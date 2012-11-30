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

@end
