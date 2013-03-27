//
//  CardGame.h
//  Matchismo
//
//  Created by Stuart Slack on 3/20/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

@class Deck;
@class Card;

#import <Foundation/Foundation.h>

@interface CardGame : NSObject
-(id) initWithCardCount:(NSUInteger) cardCount usingDeck:(Deck *) deck;
-(Card *) cardAtIndex:(NSUInteger) index;
-(void) startGame:(BOOL) testMode;

@property (nonatomic) int score;
@property (strong, nonatomic) NSMutableArray *cards;

@end
