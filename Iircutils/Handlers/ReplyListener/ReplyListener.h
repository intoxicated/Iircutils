//
//  ReplyListener.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "EventListener.h"
#import "Event.h"

@class NameReplyEvent;

@interface ReplyListener : EventListener

@end

@interface NameReplyListener : ReplyListener
@property (strong, nonatomic) NameReplyEvent * nameEvent;
@end

@interface NameReplyEvent : Event
@property (nonatomic, strong) NSString * channel_name;
@property (nonatomic, strong) NSMutableArray * name_list;

-(id)init;
@end

@interface ListReplyListener : ReplyListener

@end
