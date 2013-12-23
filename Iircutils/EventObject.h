//
//  EventObject.h
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>
@class IRCData;

// super class
@interface Event : NSObject
@property (strong, nonatomic) NSString * command;
@property (strong, nonatomic) NSString * prefix;
@property (strong, nonatomic) NSArray * params;
@end

@interface StandardEvent : Event
@property (strong, nonatomic) NSString * source;
@property (strong, nonatomic) NSString * host;
@property (strong, nonatomic) NSString * user;
@property (strong, nonatomic) NSString * target;
-(id)init:(IRCData *)data;
@end

@interface MessageEvent : StandardEvent

@end

@interface CTCPEvent : StandardEvent
@end

@interface EventObject : NSObject
@end
