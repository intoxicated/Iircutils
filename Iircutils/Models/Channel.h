//
//  Channel.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//  Represent a single channel

#import <Foundation/Foundation.h>

@interface Channel : NSObject
@property (strong, nonatomic) NSMutableArray * user_list;
@property (strong, nonatomic) NSString * name;
@end
