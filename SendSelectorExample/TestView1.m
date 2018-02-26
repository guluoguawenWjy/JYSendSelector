//
//  TestView1.m
//  SendSelectorExample
//
//  Created by 王金宇 on 2018/2/26.
//  Copyright © 2018年 王金宇. All rights reserved.
//

#import "TestView1.h"
#import "UIResponder+Helpers.h"

@interface NSObject ()
-(void)testTap:(NSString *)name isSuccess:(BOOL)isSuccess numb:(double)numb;
@end

@implementation TestView1

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 280, 30)];
            [btn setTitle:@"testTap:isSuccess:numb:" forState:(UIControlStateNormal)];
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(click) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        });
    }
    return self;
}
//跨级上传
-(void)click {
    [self sendSelector:@selector(testTap:isSuccess:numb:),@"lisi",NO,(double)3];
}
@end
