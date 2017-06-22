//
//  NSString+Functional.m
//  NewFrame
//
//  Created by 张超 on 2017/6/21.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "NSString+Functional.h"

@implementation NSString (Functional)

@dynamic to_f,to_i,split;

- (NSInteger (^)(void))to_i
{
    return ^ {
        return [self integerValue];
    };
}

- (float (^)(void))to_f
{
    return ^ {
        return [self floatValue];
    };
}

-(NSArray* (^)(NSString *))split
{
    return ^ (NSString* s) {
        return [self componentsSeparatedByString:s];
    };
}

@end
