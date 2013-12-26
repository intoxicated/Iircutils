//
//  EventDispatcher.m
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//


#import "EventDispatcher.h"

@implementation EventDispatcher
@synthesize _listeners;
static EventDispatcher *sharedObject = nil;
static dispatch_once_t onceToken;

#pragma mark - Singleton

+ (EventDispatcher*)sharedDispatcher {
    
    dispatch_once(&onceToken, ^{
        sharedObject = [[self alloc] init];
    });
    return sharedObject;
}

- (id)init {
    if (self = [super init]) {
        _listeners = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark -

+ (void)setListener:(NSString *)name listener:(id)listener
{
    [sharedObject._listeners setObject:listener forKey:name];
}

+ (id)getListener:(NSString *)name
{
    return [sharedObject._listeners objectForKey:name];
}

+ (NSArray *)allKeys
{
    return [sharedObject._listeners allKeys];
}

+ (void)register_listener:(NSString *)name listener:(id)listener
{
    
}

+ (void)dispatch:(SimpleClient *)client event:(EventListener *)event
{
    
}

@end
