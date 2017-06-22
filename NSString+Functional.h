//
//  NSString+Functional.h
//  NewFrame
//
//  Created by 张超 on 2017/6/21.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Functional)

@property (nonatomic, strong, readonly) NSInteger (^to_i)(void);
@property (nonatomic, strong, readonly) float (^to_f)(void);
@property (nonatomic, strong, readonly) NSArray* (^split)(NSString* s);

@end
