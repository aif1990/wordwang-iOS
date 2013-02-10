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
    myText.text = @"bau";
    //myText.text = [BigDelegate getStory];
    
   // NSLog(@"storyLine: %@", [BigDelegate getStory]);
    
    [(AppDelegate*)[UIApplication sharedApplication].delegate storyPageLoaded:self];
}

- (void)updateText:(NSString*)story
{
    NSLog(@"storyLine: %@", story);
    myText.text = story;
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
    NSLog(@"word: %@", word);
    [BigDelegate insertWord:word];
}

- (IBAction)backgroundClick:(id)sender {
    
	[myWord resignFirstResponder];
    
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

@end

