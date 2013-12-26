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

#define X_DELIM @"\x01"
#define M_QUOTE @"\x10"
#define X_QUOTE @"\\"

static NSArray * commands = nil;
static NSDictionary * ctcp_quote_map = nil;
static NSDictionary * low_quote_map = nil;

@implementation CTCP

@end
