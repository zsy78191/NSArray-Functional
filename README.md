# NSArray-Functional
Let us write objc code just like ruby.

```mm
NSArray* testArray = @[@1,@2,@3,@4,@5];
NSLog(@"Origin %@",testArray.join(@","));
```

> Origin 1,2,3,4,5

```mm
NSString* mapString = testArray.map(^id(id x) {
return @([x integerValue] * 3);
}).join(@",");

NSLog(@"Map-> %@",mapString);
```

> Map-> 3,6,9,12,15

```mm
NSString* filterString = testArray.filter(^BOOL(id x) {
return [x integerValue] %2 == 0;
}).join(@",");

NSLog(@"Filter-> %@",filterString);
```

> Filter-> 2,4

```mm
NSString* text = @"Let us write objc code just like ruby.";

NSLog(@"%@",text.split(@" ").reverse.join(@" "));
```

> ruby. like just code objc write us Let
