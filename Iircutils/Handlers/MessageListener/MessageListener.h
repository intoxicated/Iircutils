//
//  MessageListener.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "EventListener.h"

@interface MessageListener : EventListener

@end

@interface PrivateMessageListener : MessageListener

@end

@interface ChannelMessageListener : MessageListener

@end

@interface NoticeListener : MessageListener

@end

@interface PrivateNoticeListener : NoticeListener

@end

@interface ChannelNoticeListener : NoticeListener

@end
