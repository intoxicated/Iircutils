//
//  ProtocolUnittest.m
//  Iircutils
//
//  Created by Realfree on 9/17/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
/*
#import "Protocol.h"
#import <SenTestingKit/SenTestingKit.h>

@interface ProtocolUnittest : SenTestCase

@end


@implementation ProtocolUnittest

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testValidStripNickname
{
    NSString * strip = [Protocol strip_name_symbol:@"%op_user"];
    STAssertEqualObjects(strip, @"op_user", @"Return wrong value: %@", strip);
    
    strip = [Protocol strip_name_symbol:@"+normal_user"];
    STAssertEqualObjects(strip, @"normal_user", @"Return wrong value: %@", strip);
}

- (void)testInvalidStripNickname
{
    NSString * strip = [Protocol strip_name_symbol:@"non_prefix"];
    STAssertNil(strip, @"Non prefix nick should return nil: %@", strip);
    
    strip = [Protocol strip_name_symbol:@"^invalid_prefix"];
    STAssertNil(strip, @"Invalid prefix with nick should return nil: %@", strip);
}

- (void)testEmptyStrings
{
    STAssertThrows([Protocol strip_name_symbol:@""],
                   @"empty string should throw exception");

    STAssertThrows([Protocol strip_name_symbol:nil],
                @"nil should throw exception");
}

@end
 */
