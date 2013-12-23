//
//  MessageListener.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "MessageListener.h"
#import "EventObject.h"
#import "Protocol.h"

@implementation MessageListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"PRIVMSG"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation PrivateMessageListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    StandardEvent * e = (StandardEvent *)event;
    if ([event.command isEqualToString:@"PRIVMSG"] &&
        ![Protocol is_valid_channel:e.target])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation ChannelMessageListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    StandardEvent * e = (StandardEvent *)event;
    if ([event.command isEqualToString:@"NOTICE"] &&
        [Protocol is_valid_channel:e.target])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation NoticeListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"NOTICE"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation PrivateNoticeListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    StandardEvent * e = (StandardEvent *)event;
    if ([event.command isEqualToString:@"NOTICE"] &&
        ![Protocol is_valid_channel:e.target])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation ChannelNoticeListener

-(void)notify:(ITX_Client *)client event:(Event *)event
{
    StandardEvent * e = (StandardEvent *)event;
    if ([event.command isEqualToString:@"NOTICE"] &&
        [Protocol is_valid_channel:e.command])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end
















