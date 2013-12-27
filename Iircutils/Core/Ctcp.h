//
//  Ctcp.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CTCP : NSObject

+ (NSString *)tag:(NSString *)message;
+ (NSString *)low_level_qoute:(NSString *)text;
+ (NSString *)low_level_deqoute:(NSString *)text;
+ (NSString *)qoute:(NSString *)text;
+ (NSString *)dequote:(NSString *)text;

+ (NSArray *)extract:(NSString *)message;
+ (NSArray *)parse_request:(NSString *)section;

@end
