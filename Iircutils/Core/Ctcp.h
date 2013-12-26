//
//  Ctcp.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTCP : NSObject

+ (NSData *)tag:(NSString *)message;
+ (NSData *)low_level_qoute:(NSString *)text;
+ (NSData *)low_level_deqoute:(NSString *)text;
+ (NSString *)qoute:(NSString *)text;
+ (NSString *)dequote:(NSString *)text;

+ (NSArray *)extract:(NSString *)message;
+ (NSArray *)parse_request:(NSString *)section;

@end
