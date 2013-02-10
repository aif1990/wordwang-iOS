//
//  ViewController.h
//  FireOryx
//
//  Created by Ingrid Funie on 09/02/2013.
//  Copyright (c) 2013 icl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet NSString *group;
}

-(IBAction)connect;

-(IBAction)textFieldDoneEditing:(id)sender;

-(IBAction)backgroundClick:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *myGroup;
@property (weak, nonatomic) IBOutlet UITextView *myText;

@end
