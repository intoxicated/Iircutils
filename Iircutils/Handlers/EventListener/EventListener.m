//
//  EvenListener.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "EventListener.h"
#import "EventElement.h"
#import "Event.h"
#import "Protocol.h"
#import "IRCData.h"

@implementation EventListener
@synthesize handlers = _handlers;

- (id)init
{
    if (!(self = [super init]))
    {
        self.handlers = [[NSMutableArray alloc] init];
    }
    return self;
}

/* */
- (void)add_handler:(id)handler priority:(NSInteger)priority
{
    NSComparator comparator = ^NSComparisonResult(id obj1, id obj2){
        EventElement * e1 = obj1;
        EventElement * e2 = obj2;
        if(e1.priority < e2.priority)
            return NSOrderedDescending;
        else if(e1.priority > e2.priority)
            return NSOrderedAscending;
        else
            return NSOrderedSame;
    };
    
    EventElement * newObject;
    [newObject setPriority:priority];
    [newObject setHandler:handler];
    
    NSUInteger newIndex = [self.handlers indexOfObject:newObject
                                 inSortedRange:(NSRange){0, [self.handlers count]}
                                       options:NSBinarySearchingInsertionIndex
                               usingComparator:comparator];
    
    [self.handlers insertObject:newObject atIndex:newIndex];
}

/* */
- (void)remove_handler:(id)handler
{
    for(EventElement *e in self.handlers)
    {
        if(e.handler == handler)
           [self.handlers removeObject:e];
    }
}

/* */
- (void)activate_handlder:(NSArray *)args
{
    for(EventElement *e in self.handlers)
    {
        @try{
            SEL eSelector = [e.handler pointerValue];
            [self performSelector:eSelector withObject:args];
            //may need to fix this
        }
        @catch (NSException *e) {
            NSLog(@"Exception %@", e);
            [self.handlers removeObject:e];
        }
    }
}

/* */
- (void)notify:(id)client event:(Event *)event
{
    [NSException raise:@"Not Implemented error" format:@"Must be overriden!"];
}

@end



@interface CustomListener()
@property (strong, nonatomic) IRCData * data;
@end

@implementation CustomListener

-(id)init:(IRCData *)data
{
    //initiate datas
    return self;
}

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    NSArray * a1 = [self.data.params sortedArrayUsingSelector:@selector(compare:)];
    NSArray * a2 = [event.params sortedArrayUsingSelector:@selector(compare:)];
    
    if([self.data.command isEqualToString:event.command] &&
       [self.data.prefix isEqualToString:event.prefix] &&
       [a1 isEqualToArray:a2])
        [self activate_handlder:[NSArray arrayWithObjects:client,event, nil]];
}

@end

@implementation AnyListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation WelcomeListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"RPL_WELCOME"])
      [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation NickChangeListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"NICK"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation PingListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"PING"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation InviteListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"INVITE"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation KickListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"KICK"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation JoinListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"JOIN"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation QuitListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"QUIT"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation PartListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"PART"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end

@implementation ErrorListener

-(void)notify:(SimpleClient *)client event:(Event *)event
{
    if ([event.command isEqualToString:@"ERROR"])
        [super activate_handlder:[NSArray arrayWithObjects:client, event, nil]];
}

@end



