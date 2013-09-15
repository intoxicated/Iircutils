//
//  Iircutils.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//
//  Lightweight singleton to provide useful data structures

#import <Foundation/Foundation.h>

@interface Iircutils : NSObject
@property (strong, nonatomic) NSMutableDictionary * name_symbols;
@property (strong, nonatomic) NSArray * commands_no_target;
@end
