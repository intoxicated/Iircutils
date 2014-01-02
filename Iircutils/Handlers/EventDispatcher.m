//
//  EventDispatcher.m
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//


#import "EventDispatcher.h"
#import "EventListener.h"

@implementation EventDispatcher
@synthesize _listeners;

//static EventDispatcher *sharedObject = nil;
//static dispatch_once_t onceToken;

/*
+ (EventDispatcher*)sharedDispatcher {
    
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
        sharedObject._listeners = [[NSMutableDictionary alloc] init];
    });
    return sharedObject;
}
*/

- (id)init{
    if(self = [super init])
    {
        self._listeners = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark -

- (void)setListener:(NSString *)name listener:(id)listener
{
    [self._listeners setObject:listener forKey:name];
}

- (EventListener *)getListener:(NSString *)name
{
    return [self._listeners objectForKey:name];
}

- (NSArray *)allKeys
{
    return [self._listeners allKeys];
}

- (void)register_listener:(NSString *)name listener:(EventListener *)listener
{
    [self._listeners setObject:listener forKey:name];
}

- (void)dispatch:(id)client event:(Event *)event
{
    for(EventListener * listener in [self._listeners allKeys])
    {
        if(listener.handlers.count != 0)
            [listener notify:client event:event];
    }
}

@end
