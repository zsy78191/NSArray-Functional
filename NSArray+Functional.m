//
//  NSArray+Map.m
//  Reader
//
//  Created by 张超 on 16/6/23.
//  Copyright © 2016年 orzer. All rights reserved.
//

#import "NSArray+Functional.h"

@implementation NSArray (Functional) 

- (NSInteger)lenght
{
    return self.count;
}

- (NSArray*)reverse
{
    return [[self reverseObjectEnumerator] allObjects];
}

- (NSArray* (^)(id (^handle)(id)))map
{
    return ^(id (^handle)(id)) {
        return [self map:handle];
    };
}

- (NSString *(^)(NSString * j))join
{
    return ^ (NSString* j) {
        return [self componentsJoinedByString:j];
    };
}

- (void (^)(void (^)(id)))each
{
    return ^ (void (^ bb)(id)){
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            bb(obj);
        }];
    };
}

- (void (^)(void (^)(id, NSUInteger)))each_index
{
    return ^ (void (^ bb)(id,NSUInteger)){
        [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            bb(obj,idx);
        }];
    };
}

- (NSArray*)map:(id (^)(id))map
{
    NSMutableArray* array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        id x = map(obj);
        if(x) [array addObject:x];
    }];
    return [array copy];
}


- (NSArray* (^)(BOOL (^)(id)))filter
{
    return ^ (BOOL (^bb)(id x)) {
        return [self filter:bb];
    };
}

- (NSArray*)filter:(BOOL (^)(id))filter
{
    NSMutableArray* array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (filter(obj)) {
            [array addObject:obj];
        }
    }];
    return [array copy];
}

- (NSArray*)flatten
{
    NSMutableArray* array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [array addObjectsFromArray:[(NSArray*)obj flatten]];
        }
        else
        {
            [array addObject:obj];
        }
    }];
    return [array copy];
}

- (NSArray* (^)(id))ignore
{
    return ^ (id x) {
        return [self ignore:x];
    };
}

- (NSArray*)ignore:(id)value
{
    NSMutableArray* array = [NSMutableArray array];
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj != value && ![obj isEqual:value]) {
            [array addObject:obj];
        }
    }];
    return [array copy];
}

- (NSArray* (^)(NSUInteger))skip
{
    return ^ (NSUInteger count){
        return [self skip:count];
    };
}

- (NSArray*)skip:(NSUInteger)skipCount
{
    if (skipCount >= self.count) {
        return self;
    }
    return [self subarrayWithRange:NSMakeRange(skipCount, self.count - skipCount)];
}

- (NSArray* (^)(NSUInteger))take
{
    return ^ (NSUInteger count) {
        return [self take:count];
    };
}

- (NSArray*)take:(NSUInteger)count
{
    if (count >= self.count) {
        return self;
    }
    return [self subarrayWithRange:NSMakeRange(0, count)];
}

- (NSMutableArray *)m
{
    return [self mutableCopy];
}

- (NSArray *(^)(id))push
{
    return ^ (id x) {
        return [self arrayByAddingObject:x];
    };
}

- (NSArray *)push:(id)x
{
    return [self arrayByAddingObject:x];
}

- (id)pop
{
    if (self.count) {
        return [self objectAtIndex:self.count-1];
    }
    return nil;
}

- (NSArray *(^)(id, NSUInteger))insert
{
    return ^ (id x, NSUInteger idx) {
        NSMutableArray* m = self.m;
        m.insert(x,idx);
        return m.c;
    };
}

- (NSArray *(^)(id))remove
{
    return ^ (id x) {
        return [self ignore:x];
    };
}

- (NSArray *(^)(NSUInteger))removeAt
{
    return ^ (NSUInteger idx) {
        NSMutableArray* m = self.m;
        m.removeAt(idx);
        return m.c;
    };
}

@end

@implementation NSMutableArray (Functional)

- (void (^)(id))push
{
    return ^ (id x) {
        [self push:x];
    };
}


- (void)push:(id)x
{
    [self addObject:x];
}

- (id (^)(void))pop
{
    return ^ {
        id x = [self lastObject];
        if (self.count) {
            [self removeObjectAtIndex:self.count - 1];
        }
        return x;
    };
}


- (void (^)(id, NSUInteger))insert
{
    return ^ (id x, NSUInteger idx) {
        if(idx > self.count-1) {
            [self addObject:x];
        }
        else [self insertObject:x atIndex:idx];
    };
}

- (void (^)(id))remove
{
    return ^ (id x) {
        [self removeObject:x];
    };
}


- (void (^)(NSUInteger))removeAt
{
    return ^ (NSUInteger idx) {
        [self removeObjectAtIndex:idx];
    };
}

- (void (^)(void))reverse
{
    return ^ {
        NSUInteger count = self.count;
        int mid = floor(count / 2.0);
        for (NSUInteger i = 0; i < mid; i++) {
            [self exchangeObjectAtIndex:i withObjectAtIndex:(count - (i + 1))];
        }
    };
}
 
- (NSArray *)c
{
    return self.copy;
}

@end
