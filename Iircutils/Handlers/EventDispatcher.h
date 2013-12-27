//
//  EventDispatcher.h
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//  This class is responsible for registering listener to the dispatcher, providing
//  a way to interact with the listener and dispatching event.
//

#import <Foundation/Foundation.h>

@class Event;
@class EventListener;

@interface EventDispatcher : NSObject

@property (nonatomic, strong) NSMutableDictionary * _listeners;

//+ (EventDispatcher *)sharedDispatcher;


- (id)init;

- (void)register_listener:(NSString *)name listener:(id)listener;
- (void)dispatch:(id)client event:(Event *)event;

- (void)setListener:(NSString *)name listener:(Event *)listener;
- (EventListener *)getListener:(NSString *)name;
- (NSArray *)allKeys;

@end
