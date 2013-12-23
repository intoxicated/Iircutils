//
//  Connection.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CFNetwork/CFNetwork.h>

#import "Protocol.h"
#import "Response.h"

@class AsyncSocket;

@protocol IRCConnectionDelegate <NSObject>

@end

@interface Connection : NSObject
@property (assign, nonatomic) BOOL auto_ping_respond;
@property (strong, nonatomic) NSString * terminator;
@property (strong, nonatomic) NSOutputStream *incomingData;

@property (strong, nonatomic) AsyncSocket * asyncSock;
@end
