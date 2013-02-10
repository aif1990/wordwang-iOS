//
//  AppDelegate.h
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SocketRocket/SRWebSocket.h"
#import "StoryPage.h"

#define BigDelegate \
((AppDelegate*) [UIApplication sharedApplication].delegate)

@interface AppDelegate : UIResponder <UIApplicationDelegate, SRWebSocketDelegate>
{
    NSString *myGroup;
    SRWebSocket* myWS;
    bool loggedIn;
    NSString* storyLine;
    StoryPage *storyPage;
}

@property (strong, nonatomic) UIWindow *window;
//@property (strong, nonatomic) StoryPage *storyPage;

- (bool) getStatus;
- (NSString*) getGroup;
- (NSString*) getStory;
- (void) connect:(NSString* )group;
- (void) doConnect:(NSString* )group;
- (void) storyPageLoaded:(StoryPage*)sPage;


@end
