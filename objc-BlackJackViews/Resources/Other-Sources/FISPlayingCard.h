//
//  PlayingCard.h
//  OOP-Cards-Model
//
//  Created by Amitai Blickstein on 6/10/15.
//  Copyright (c) 2015 Al Tyus. All rights reserved.
//
//♥♠♣♦

#import "Card.h"
//#define unichar HEARTS = '♥';

@interface FISPlayingCard : Card

@property (nonatomic, strong) NSString *suit;
@property (nonatomic, strong) NSNumber* rank;
@property (nonatomic, strong) NSString *rankByName;

-(instancetype)initWithSuit:(NSString*)suit rank:(NSNumber*)rank;
-(instancetype)init;

-(NSString *)description;
-(BOOL)isSingleChar;
-(BOOL)isProperRank;
-(BOOL)isProperSuit;


@end
