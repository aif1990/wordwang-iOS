//
//  AppDelegate.m
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import "AppDelegate.h"
#import "JSON/SBJson.h"


@implementation AppDelegate

//@synthesize storyPage;
@synthesize window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    
    return YES;
}

- (void) storyPageLoaded:(StoryPage *)sPage
{
    storyPage = sPage;
}

- (void) webSocketDidOpen:(SRWebSocket *)webSocket
{
    NSLog(@"Socket-ul e gata");
    [self doConnect:myGroup];
}

- (void) webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error
{
    NSLog(@"A murit aici %@", error);
}

- (void) webSocket:(SRWebSocket *)webSocket didReceiveMessage:(NSString *)message
{
    NSMutableDictionary* resp = [[[SBJsonParser alloc] init] objectWithString:message];
    
    if (resp == nil)
    {
        NSLog(@"Nu am putut parsa mesajul: %@", message);
    }else {
        
        /*{"cmd":"refresh",
           "args":{"groupId":7,
                   "groupUsers":{"6": {"userName":"ingrid","userId":6}},
                   "groupStory":[{"content:{"blockContent":"world",
                                            "blockType":"string"},
                                  "blockId":1}],
                   "groupCloud":[{},[]]}}*/
        
        NSMutableDictionary* args = [resp objectForKey:@"args"];
        
        NSLog(@"am args: %@", args);
        
        NSMutableArray *story = [args objectForKey: @"groupStory"];
        
        NSMutableArray *storyData = [[NSMutableArray alloc] init];
        NSMutableDictionary *block;
        
        NSLog(@"storyArray: %@ ", story);
        
        for (block in story)
        {
            NSLog(@"block: %@", block);
            NSMutableDictionary *content = [block objectForKey:@"content"];
            NSString *blockContent = [content objectForKey:@"blockContent"];
            NSLog(@"block Content: %@", blockContent);
            [storyData addObject:blockContent];
        }
        
        NSString* word;
        storyLine = @" ";
        
        for (word in storyData)
        {
         
            NSString *newWord = [word stringByAppendingString:@" "];
            storyLine = [storyLine stringByAppendingString:newWord];
        }
        
        NSLog(@"Story: %@", storyLine);
        
        [storyPage updateText:storyLine];
        
        //NSLog(@"Am primit un mesaj nerecunoscut: %@", message);
    }
    
}

- (void) insertWord:(NSString*)word
{
    
    NSString *initial = @"{\"cmd\": \"send\", \"args\": {\"blockType\": \"string\", \"blockContent\": \"";
    NSString *req = [initial stringByAppendingString:word];
    NSString *request = [req stringByAppendingString:@"\"}}"];
    
    NSLog(@"request: %@", request);
    
    [myWS send:request];
}

- (void) connect:(NSString* )group
{
    myWS = [[SRWebSocket alloc] initWithURLRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"ws://localhost:8888"]]];
    
    myWS.delegate = self;
    
    myGroup = group;
    
    [myWS open];
}

- (void) doConnect:(NSString *)group
{
    //NSMutableDictionary* params = [[NSMutableDictionary alloc] init];
    //[params setValue:group forKey:(@"group")];
    
   // NSString* request = [[[SBJsonWriter alloc] init] stringWithObject:[self makeRequest:@"connect" withData:params]];
    
    NSString* request, *req12;
    
    NSString* req1 = @"{ \"cmd\": \"join\", \"args\": {\"joinGroupId\": ";
    
    NSString* req2 = @", \"joinUserName\": \"ingrid\"}}";
    
    if (![myGroup length] == 0)
    {
        req12 = [req1 stringByAppendingString:myGroup];
        NSLog(@"in here");
        request = [req12 stringByAppendingString:req2];
        NSLog(@"after all built");
        
    } else {
        request = @"{ \"cmd\": \"join\", \"args\": {\"joinGroupId\": null, \"joinUserName\": \"ingrid\"}}";
    }
    
    NSLog(@"voi face acest request %@", request);
    
    [myWS send:request];
    
    [myWS send:@"{\"cmd\": \"send\", \"args\": {\"blockType\": \"string\", \"blockContent\": \"hello\"}}"];
    
    
    [myWS send:@"{\"cmd\": \"send\", \"args\": {\"blockType\": \"string\", \"blockContent\": \"world\"}}"];

    
    
}

- (bool) getStatus
{
    return loggedIn;
}

- (NSString* ) getGroup
{
    return myGroup;
}

- (NSString* ) getStory
{
    return storyLine;
}



- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
