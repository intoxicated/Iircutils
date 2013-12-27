//
//  CTCPListener.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "CTCPListener.h"
#import "Event.h"

@implementation CTCPListener
-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}
@end

@implementation CTCPActionListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_ACTION"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPUserInfoListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_USERINFO"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPClientListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_CLIENTINFO"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPVersionListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_VERSION"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPPingListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_PING"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPErrorListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_ERROR"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation CTCPTimeListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_TIME"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation DCCListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if([event.command hasPrefix:@"CTCP_DCC"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end










