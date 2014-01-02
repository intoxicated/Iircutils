//
//  Connection.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

#import "Connection.h"
#import "AsyncSocket.h"
#import "GCDAsyncSocket.h"
#import "IRCData.h"

@interface Connection ()

@end

@implementation Connection
@synthesize auto_ping_respond = _auto_ping_respond;
@synthesize terminator = _terminator;
@synthesize asyncSock = _asyncSock;
@synthesize _hostname, _port;
@synthesize handleLinePtr = _handleLinePtr;
@synthesize delegate;

-(id)init:(BOOL)isIPv6 delegate:(id)del{
    //async connection to IRC server
    if (self = [super init])
    {
        if(del != nil)
            self.asyncSock = [[AsyncSocket alloc] initWithDelegate:del];
        else
            self.asyncSock = [[AsyncSocket alloc] initWithDelegate:self];

        self.auto_ping_respond = YES;
        self.terminator = [AsyncSocket CRLFData];
    }
    return self;
}

-(void)connect:(NSString *)hostname port:(NSInteger)port password:(NSString *)pw
{
    _hostname = hostname;
    _port = port;
    
    //use ssl?
    NSError * err;
    [self.asyncSock connectToHost:_hostname onPort:_port error:&err];
    
    if(![pw isEqualToString:@""])
        [self execute:@"PASS" param:[NSArray arrayWithObjects:pw, nil] kwargs:nil];
}

-(void)handle_line:(IRCData *)data
{
    [[self delegate] handle_lines:data];
    //[NSException raise:@"Not Implemented error" format:@"Must be overriden!"];
}

-(void)execute:(NSString *)command param:(NSArray *)params kwargs:(NSString *)args
{
    NSMutableArray * rawArgs = [[NSMutableArray alloc] initWithArray:params];
    NSMutableString * raw = [[NSMutableString alloc] init];
    if(args != nil)
    {
        [rawArgs addObject:[[args componentsSeparatedByString:@"tailing"] objectAtIndex:1]];
    }
    
    [raw appendFormat:@"%@ %@\r\n", [command uppercaseString],[rawArgs componentsJoinedByString:@" "]];
    
    NSData *data = [raw dataUsingEncoding:NSUTF8StringEncoding];

    [self.asyncSock writeData:data withTimeout:-1 tag:1];
}

-(void)start_all
{
    //start multiple bots in same loop TBI
}

-(void)disconnect
{
    [self.asyncSock disconnect];
    
}

#pragma mark - async socket delegate

- (void)onSocket:(AsyncSocket *)sock didWriteDataWithTag:(long)tag
{
	//if(tag == ECHO_MSG)
	//{
		//[sock readDataToData:[AsyncSocket CRLFData] withTimeout:READ_TIMEOUT tag:0];
	//}
}

- (void)onSocket:(AsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag
{
	NSData *strData = [data subdataWithRange:NSMakeRange(0, [data length] - 2)];
	NSString *msg = [[NSString alloc] initWithData:strData encoding:NSUTF8StringEncoding];
	if(msg)
	{
		NSLog(@"Message has been read: %@\n", msg);
	}
	else
	{
		NSLog(@"Error converting received data into UTF-8 String");
	}
	
    IRCData * line_data = [Protocol parse_line:msg];
    
    //after read has done make a decision what to do
    
    //normal msg print it out to output
    //other actions may be ignored
    //[self handle_line:<#(IRCData *)#>]
    [[self delegate] handle_lines:line_data];
    //[self performSelector:self.handleLinePtr.pointerValue withObject:IRCData*];
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSLog(@"Connect to the server - %@:%hu", host, port);
	
    //now waiting for server respond
    [sock readDataToData:self.terminator withTimeout:-1 tag:0];
}

@end
