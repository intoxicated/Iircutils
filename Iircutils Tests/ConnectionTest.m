//
//  ConnectionTest.m
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Connection.h"
#import "AsyncSocket.h"

@interface ConnectionTest : XCTestCase
@property (nonatomic, strong) Connection * con;
@property (nonatomic, assign) BOOL testFinish;
@end

@implementation ConnectionTest
@synthesize con;
@synthesize testFinish;

- (void)setUp
{
    [super setUp];
    con = [[Connection alloc] init:NO delegate:self];
    testFinish = NO;
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    [con disconnect];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnection
{
    NSRunLoop *rl = [NSRunLoop currentRunLoop];
    [con connect:@"localhost" port:8888 password:nil];
    while(!testFinish && [rl runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]);
}

- (void)onSocket:(AsyncSocket *)sock didConnectToHost:(NSString *)host port:(UInt16)port
{
	NSLog(@"didConnect! %@:%hu", host, port);
	
	NSString *welcomeMsg = @"Welcome to the AsyncSocket Echo Server\r\n";
	NSData *welcomeData = [welcomeMsg dataUsingEncoding:NSUTF8StringEncoding];
	
	[sock writeData:welcomeData withTimeout:-1 tag:0];
	[sock readDataToData:[AsyncSocket CRLFData] withTimeout:-1 tag:0];
    testFinish = YES;
}
@end
