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
    NSString *word;
    
}

@property (weak, nonatomic) IBOutlet UITextView *myText;
@property (weak, nonatomic) IBOutlet UITextField *myWord;

-(IBAction)updateText:(id)sender;
-(IBAction)sendWord:(id)sender;
- (IBAction)textFieldDoneEditing:(id)sender;
-(IBAction)backgroundClick:(id)sender;

@end
