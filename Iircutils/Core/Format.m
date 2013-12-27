//
//  Format.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Format.h"

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
