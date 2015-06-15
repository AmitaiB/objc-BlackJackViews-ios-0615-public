//
//  FISBlackjackGameViewController.h
//  objc-BlackJackViews
//
//  Created by Amitai Blickstein on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FISBlackjackGame.h"

@interface FISBlackjackGameViewController : UIViewController
@property (nonatomic, strong) FISBlackjackGame *blackjackGame;

@property (weak, nonatomic) IBOutlet UILabel *card1;
@property (weak, nonatomic) IBOutlet UILabel *card2;
@property (weak, nonatomic) IBOutlet UILabel *card3;
@property (weak, nonatomic) IBOutlet UILabel *card4;
@property (weak, nonatomic) IBOutlet UILabel *card5;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *resultLabel;

@property (nonatomic, strong) NSDictionary *cardLabelsDict;


-(void)updateUI;
-(void)updateUI_CardLabels;
-(void)updateUI__CardLabel:(UILabel*)myLabel withCard:(FISPlayingCard*)card;
-(void)updateUI_StatusLabels;
-(void)updateUI__ScoreLabel;
-(void)updateUI__ResultLabel;


- (IBAction)dealButtonTapped:(id)sender;
-(void)deal;

- (IBAction)hitButtonTapped:(id)sender;
-(void)hit;

@end
