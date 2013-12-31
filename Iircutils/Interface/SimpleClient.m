//
//  ITX_Client.m
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "SimpleClient.h"
#import "EventDispatcher.h"
#import "EventListener.h"
#import "Event.h"
#import "CTCP.h"
#import "Format.h"
#import "Connection.h"
#import "IRCData.h"
#import "Channel.h"

@interface SimpleClient ()
@property (nonatomic, strong) Connection * conn;

-(void)_update_client_info;
-(void)_set_channel_name;
-(void)_auto_join:(SimpleClient *)client;


@end

@implementation SimpleClient
@synthesize events = _events;
@synthesize user = _user;
@synthesize real_name = _real_name;
@synthesize nick = _nick;
@synthesize conn = _conn;

- (id)init:(NSString *)nick mode:(NSString *)mode
{
    if(self = [super init])
    {
        self.events = [[EventDispatcher alloc] init];
        self.channels = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id)getEvent:(NSString *)name
{
    return [self.events getListener:name];
}

- (void)setEvent:(NSString *)name event:(Event *)e
{
    [self.events setListener:name listener:e];
}

- (void)_register_default_listeners
{
    //function pointer to listener
    [self.events register_listener:nil listener:[[NSClassFromString(@"NameofClass") alloc] init]];
}

- (void)_add_built_in_handler
{
    EventListener * e = [self.events getListener:@"any"];
    [e add_handler:[NSValue valueWithPointer:@selector(_update_client_info)] priority:0];
}

- (void)_dispatch_event:(IRCData *)data
{
    NSString * command = data.command;
    NSString * prefix = data.prefix;
    NSArray * params = [NSArray arrayWithArray:data.params];
    
    NSMutableArray * pending = [[NSMutableArray alloc] init];
    NSArray * ctcp_request;
    NSString * msgData;
    MessageEvent * e;
    
    if([command isEqualToString:@"PRIVMSG"] ||
       [command isEqualToString:@"NOTICE"])
    {
        e = [[MessageEvent alloc] init:nil];
        msgData = [e.params lastObject];
        msgData = [CTCP low_level_deqoute:msgData]; //???
        NSArray * ret = [CTCP extract:[e.params lastObject]];
        msgData = [ret objectAtIndex:0];
        ctcp_request = [ret objectAtIndex:1];
        
        msgData = [Format filter:msgData type:FILTER_ALL];
        if(![[msgData stringByTrimmingCharactersInSet:
              [NSCharacterSet whitespaceAndNewlineCharacterSet]] isEqualToString:@""])
        {
            e.message = msgData;
            [pending addObject:e];
        }
        
        CTCPEvent * ct_e;
        
        for(NSArray * item in ctcp_request)
        {
            ct_e = [[CTCPEvent alloc] init];
            ct_e.command = [NSString stringWithFormat:@"CTCP_%@", [item objectAtIndex:0]];
            [ct_e.params addObjectsFromArray:[item objectAtIndex:1]];
            ct_e.source = e.source;
            ct_e.target = e.target;
            [pending addObject:ct_e];
        }
    }
    else{
        [pending addObject:[[StandardEvent alloc] initWith:command prefix:prefix params:params]];
    }
    
    for(Event * event in pending)
    {
        [self.events dispatch:self event:event];
    }
}

- (void)connect:(NSString *)host port:(NSInteger)port channel:(NSString *)chl password:(NSString *)pw
{
    //using connection class
    //
    NSArray * params = [NSArray arrayWithObjects:self.user,self.mode,@"*", nil];
    self.conn = [[Connection alloc] init:NO delegate:nil];
    self.conn.handleLinePtr = [NSValue valueWithPointer:@selector(_dispatch_event:)];
    [self.conn connect:host port:port password:pw];
    [self.conn execute:@"USER" param:params kwargs:[NSString stringWithFormat:@"trailing=%@", self.real_name]];
    [self.conn execute:@"NICK" param:[NSArray arrayWithObject:self.nick] kwargs:nil];
    
    if (chl != nil)
    {
        Channel *ch = [[Channel alloc] init];
        [ch setName:chl];
        
        [self.channels addObject:ch];
        
        /*
        void (^auto_join)(SimpleClient *, EventListener *) = ^(SimpleClient * client, EventListener * e)
        {
            for(Channel * c in self.channels)
            {
                [client join_channel:c.name key:nil];
            }
        };
        */
        
        EventListener * e = [self.events getListener:@"welcome"];
        [e add_handler:[NSValue valueWithPointer:@selector(_auto_join)] priority:0];
    }
}

-(void)execute:(IRCData *)data
{
    //[self.conn execute:data.command param:data. kwargs:data.]
}

#pragma mark - built in handlers

- (void)_auto_join:(SimpleClient *)client
{
    for(Channel * c in self.channels)
    {
        [client join_channel:c.name key:nil];
    }
}

- (void)_update_client_info
{
    
}

- (void)_set_channel_name
{
    
}

#pragma mark - built in features

-(void)join_channel:(NSString *)ch key:(NSString *)key
{
    
}

-(void)part_channel:(NSString *)ch
{
    
}

-(void)identify:(NSString *)nspwd
{
    
}

-(void)send_message:(NSString *)target msg:(NSString *)msg isService:(BOOL)isService
{
    
}

-(void)send_notice:(NSString *)target msg:(NSString *)msg
{
    
}

-(void)send_ctcp:(NSString *)target cmd:(NSString *)cmd params:(NSArray *)params
{
    
}

-(void)send_ctcp_reply:(NSString *)target cmd:(NSString *)cmd params:(NSArray *)params
{
    
}

-(void)send_action:(NSString *)target action:(NSString *)action
{
    
}

-(void)set_nickname:(NSString *)nickname
{
    
}

-(void)disconnect:(NSString *)msg
{
    
}
@end
