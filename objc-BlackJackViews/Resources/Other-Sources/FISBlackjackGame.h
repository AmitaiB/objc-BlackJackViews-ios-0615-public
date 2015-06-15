//
//  FISBlackjackGame.h
//  BlackJack
//
//  Created by Amitai Blickstein on 6/12/15.
//  Copyright (c) 2015 Flatiron School. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FISPlayingCardDeck.h"

@interface FISBlackjackGame : NSObject

@property (strong, nonatomic) FISPlayingCardDeck *playingCardDeck; // The playingCardDeck in use.
@property (strong, nonatomic) NSNumber *handScore; // Returns the total value of all cards in hand. Aces = 1 OR 11, Face Cards = 10.
@property (strong, nonatomic) NSMutableArray *hand; //Returns the cards in the hand.
@property (nonatomic) BOOL isBusted;
@property (nonatomic) BOOL isBlackjack;
@property (nonatomic) BOOL hasAce;

- (instancetype)init;   //Init a full playingCardDeck, with handScore = @0, isBusted/blackjack/ace = NO.

-(void) setupNewRound;  //Garbage collection to reset for new game.
-(void) deal;   // Removes 2 random cards from the deck, moving them (copying them) to the hand.
-(void) hit;    // Removes 1 random card from the deck, moving it (copying it) to the hand.


-(void) tallyHandScore;

-(void) checkIfBusted:(NSUInteger)score;      //Returns YES if handScore is more than 21
-(void) checkIfBlackjack:(NSUInteger)score;   // Returns YES if handScore is 21

 @end
