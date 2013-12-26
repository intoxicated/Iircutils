//
//  EventObject.m
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "EventObject.h"

@implementation EventObject
@end

@implementation Event
@end

@implementation StandardEvent

-(id)init:(IRCData *)data
{
    return self;
}

@end

@implementation MessageEvent

-(id)init:(IRCData *)data
{
    return self;
}

@end

@interface CTCPEvent()
@end

@implementation CTCPEvent

-(id)init
{
    return self;
}

@end
