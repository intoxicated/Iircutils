//
//  Format.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Format.h"
#import "NSString+Utils.h"

//CTCP related
static NSArray * commands = nil;
static NSDictionary * ctcp_quote_map = nil;
static NSDictionary * low_quote_map = nil;

static Format *sharedObject = nil;
static dispatch_once_t onceToken;

@implementation Format

+ (Format*)sharedManager {
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
     
    });
    return sharedObject;
}
 
+ (NSString *)filter:(NSString *)text type:(NSInteger)type
{
    if(type == FILTER_BOLD)
        return [text stringByReplacingOccurrencesOfString:T_BOLD withString:@""];
    else if(type == FILTER_UNDERLINE)
        return [text stringByReplacingOccurrencesOfString:T_UNDERLINE withString:@""];
    else if(type == FILTER_REVERSED)
        return [text stringByReplacingOccurrencesOfString:T_REVERSED withString:@""];
    else if(type == FILTER_COLOR)
        return nil;
    else
        return nil;
    
    return nil;
}

+ (NSString *)bold:(NSString *)text
{
    return [NSString stringWithFormat:@"%@%@%@", T_BOLD, text, T_BOLD];
}

+ (NSString *)underline:(NSString *)text
{
    return [NSString stringWithFormat:@"%@%@%@", T_UNDERLINE, text, T_UNDERLINE];
}

+ (NSString *)reversed:(NSString *)text
{
    return [NSString stringWithFormat:@"%@%@%@", T_REVERSED, text, T_REVERSED];;
}

+ (NSString *)color:(NSString *)text foreground:(NSString *)fm background:(NSString *)bm
{
    NSMutableString * c = [[NSMutableString alloc] init];
    [c appendFormat:@"%@%@", T_COLOR_TAG, fm];
    
    if (bm != nil)
    {
        [c appendFormat:@",%@", bm];
    }
    
    return [NSString stringWithFormat:@"%@%@%@", c, text, [T_COLOR_TAG repeat:3]];
}

@end
