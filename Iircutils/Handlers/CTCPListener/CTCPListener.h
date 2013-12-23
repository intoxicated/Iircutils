//
//  CTCPListener.h
//  Iircutils
//
//  Created by Realfree on 9/14/13.
//  Copyright (c) 2013 Realfree. All rights reserved.
//

#import "EventListener.h"

@interface CTCPListener : EventListener

@end

@interface CTCPActionListener : CTCPListener

@end

@interface CTCPUserInfoListener : CTCPListener

@end

@interface CTCPClientListener : CTCPListener

@end

@interface CTCPVersionListener : CTCPListener

@end

@interface CTCPPingListener : CTCPListener

@end

@interface CTCPErrorListener : CTCPListener

@end

@interface CTCPTimeListener : CTCPListener

@end

@interface DCCListener : CTCPListener

@end
