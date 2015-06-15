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
    self.cardLabelsDict = @{@1:self.card1,
                            @2:self.card2,
                            @3:self.card3,
                            @4:self.card4,
                            @5:self.card5};
    [self deal];
    [self.updateUI];
}

-(void)updateUI {
    [self updateUICardLabels];
    [self updateUIStatusLabels];
}

//Updates all the cards.
-(void)updateUICardLabels {
    for (NSUInteger i = 0; i < [self.blackjackGame.hand count]; i++) {
        [self updateUICardLabel:self.cardLabelsDict[@(i)] withCard: self.blackjackGame.hand[i]];
    }
}

// Updates one card.
-(void)updateUICardLabel:(UILabel *)myLabel withCard:(FISPlayingCard *)card {
    myLabel.text = [NSString stringWithFormat:@"%@ %@", card.rank, card.suit];
}

// Updates both status labels.
-(void)updateUIStatusLabels {
    [self updateUIScoreLabel];
    [self updateUIResultLabel];
}

-(void)updateUIScoreLabel {
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", self.blackjackGame.handScore];
}

-(void)updateUIResultLabel {
    if (self.blackjackGame.isBusted) {
        self.resultLabel.text = [NSString stringWithFormat:@"%@", @"Busted!"];
    }
    if (self.blackjackGame.isBlackjack) {
        self.resultLabel.text = [NSString stringWithFormat:@"%@", @"Busted!"];
    }
}

-(void)deal {
    [self.blackjackGame setupNewRound];
    [self.blackjackGame deal];
    [self updateUICardLabel:self.card1 withCard:self.blackjackGame.hand[0]];
    [self updateUICardLabel:self.card2 withCard:self.blackjackGame.hand[1]];
    [self.blackjackGame tallyHandScore];
}

-(void)hit {
    [self.blackjackGame hit];
  /*  NSUInteger numberOfCardsInHand = [self.blackjackGame.hand count];
    FISPlayingCard *newCard = [self.blackjackGame.hand lastObject];
    UILabel *labelToUpdate = self.cardLabelsDict[@(numberOfCardsInHand)];
    [self updateUICardLabel:labelToUpdate withCard:newCard];
*/}

- (IBAction)dealButtonTapped:(id)sender {
    NSLog(@"dealButton works!");
    [self deal];
}

- (IBAction)hitButtonTapped:(id)sender {
    NSLog(@"hitButton works!");
    [self.blackjackGame hit];
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
@end
