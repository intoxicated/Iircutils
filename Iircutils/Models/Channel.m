//
//  Channel.m
//  Iircutils
//
//  Created by R3alFr3e on 12/26/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "Channel.h"

@implementation Channel
@synthesize user_list = _user_list;
@synthesize name = _name;

-(id)init
{
    if(self = [super init])
    {
        self.name = nil;
        self.user_list = [[NSMutableArray alloc] init];
    }
    return self;
}

@end
