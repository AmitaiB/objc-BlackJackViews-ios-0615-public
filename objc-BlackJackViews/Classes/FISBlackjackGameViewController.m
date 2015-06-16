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
    self.cardLabelsArray = @[self.card1, self.card2, self.card3, self.card4, self.card5];
    [self deal];
    [self updateUI];
}

-(void)resetUI {
    [self resetUI_CardLabels];
    [self resetUI_StatusLabels];
    NSLog(@"RESET hand count: %lu", [self.blackjackGame.hand count]);
}

-(void)updateUI {
    [self resetUI];
    [self updateUI_StatusLabels];
    [self updateUI_CardLabels];
}


-(void)deal {
    NSLog(@"NeW gAmE: DEAL1 hand count: %lu", [self.blackjackGame.hand count]);
    [self resetUI];
    NSLog(@"DEAL2 hand count: %lu", [self.blackjackGame.hand count]);
    [self.blackjackGame deal];
    NSLog(@"DEAL3 hand count: %lu", [self.blackjackGame.hand count]);
//    [self updateUI__CardLabel:self.card1 withCard:self.blackjackGame.hand[0]];
//    [self updateUI__CardLabel:self.card2 withCard:self.blackjackGame.hand[1]];

    [self.blackjackGame checkHandScore];
    NSLog(@"DEAL 4 hand count: %lu", [self.blackjackGame.hand count]);
    [self updateUI];
    NSLog(@"DEAL 5 hand count: %lu", [self.blackjackGame.hand count]);

}

-(void)hit {
    NSLog(@"HIT 1 hand count: %lu", [self.blackjackGame.hand count]);

    [self.blackjackGame checkHandScore];
    [self.blackjackGame hit];
    NSLog(@"HIT 2 hand count: %lu", [self.blackjackGame.hand count]);
    [self.blackjackGame checkHandScore];
    [self updateUI];
    
}

- (IBAction)resultOnlyButtonTapped:(id)sender {
    [self resetUI];
}

- (IBAction)updateUIOnlyButtonTapped:(id)sender {
    [self resetUI];
}


-(void)resetUI_CardLabels {
    for (UILabel *card in self.cardLabelsArray) {
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
//    NSArray *dictionaryKeys = @{@1, @2, @3, @4, @5};
    
    for (NSUInteger i = 0; i < [self.blackjackGame.hand count]; i++) {
        [self updateUI__CardLabel:self.cardLabelsArray[i] withCard: self.blackjackGame.hand[i]];
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
    [self hit];
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
