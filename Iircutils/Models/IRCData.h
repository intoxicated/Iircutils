//
//  IRCData.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//
//  IRC Data class

#import <Foundation/Foundation.h>

@interface IRCData : NSObject
@property (strong, nonatomic) NSString * prefix;
@property (strong, nonatomic) NSString * command;
@property (strong, nonatomic) NSMutableArray * params;
@end
