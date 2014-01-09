//
//  EventElement.h
//  Iircutils
//
//  Created by R3alFr3e on 12/23/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventElement : NSObject

@property (assign, nonatomic) NSInteger priority;
@property (strong, nonatomic) NSValue * handler;

@end
