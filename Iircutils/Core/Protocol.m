//
//  Protocol.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Protocol.h"
#import "IRCData.h"

@implementation Protocol

/**
 * Remove the name symbols from the nick name
 * ex) [Protocol strip_name_symbol:@"@opped_usr"];
 *      --> opped_usr
 *
 *     [Protocol strip_name_symbol:@"eopped_usr"];
 *      --> nil
 * @param string nickname
 * @return stripped nickname, if none-symbole nil
 */
+(NSString *)strip_name_symbol:(NSString *)nickname
{
    if(nickname == nil || [nickname isEqualToString:@""])
        [NSException raise:@"critical invalid value for nick"
                    format:@"%input is invalid"];
    
    NSMutableDictionary * name_symbols =
        [[NSMutableDictionary alloc] init];
    [name_symbols setObject:@"voice" forKey:@"+"];
    [name_symbols setObject:@"halfop" forKey:@"%"];
    [name_symbols setObject:@"op" forKey:@"@"];
    [name_symbols setObject:@"protectedop" forKey:@"&"];
    [name_symbols setObject:@"owner" forKey:@"~"];
    
    NSString * sym = [nickname substringWithRange:NSMakeRange(0, 1)];
    
    if([name_symbols objectForKey:sym] != nil)
        return [nickname substringWithRange:NSMakeRange(1, [nickname length]-1)];
    return nil;
}

/**
 * Parse out mode into array
 * @param mode_data irc mode data
 * @return array of two element, add and remove
 */
+(NSArray *)parse_mode:(NSString *)mode_data
{
    //This only works if +- is in order
    //[NSArray arrayWithArray:
    //[mode_data componentsSeparatedByCharactersInSet:
    // [NSCharacterSet characterSetWithCharactersInString:@"+-"]]];
    
    NSMutableString * add = [[NSMutableString alloc] initWithString:@""];
    NSMutableString * remove = [[NSMutableString alloc] initWithString:@""];
    
    unichar directive = '+';
    
    //This guarantees +- order doesn't matter
    for(int i = 0; i < [mode_data length]; ++i)
    {
        NSString *ichar  =
            [NSString stringWithFormat:@"%c", [mode_data characterAtIndex:i]];
        if([ichar isEqualToString:@"+"]||
           [ichar isEqualToString:@"-"])
            directive = [mode_data characterAtIndex:i];
        else if(directive == '-')
            [remove appendString:ichar];
        else if([ichar isEqualToString:@" "])
            continue;
        else
            [add appendString:ichar];
    }
    
    return [NSArray arrayWithObjects:add, remove, nil];
}

/**
 * Take an irc line and breaks into three parts: prefix, command, params
 * This function strictly depends on the form of line, which should be
 *      -- :prefix command param param2 param3 .. 
 * @param data one irc data line
 * @return IRCData* that contains information about data 
 */
+(IRCData *)parse_line:(NSString *)data
{
    IRCData * ircdata = [[IRCData alloc] init];
    
    //first check leading :
    NSArray * components = [data componentsSeparatedByString:@" "];
    
    if([[components objectAtIndex:0] hasPrefix:@":"])
        [ircdata setPrefix:[[components objectAtIndex:0] substringFromIndex:1]];
    else
        [ircdata setPrefix:nil];
    
    [ircdata setCommand:[components objectAtIndex:1]];
    [ircdata setParams:[components subarrayWithRange:NSMakeRange(2, [components count])]];
    return ircdata;
}

/**
 * Take IRCData class and parse out prefix 
 * @param data IRCData class contains information
 * @return NSArray contains nick, user and host 
 */
+(NSArray *)parse_prefix:(IRCData *)data
{
    if([data prefix] == nil)
        return nil;
    
    NSString *host = nil, *nick = nil, *user = nil, *pre = nil;
    NSArray * temp;

    if([[data prefix] rangeOfString:@"@"].location != NSNotFound)
    {
        temp = [[data prefix] componentsSeparatedByString:@"@"];
        host = [temp objectAtIndex:1];
        pre = [temp objectAtIndex:0];
    }

    if([pre rangeOfString:@"!"].location != NSNotFound)
    {
        temp = [[data prefix] componentsSeparatedByString:@"!"];
        nick = [temp objectAtIndex:0];
        user = [temp objectAtIndex:1];
    }
    else
        nick = pre;
    
    return [NSArray arrayWithObjects:nick, user, host, nil];
}

/**
 * Check if channel name is valid, not testing if it exists
 * @param channel string name of channel
 * @return YES if it is valid, otherwise NO
 */
+(BOOL)is_valid_channel:(NSString *)channel
{
    NSError  *error  = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression
                                  regularExpressionWithPattern:@"(?i)(?:#|\+|![a-z0-9]{5}|&)[^\x00\x07\s,\:]+$"
                                  options:0
                                  error:&error];
    
    NSRange range   = [regex rangeOfFirstMatchInString:channel
                        options:0 range:NSMakeRange(0, [channel length])];
    
    return [channel substringWithRange:range] != nil;
}

/**
 * Check if nick name is valid
 * @param nick nick name
 * @return YES if it is valid, otherwise NO
 */
+(BOOL)is_valid_nick:(NSString *)nick
{
    NSCharacterSet * set =
    [NSCharacterSet characterSetWithCharactersInString:@"-[]\\`^{}_"];
    
    if(!([[NSCharacterSet letterCharacterSet] characterIsMember:[nick characterAtIndex:0]]) || [set characterIsMember:[nick characterAtIndex:0]])
       return NO;
    
    for(int i = 1; i < [nick length]; ++i)
    {
        if(![set characterIsMember:[nick characterAtIndex:i]] ||
           ![[NSCharacterSet alphanumericCharacterSet]
             characterIsMember:[nick characterAtIndex:i]])
            return NO;
    }
    
    return YES;
}

/**
 * Filter nick, removing all invalid characters
 * @param nick string
 * @return string that is removed invalid characters if any exists
 */
+(NSString *)filtered_nick:(NSString *)nick
{
    NSMutableString *asciiCharacters = [NSMutableString string];
    for (NSInteger i = 32; i < 127; i++)  {
        [asciiCharacters appendFormat:@"%c", i];
    }
    
    NSCharacterSet *nonAsciiCharacterSet =
        [[NSCharacterSet characterSetWithCharactersInString:asciiCharacters] invertedSet];
    
    NSArray * filtered = [nick componentsSeparatedByCharactersInSet:nonAsciiCharacterSet];
    if([filtered count] == 0)
        return nil;
    
    return [filtered componentsJoinedByString:@""];
}



@end
