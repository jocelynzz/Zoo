//
//  NSMutableArray+Shuffle.m
//  It's A Zoo
//
//  Created by Jocelyn on 1/17/15.
//  Copyright (c) 2015 Jocelyn. All rights reserved.
//

#import "NSMutableArray+Shuffle.h"


@implementation NSMutableArray (Shuffle)
- (NSMutableArray*)shuffle
{
    // create temporary mutable array
    NSMutableArray *tmpArray = [NSMutableArray arrayWithCapacity:[self count]];
    for (id anObject in self) {
        NSUInteger randomPos = arc4random()%([tmpArray count]+1);
        [tmpArray insertObject:anObject atIndex:randomPos];
    }
    return [NSMutableArray arrayWithArray:tmpArray];  // non-mutable autoreleased copy
}

@end
