//
//  Connection.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Connection.h"
#import "AsyncSocket.h"
#import "GCDAsyncSocket.h"

@implementation Connection
@synthesize auto_ping_respond = _auto_ping_respond;
@synthesize terminator = _terminator;
@synthesize incomingData = _incomingData;

-(void)init:(BOOL)isIPv6{
    //async connection to IRC server
    self.auto_ping_respond = YES;
    self.terminator = @"\r\n";
}

@end
