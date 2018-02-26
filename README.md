# JYSendSelector
引用了VKMsgSend的开源代码和苹果推荐的响应者链事件传递。
无需用delegate就实现事件的传递，支持跨级传递。
//无参数类型的传递
[self aapl_sendAction:@selector(testAction)];
//有参数类型，包括基本类型的
[self sendSelector:@selector(testTap:isSuccess:numb:),@"lisi",NO,(double)3];
