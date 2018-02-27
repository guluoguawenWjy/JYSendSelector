//
//  UIControl+Helpers.h
//  sogousearch
//
//  Created by 王金宇 on 2018/2/26.
//  Copyright © 2018年 搜狗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIResponder (Helpers)
//含有基本类型的传参,基本类型传参最好用类型强转标明，避免可变参数传参出现错误
-(id)sendSelectorStr:(NSString *)selStr,...;
-(id)sendSelector:(SEL)selector, ...;

//苹果demo里推荐的响应方式，支持以下类型
/*
 - (void)action
 - (void)action:(id)sender
 - (void)action:(id)sender forEvent:(UIEvent *)event
 */
- (BOOL)aapl_sendAction:(SEL)action;
-(BOOL)aapl_sendAction:(SEL)action withObject:(id)object;
@end
