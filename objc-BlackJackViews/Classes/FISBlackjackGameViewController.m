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
//    [self deal];
    [self updateUI];
}


-(void)resetUI {
    [self resetUI_CardLabels];
    [self resetUI_StatusLabels];
}

-(void)updateUI {
    [self updateUI_StatusLabels];
    [self updateUI_CardLabels];
}


-(void)deal {
    [self resetUI];
    [self.blackjackGame deal];

//    [self updateUI__CardLabel:self.card1 withCard:self.blackjackGame.hand[0]];
//    [self updateUI__CardLabel:self.card2 withCard:self.blackjackGame.hand[1]];

    [self.blackjackGame checkHandScore];
    [self updateUI];
}

-(void)hit {
    [self.blackjackGame checkHandScore];
    [self.blackjackGame hit];
    [self.blackjackGame checkHandScore];
    [self updateUI];
    
}


-(void)resetUI_CardLabels {
    for (UILabel *card in [self.cardLabelsDict allValues]) {
        card.text = @"";
        card.hidden = YES;
    }
}

//Problem area!
-(void)resetUI_StatusLabels {
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", self.blackjackGame.handScore];
    self.resultLabel.text = @"";
}

//Updates all the cards.
-(void)updateUI_CardLabels {
    for (NSUInteger i = 0; i < [self.blackjackGame.hand count]; i++) {
        [self updateUI__CardLabel:self.cardLabelsDict[@(i)] withCard: self.blackjackGame.hand[i]];
    }
}

// Updates one card.
-(void)updateUI__CardLabel:(UILabel *)myLabel withCard:(FISPlayingCard *)card {
    myLabel.text = [NSString stringWithFormat:@"%@ %@", card.rank, card.suit];
    myLabel.hidden = NO;
}

// Updates both status labels.
-(void)updateUI_StatusLabels {
    [self updateUI__ScoreLabel];
    [self updateUI__ResultLabel];
}

-(void)updateUI__ScoreLabel {
    self.scoreLabel.text = [NSString stringWithFormat:@"%@", self.blackjackGame.handScore];
}

-(void)updateUI__ResultLabel {
    if (self.blackjackGame.isBusted) {
        self.resultLabel.text = [NSString stringWithFormat:@"%@", @"Busted!"];
    }
    if (self.blackjackGame.isBlackjack) {
        self.resultLabel.text = [NSString stringWithFormat:@"%@", @"Blackjack!"];
    }
}

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
