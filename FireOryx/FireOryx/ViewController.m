//
//  ViewController.m
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "SBJson.h"


@implementation ViewController

@synthesize myGroup;
@synthesize myText;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    NSUserDefaults *name = [NSUserDefaults standardUserDefaults];
    myGroup.text = [name stringForKey:@"textFieldKey"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connect
{
    group = myGroup.text;
    
    [BigDelegate connect:group];
    
    NSLog(@"m-am connectat");
}

- (IBAction)textFieldDoneEditing:(id)sender
{
    [sender resignFirstResponder];
}

- (IBAction)backgroundClick:(id)sender {
    
	[myGroup resignFirstResponder];
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
