//
//  TestView.m
//  SendSelectorExample
//
//  Created by 王金宇 on 2018/2/26.
//  Copyright © 2018年 王金宇. All rights reserved.
//

#import "TestView.h"
#import "UIResponder+Helpers.h"
#import "TestView1.h"

@interface NSObject ()
-(void)testAction;
-(void)testTap:(id)sender;
-(void)testTap:(NSString *)name isSuccess:(BOOL)isSuccess numb:(double)numb;
@end



@implementation TestView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize screenSize = [UIScreen mainScreen].bounds.size;
        TestView1 *subView = [[TestView1 alloc] initWithFrame:CGRectMake(0, screenSize.height - 300, screenSize.width, 300)];
        subView.backgroundColor = [UIColor cyanColor];
        [self addSubview:subView];
        ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 30, 100, 30)];
            [btn setTitle:@"testAction" forState:(UIControlStateNormal)];
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(click1) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        });
        ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(130, 30, 100, 30)];
            [btn setTitle:@"testTap:" forState:(UIControlStateNormal)];
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(click2) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        });
        ({
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(10, 130, 280, 30)];
            [btn setTitle:@"testTap:isSuccess:numb:" forState:(UIControlStateNormal)];
            btn.backgroundColor = [UIColor redColor];
            [btn addTarget:self action:@selector(click3) forControlEvents:(UIControlEventTouchUpInside)];
            [self addSubview:btn];
        });
        
        
      
    }
    return self;
}
#pragma mark - action
-(void)click1 {
    [self aapl_sendAction:@selector(testAction)];
}
-(void)click2 {
    [self aapl_sendAction:@selector(testTap:)];
}
-(void)click3 {
    [self sendSelector:@selector(testTap:isSuccess:numb:),@"zhangsan",YES,(double)10.3];
}
@end
