//
//  NSArray+Map.h
//  Reader
//
//  Created by 张超 on 16/6/23.
//  Copyright © 2016年 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Functional)
{
    
}

@property (readonly) NSString* (^join)(NSString*);
- (NSString* (^)(NSString*))join;

@property (readonly) void (^each)(void (^)(id x));
- (void (^)(void (^)(id x)))each;

@property (readonly) void (^each_index)(void (^)(id x, NSUInteger idx));
- (void (^)(void (^)(id x, NSUInteger idx)))each_index;

- (NSArray*)reverse;
- (NSInteger)lenght;

@property (readonly) NSArray* (^map)(id (^)(id x));
- (NSArray* (^)(id (^)(id x)))map;
- (NSArray*)map:(id (^)(id x))map;

@property (readonly) NSArray* (^filter)(BOOL (^)(id x));
- (NSArray* (^)(BOOL (^)(id x)))filter;
- (NSArray*)filter:(BOOL (^)(id x))filter;

- (NSArray*)flatten:(NSUInteger)level;

@property (readonly) NSArray* (^ignore)(id x);
- (NSArray* (^)(id x))ignore;
- (NSArray*)ignore:(id)value;

@property (readonly) NSArray* (^skip)(NSUInteger x);
- (NSArray* (^)(NSUInteger x))skip;
- (NSArray*)skip:(NSUInteger)skipCount;

@property (readonly) NSArray* (^take)(NSUInteger x);
- (NSArray* (^)(NSUInteger x))take;
- (NSArray*)take:(NSUInteger)count;

@property (readonly) NSArray* (^push)(id);
- (NSArray* (^)(id))push;
- (NSArray*)push:(id)x;

- (id)pop;

@property (readonly) NSArray* (^insert)(id,NSUInteger);
- (NSArray* (^)(id,NSUInteger))insert;

@property (readonly) NSArray* (^remove)(id);
- (NSArray* (^)(id))remove;

@property (readonly) NSArray* (^removeAt)(NSUInteger);
- (NSArray* (^)(NSUInteger))removeAt;

- (NSMutableArray*)m;

@end

@interface NSMutableArray (Functional)

@property (readonly) void (^push)(id);
- (void (^)(id))push;
- (void)push:(id)x;

@property (readonly) id (^pop)(void);
@property (readonly) void (^reverse)(void);

@property (readonly) void (^insert)(id,NSUInteger);
- (void (^)(id,NSUInteger))insert;

@property (readonly) void (^remove)(id);
- (void (^)(id))remove;

@property (readonly) void (^removeAt)(NSUInteger);
- (void (^)(NSUInteger))removeAt;

- (NSArray*)c;

@end
