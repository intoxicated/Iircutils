//
//  IRCData.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "IRCData.h"
#import "Protocol.h"

@implementation IRCData
@synthesize command = _command;
@synthesize prefix = _prefix;
@synthesize params = _params;

- (IRCData *)init
{
    if(self = [super init])
    {
        
    }
    return self;
}

/**
 *
 */
- (NSString *)nickname
{
    return nil;
}

/**
 *
 */
- (NSString *)username
{
    return nil;
}

/**
 *
 */
- (NSString *)hostname
{
    return nil;
}

@end
