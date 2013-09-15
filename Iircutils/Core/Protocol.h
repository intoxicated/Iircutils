//
//  Protocol.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//  Protocol class methods for useful irc communication

#import <Foundation/Foundation.h>

@class IRCData;

@interface Protocol : NSObject

/**
 *
 */
+(NSString *)strip_name_symbol:(NSString *)nickname;

/**
 *
 */
+(NSArray *)parse_mode:(NSString *)mode_data;

/**
 *
 */
+(IRCData *)parse_line:(NSString *)data;

/**
 *
 */
+(NSArray *)parse_prefix:(IRCData *)data;

/**
 *
 */
+(BOOL)is_valid_nick:(NSString *)nick;

/**
 *
 */
+(NSString *)filtered_nick:(NSString *)nick;

/**
 *
 */
+(BOOL)is_valid_channel:(NSString *)channel;

/**
 *
 */
//+(NSString *)ip_to_string:(

/**
 *
 */

@end
