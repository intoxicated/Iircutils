//
//  EventObject.m
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Event.h"

@implementation Event

-(id)init:(IRCData *)data
{
    [NSException raise:@"Not Implemented error" format:@"Must be overriden!"];
    return self;
}

-(id)initWith:(NSString *)command prefix:(NSString *)prefix params:(NSArray *)params
{
    [NSException raise:@"Not Implemented error" format:@"Must be overriden!"];
    return self;
}

@end

@implementation StandardEvent

-(id)init:(IRCData *)data
{
    if(self = [super init])
    {
        
    }
    return self;
}

-(id)initWith:(NSString *)command prefix:(NSString *)prefix params:(NSArray *)params
{
    if(self = [super init])
    {
        
    }
    return self;
}

@end

@implementation MessageEvent

-(id)init:(IRCData *)data
{
    if(self = [super init])
    {
        
    }
    return self;
}

-(id)initWith:(NSString *)command prefix:(NSString *)prefix params:(NSArray *)params
{
    if(self = [super init])
    {
        
    }
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
