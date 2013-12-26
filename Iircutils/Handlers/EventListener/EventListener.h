//
//  EvenListener.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SimpleClient;
@class EventListener;
@class IRCData;
@class Event;

@interface EventListener : NSObject

// An element of array will contains priorty, handler as array of size two
//
//
@property (strong, nonatomic) NSMutableArray * handlers;

- (id)init;
- (void)add_handler:(id)handler priority:(NSInteger)priority;
- (void)remove_handler:(id)handler;
- (void)activate_handlder:(NSArray *)args;
- (void)notify:(SimpleClient *)client event:(Event *)event;

@end

//List of built-in event listener
@interface CustomListener : EventListener
@end

@interface AnyListener : EventListener
@end

@interface WelcomeListener : EventListener
@end

@interface NickChangeListener : EventListener
@end

@interface PingListener : EventListener
@end

@interface InviteListener : EventListener
@end

@interface JoinListener : EventListener
@end

@interface KickListener : EventListener
@end

@interface QuitListener : EventListener
@end

@interface PartListener : EventListener
@end

@interface ErrorListener : EventListener
@end
