//
//  ITX_Client.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EventDispatcher;

@interface SimpleClient : NSObject

@property (nonatomic, strong) NSString * nick;
@property (nonatomic, strong) NSString * user;
@property (nonatomic, strong) NSString * real_name;
@property (nonatomic, strong) NSString * mode;
@property (nonatomic, strong) NSMutableArray * channels;

@property (nonatomic, strong) EventDispatcher * events;

@end
