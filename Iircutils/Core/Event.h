//
//  Event.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//  define Event classes 

#import <Foundation/Foundation.h>

@class IRCData;

@interface Event : NSObject
// none super class
@end


@interface StandardEvent : Event
@property (strong) IRCData * info;
@property (strong) NSString * target;
@property (strong) NSArray * params;
@end


@interface MessageEvent : StandardEvent
@property (strong) NSString * message;
@end


@interface CTCPEvent : StandardEvent
// none 
@end