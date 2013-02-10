//
//  NSObject+StoryPage.m
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import "StoryPage.h"
#import "AppDelegate.h"
#import "SBJson.h"

@implementation StoryPage

@synthesize myText;
@synthesize myWord;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
   // NSUserDefaults *name = [NSUserDefaults standardUserDefaults];
    myText.text = suggestion;
    myText.textAlignment = NSTextAlignmentJustified;
    
    //myText.text = [BigDelegate getStory];
    
   // NSLog(@"storyLine: %@", [BigDelegate getStory]);
    
    [(AppDelegate*)[UIApplication sharedApplication].delegate storyPageLoaded:self];
}

- (void)updateText:(NSString*)story
{
    NSLog(@"storyLine: %@", story);
    myText.text = story;
    [myText scrollRangeToVisible:NSMakeRange(myText.text.length-2, 1)];
}

- (IBAction)updateWord:(NSString*)sugg
{
    suggestion = sugg;
}

- (IBAction)textFieldDidBeginEditing:(id)sender
{
    myWord.text = suggestion;
    [self animateTextField: sender up: YES];
}

- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    const int movementDistance = 130; // tweak as needed
    const float movementDuration = 0.3f; // tweak as needed
    
    int movement = (up ? -movementDistance : movementDistance);
    
    [UIView beginAnimations: @"anim" context: nil];
    [UIView setAnimationBeginsFromCurrentState: YES];
    [UIView setAnimationDuration: movementDuration];
    self.view.frame = CGRectOffset(self.view.frame, 0, movement);
    
    if (up) {
        [myText setFrame:CGRectMake(myText.frame.origin.x, 130, myText.frame.size.width, 180)];
    } else {
        [myText setFrame:CGRectMake(myText.frame.origin.x, 20, myText.frame.size.width, 230)];
    }
    [myText scrollRangeToVisible:NSMakeRange(myText.text.length-2, 1)];

    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (NSString*)getWord
{
    return myWord.text;
}

- (IBAction)sendWord:(id)sender
{
    word = myWord.text;
    [sender resignFirstResponder];
    
    myWord.text = suggestion;
    
    if (![word isEqual: @""])
    {
        [BigDelegate insertWord:word];
    } 
}

- (IBAction)backgroundClick:(id)sender
{
	[myWord resignFirstResponder];
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [self animateTextField: sender up: NO];
    myWord.text = suggestion;
    [sender resignFirstResponder];
}

@end

