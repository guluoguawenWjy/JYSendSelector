//
//  NSObject+idSelectorCall.h
//  IdSelectorCall
//
//  Created by Awhisper on 15/12/25.
//  Copyright © 2015年 Awhisper. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NSArray *vk_targetBoxingArguments(va_list argList, Class cls, SEL selector, NSError *__autoreleasing *error);

@interface UIResponder (VKMsgSend)

- (id)VKCallSelector:(SEL)selector param:(NSArray *)paramArr;

@end

