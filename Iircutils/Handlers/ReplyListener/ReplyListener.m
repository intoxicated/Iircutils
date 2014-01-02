//
//  ReplyListener.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "ReplyListener.h"
#import "Event.h"



@implementation NameReplyEvent
@synthesize channel_name, name_list;

-(id)init{
    if(self = [super init])
    {
        self.channel_name = nil;
        self.name_list = [[NSMutableArray alloc] init];
    }
    return self;
}

@end

@implementation ReplyListener

@end

@implementation NameReplyListener
@synthesize nameEvent;

@end

@implementation ListReplyListener

@end