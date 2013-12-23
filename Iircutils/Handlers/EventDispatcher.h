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

@class ITX_Client;
@class EventListener;

@interface EventDispatcher : NSObject


@property (nonatomic, strong) NSMutableDictionary * _listeners;

- (id)init;
+ (EventDispatcher *)sharedDispatcher;

//singleton methods

+ (void)register_listener:(NSString *)name listener:(id)listener;
+ (void)dispatch:(ITX_Client *)client event:()event;

+ (void)setListener:(NSString *)name listener:(EventListener *)listener;
+ (id)getListener:(NSString *)name;
+ (NSArray *)allKeys;

@end
