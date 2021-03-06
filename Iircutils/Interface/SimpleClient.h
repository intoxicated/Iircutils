//
//  ITX_Client.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Connection.h"

@class EventDispatcher;
@class EventListener;
@class IRCData;

@interface SimpleClient : NSObject <ConnectionDelegate>

@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * user;
@property (nonatomic, strong) NSString * real_name;
@property (nonatomic, strong) NSString * mode;
@property (nonatomic, strong) NSMutableDictionary * channels;

@property (nonatomic, strong) EventDispatcher * events;


-(id)init:(NSString *)nick mode:(NSString *)mode;
-(void)start;
-(void)register_listener:(NSString *)name listener:(EventListener *)lst;
-(void)execute:(IRCData *)data;

-(void)join_channel:(NSString *)ch key:(NSString *)key;
-(void)part_channel:(NSString *)ch;
-(void)identify:(NSString *)nspwd;
-(void)send_message:(NSString *)target msg:(NSString *)msg isService:(BOOL)isService;
-(void)send_notice:(NSString *)target msg:(NSString *)msg;
-(void)send_ctcp:(NSString *)target cmd:(NSString *)cmd params:(NSArray *)params;
-(void)send_ctcp_reply:(NSString *)target cmd:(NSString *)cmd params:(NSArray *)params;
-(void)send_action:(NSString *)target action:(NSString *)action;
-(void)set_nickname:(NSString *)nickname;
-(void)disconnect:(NSString *)msg;

@end
