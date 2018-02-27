//
//  UIControl+Helpers.m
//  sogousearch
//
//  Created by 王金宇 on 2018/2/26.
//  Copyright © 2018年 搜狗. All rights reserved.
//

#import "UIResponder+Helpers.h"
#import "VKMsgSend.h"

@implementation UIResponder(Helpers)
-(id)sendSelectorStr:(NSString *)selStr,... {
    SEL selector = NSSelectorFromString(selStr);
    UIResponder *next = self.nextResponder;
    while (next) {
        if ([next respondsToSelector:selector]) {
            NSError *err;
            va_list argList;
            va_start(argList, selStr);
            NSArray* boxingArguments = vk_targetBoxingArguments(argList, [next class], selector, &err);
            va_end(argList);
            NSAssert(err == nil, err.description);
            if (err != nil) {
                return nil;
            }
            return [next VKCallSelector:selector param:boxingArguments];
        }
        next = [next nextResponder];
    }
    NSString *description = [NSString stringWithFormat:@"%@方法没有响应",NSStringFromSelector(selector)];
    NSAssert(NO, description);
    return nil;
}
-(id)sendSelector:(SEL)selector, ... {
    UIResponder *next = self.nextResponder;
    while (next) {
        if ([next respondsToSelector:selector]) {
            NSError *err;
            va_list argList;
            va_start(argList, selector);
            NSArray* boxingArguments = vk_targetBoxingArguments(argList, [next class], selector, &err);
            va_end(argList);
            NSAssert(err == nil, err.description);
            if (err != nil) {
                return nil;
            }
            return [next VKCallSelector:selector param:boxingArguments];
        }
        next = [next nextResponder];
    }
    NSString *description = [NSString stringWithFormat:@"%@方法没有响应",NSStringFromSelector(selector)];
    NSAssert(NO, description);
    return nil;
}
- (BOOL)aapl_sendAction:(SEL)action
{
    // Get the target in the responder chain
    id sender = self;
    id target = sender;
    
    while (target && ![target canPerformAction:action withSender:sender]) {
        target = [target nextResponder];
    }
    
    if (!target)
        return NO;
    return [[UIApplication sharedApplication] sendAction:action to:target from:sender forEvent:nil];
}
-(BOOL)aapl_sendAction:(SEL)action withObject:(id)object {
    id sender = self;
    id target = sender;
    
    while (target && ![target canPerformAction:action withSender:sender]) {
        target = [target nextResponder];
    }
    
    if (!target)
        return NO;
    return [[UIApplication sharedApplication] sendAction:action to:target from:object forEvent:nil];
}
@end
