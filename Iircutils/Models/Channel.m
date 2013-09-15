//
//  Channel.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Channel.h"

@implementation Channel
@synthesize user_list = _user_list;
@synthesize name = _name;

-(Channel *)init
{
    if (!(self = [super init]))
    {
        self.user_list = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
