//
//  FISBlackjackGameViewController.h
//  objc-BlackJackViews
//
//  Created by Amitai Blickstein on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FISBlackjackGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *card1;
@property (weak, nonatomic) IBOutlet UILabel *card2;
@property (weak, nonatomic) IBOutlet UILabel *card3;
@property (weak, nonatomic) IBOutlet UILabel *card4;
@property (weak, nonatomic) IBOutlet UILabel *card6;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

- (IBAction)hitButtonTapped:(id)sender;
- (IBAction)dealButtonTapped:(id)sender;

@end
