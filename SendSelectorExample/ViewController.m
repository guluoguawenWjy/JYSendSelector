//
//  ViewController.m
//  SendSelectorExample
//
//  Created by 王金宇 on 2018/2/26.
//  Copyright © 2018年 王金宇. All rights reserved.
//

#import "ViewController.h"
#import "TestView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    TestView *view = [[TestView alloc] initWithFrame:CGRectMake(0, 0, screenSize.width, screenSize.height)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    

}
#pragma mark - testAction
-(void)testAction {
    NSLog(@"testAction");
}
-(void)testTap:(id)sender {
    NSLog(@"传过来的响应对象：%@",sender);
}
-(void)testTap:(NSString *)name isSuccess:(BOOL)isSuccess numb:(double)numb {
    NSLog(@"%@  %d %f",name,isSuccess,numb);
}

@end
