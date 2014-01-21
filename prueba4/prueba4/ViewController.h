//
//  ViewController.h
//  prueba4
//
//  Created by rml on 23/12/13.
//  Copyright (c) 2013 rml. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *vista1;
@property (weak, nonatomic) IBOutlet UILabel *infoTouch;
@property (weak, nonatomic) IBOutlet UIImageView *background1;


- (IBAction)gridOnOff:(id)sender;

@end
