//
//  Protocol.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Protocol.h"

@implementation Protocol

/**
 *
 */
+(NSString *)strip_name_symbol:(NSString *)nickname
{
    return nil;
}

/**
 *
 */
+(NSArray *)parse_mode:(NSString *)mode_data
{
    return nil;
}

/**
 *
 */
+(IRCData *)parse_line:(NSString *)data
{
    return nil;
}

/**
 *
 */
+(NSArray *)parse_prefix:(IRCData *)data
{
    return nil;
}

/**
 *
 */
+(BOOL)is_valid_channel:(NSString *)channel
{
    return NO;
}

/**
 *
 */
+(BOOL)is_valid_nick:(NSString *)nick
{
    return NO;
}

/**
 *
 */
+(NSString *)filtered_nick:(NSString *)nick
{
    return nil;
}



@end
