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

@interface Connection : NSObject
@property (assign, nonatomic) BOOL auto_ping_respond;
@property (strong, nonatomic) NSData * terminator;
@property (strong, nonatomic) AsyncSocket * asyncSock;

@property (nonatomic, strong) NSString * _hostname;
@property (nonatomic, assign) NSInteger _port;

@property (nonatomic, strong) NSValue * handleLinePtr;

-(id)init:(BOOL)isIPv6 delegate:(id)del;
-(void)connect:(NSString *)hostname port:(NSInteger)port password:(NSString *)pw;
-(void)execute:(NSString *)command param:(NSArray *)params kwargs:(NSString *)args;
-(void)disconnect;
-(void)handle_line:(IRCData *)data;

@end
