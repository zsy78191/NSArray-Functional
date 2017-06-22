//
//  ViewController.m
//  Demo
//
//  Created by 张超 on 2017/6/22.
//  Copyright © 2017年 orzer. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Functional.h"
#import "NSString+Functional.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray* testArray = @[@1,@2,@3,@4,@5];
    NSLog(@"Origin %@",testArray.join(@","));
    
    NSLog(@"## [Test]");
    
    NSString* mapString = testArray.map(^id(id x) {
        return @([x integerValue] * 3);
    }).join(@",");
    
    NSLog(@"Map-> %@",mapString);
    
    NSString* filterString = testArray.filter(^BOOL(id x) {
        return [x integerValue] %2 == 0;
    }).join(@",");
    
    NSLog(@"Filter-> %@",filterString);
    
    NSString* text = @"Let us write objc code just like ruby.";
    
    NSLog(@"%@",text.split(@" ").reverse.join(@" "));
    
    NSLog(@"## [End]");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
