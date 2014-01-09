//
//  Ctcp.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "CTCP.h"
@interface CTCP ()

@end

//CTCP related
#define X_DELIM '\x01'
#define M_QUOTE '\x10'
//#define M_QUOTE "\x10"
#define X_QUOTE @"\\"

static const char * commands[] = { "ACTION", "VERSION", "USERINFO",
            "CLIENTINFO", "ERRMSG", "PING", "TIME", "FINGER" };

static const char * _ctcp_one [] = {"\\", "\\\\"};
static const char * _ctcp_two [] = {"\x01", "\\a"};
static const char ** _ctcp_level_quote_map[] = { _ctcp_one, _ctcp_two};

static const char * _low_level_one[] = { "\x10", "\x10\x10" };
static const char * _low_level_two[] = { "\x00", "\x100" };
static const char * _low_level_three[] = { "\n", "\x10n" };
static const char * _low_level_four[] = { "\r", "\x10r" };
static const char ** _low_level_quote_map[] = {_low_level_one, _low_level_two, _low_level_three, _low_level_four};

@implementation CTCP

+ (NSString *)tag:(NSString *)message
{
    return [NSString stringWithFormat:@"%c%@%c", X_DELIM, message, X_DELIM];
}

+ (NSString *)low_level_qoute:(NSString *)text
{
    NSString * search, * replace;
    
    for (int i = 0; i < 4; ++i)
    {
        search = [NSString stringWithUTF8String:_low_level_quote_map[i][0]];
        replace = [NSString stringWithUTF8String:_low_level_quote_map[i][1]];
        text = [text stringByReplacingOccurrencesOfString:search withString:replace];
    }
    return text;
}

+ (NSString *)low_level_deqoute:(NSString *)text
{
    NSString * search, * replace;
    
    for (int i = 0; i < 4; ++i)
    {
        search = [NSString stringWithUTF8String:_low_level_quote_map[i][1]];
        replace = [NSString stringWithUTF8String:_low_level_quote_map[i][0]];
        text = [text stringByReplacingOccurrencesOfString:search withString:replace];
    }
    return text;
}

+ (NSString *)qoute:(NSString *)text
{
    NSString * search, * replace;
    
    for (int i = 0; i < 2; ++i)
    {
        search = [NSString stringWithUTF8String:_ctcp_level_quote_map[i][0]];
        replace = [NSString stringWithUTF8String:_ctcp_level_quote_map[i][1]];
        text = [text stringByReplacingOccurrencesOfString:search withString:replace];
    }
    return text;
}

+ (NSString *)dequote:(NSString *)text
{
    NSString * search, * replace;
    
    for (int i = 0; i < 2; ++i)
    {
        search = [NSString stringWithUTF8String:_ctcp_level_quote_map[i][1]];
        replace = [NSString stringWithUTF8String:_ctcp_level_quote_map[i][0]];
        text = [text stringByReplacingOccurrencesOfString:search withString:replace];
    }
    return text;
}

+ (NSArray *)extract:(NSString *)message
{
    NSMutableArray * stripped_message = [[NSMutableArray alloc] init];
    NSMutableArray * ctcp_requests =  [[NSMutableArray alloc] init];
    BOOL in_tag = NO;
    NSInteger index = 0;
    while(index < message.length)
    {
        if(in_tag)
        {
            NSMutableArray * ctcp_request = [[NSMutableArray alloc] init];
            while(index < message.length && [message characterAtIndex:index] != X_DELIM)
            {
                [ctcp_request addObject:[NSString stringWithFormat:@"%c",[message characterAtIndex:index]]];
                index += 1;
            }
            [ctcp_requests addObject:[self parse_request:[ctcp_request componentsJoinedByString:@""]]];
            in_tag = NO;
        }
        else
        {
            while(index < message.length && [message characterAtIndex:index] != X_DELIM)
            {
                [stripped_message addObject:[NSString stringWithFormat:@"%c",[message characterAtIndex:index]]];
                index += 1;
            }
            in_tag = YES;
        }
        index += 1;
    }
    
    return @[[stripped_message componentsJoinedByString:@""], ctcp_requests];
}

+ (NSArray *)parse_request:(NSString *)section
{
    NSString * command;
    NSArray * params;
    
    NSRange range;
    
    NSArray * sections = [section componentsSeparatedByString:@" "];
    if (sections.count > 1)
    {
        range = NSMakeRange(1, sections.count-1);
        command = sections[0];
        params = [sections subarrayWithRange:range];
    }
    else
    {
        command = sections[0];
        params = nil;
    }
    return @[command, params];
}

@end
