//
//  AppDelegate.h
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketRocket/SRWebSocket.h"

#define BigDelegate \
((AppDelegate*) [UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate, SRWebSocketDelegate>
{
    NSString *myGroup;
    SRWebSocket* myWS;
    bool loggedIn;
    NSMutableArray* story;
}

@property (strong, nonatomic) UIWindow *window;

- (bool) getStatus;
- (NSString*) getGroup;
- (NSMutableArray*) getStory;
- (void) connect:(NSString* )group;
- (void) doConnect:(NSString* )group;

@end
