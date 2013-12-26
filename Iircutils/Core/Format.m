//
//  Format.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Format.h"

@implementation Format

// Text formatting tags
#define T_BOLD @"\x02"
#define T_UNDERLINE @"\x1F"
#define T_REVERSED @"\x16"
#define T_NORMAL @"\x0F"
#define T_COLOR_TAG @"\x03"

// Color indicies
#define BLACK @"1"
#define NAVY_BLUE @"2"
#define GREEN @"3"
#define RED @"4"
#define BROWN @"5"
#define PURPLE @"6"
#define OLIVE @"7"
#define YELLOW @"8"
#define LIME_GREEN @"9"
#define TEAL @"10"
#define AQUA @"11"
#define BLUE @"12"
#define INK @"13"
#define DARK_GRAY @"14"
#define LIGHT_GRAY @"15"
#define WHITE @"16"

// Filter mode
#define FILTER_ALL 1
#define FILTER_BOLD 2
#define FILTER_UNDERLINE 4
#define FILTER_REVERSED 8
#define FILTER_COLOR 16

+ (NSString *)filter:(NSString *)text type:(NSInteger)type
{
    return nil;
}

+ (NSString *)bold:(NSString *)text
{
    return nil;
}

+ (NSString *)underline:(NSString *)text
{
    return nil;
}

+ (NSString *)reversed:(NSString *)text
{
    return nil;
}

+ (NSString *)color:(NSString *)text foreground:(NSString *)fm background:(NSString *)bm
{
    return nil;
}

@end
