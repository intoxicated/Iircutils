//
//  NSString+Utils.m
//  Iircutils
//
//  Created by R3alFr3e on 1/3/14.
//  Copyright (c) 2014 Realfree. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString *)repeat:(NSUInteger)times
{
    return [@"" stringByPaddingToLength:times * [self length] withString:self startingAtIndex:0];
}

@end
