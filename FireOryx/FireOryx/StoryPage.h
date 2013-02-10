//
//  NSObject+StoryPage.h
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StoryPage : UIViewController {
    NSString *text;
    
}

@property (weak, nonatomic) IBOutlet UITextView *myText;

-(void)updateText:(NSString*)story;

@end
