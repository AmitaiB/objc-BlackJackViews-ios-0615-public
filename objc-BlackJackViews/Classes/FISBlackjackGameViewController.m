//
//  FISBlackjackGameViewController.m
//  objc-BlackJackViews
//
//  Created by Amitai Blickstein on 6/15/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import "FISBlackjackGameViewController.h"

@interface FISBlackjackGameViewController ()

@end

@implementation FISBlackjackGameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.blackjackGame = [[FISBlackjackGame alloc] init];
    [self deal];
}

-(void)updateCardLabel:(UILabel*)myLabel withCard:(FISPlayingCard*)card {
    myLabel.text = [NSString stringWithFormat:@"%@ %@", card.rank, card.suit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)deal {
    [self.blackjackGame deal];
    [self updateCardLabel:self.card1 withCard:self.blackjackGame.hand[0]];
    [self updateCardLabel:self.card2 withCard:self.blackjackGame.hand[1]];
}

-(void)hit {
    [self.blackjackGame hit];
    NSUInteger numberOfCardsInHand = [self.blackjackGame.hand count];
    
}

- (IBAction)dealButtonTapped:(id)sender {
    NSLog(@"dealButton works!");
    [self deal];
}

- (IBAction)hitButtonTapped:(id)sender {
    NSLog(@"hitButton works!");
    [self.blackjackGame hit];
}

@end
