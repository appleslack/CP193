//
//  CardGame.m
//  Matchismo
//
//  Created by Stuart Slack on 3/20/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "CardGame.h"
#import "Deck.h"
#import "Card.h"

@interface CardGame()
@property (strong, nonatomic) Deck *deck;
@property (nonatomic)         int cardCount;

@end

@implementation CardGame
-(id) initWithCardCount:(NSUInteger) cardCount usingDeck:(Deck *) deck
{
    if( (self = [super init] ) ) {
        _deck = deck;
        _cardCount = cardCount;
        [self startGame:FALSE];
    }
    
    return self;
}

-(void) startGame:(BOOL) testMode
{
    NSMutableArray *newCards = [NSMutableArray array];
    if( !testMode ) {
        for( int inx=0; inx<self.cardCount; inx++ ) {
            newCards[inx] = [self.deck drawRandomCard];
        }
    }
    // For testing purposes, I want to have cards in known positions so I can pull out of the deck
    // and do various unit tests with preset card sets.
    else {
        for( int inx=0; inx<self.cardCount; inx++ ) {
            newCards[inx] = [self.deck cardAtIndex:inx];
        }
    }
    self.cards = newCards;
    self.score = 0;
    
}

-(Card *) cardAtIndex:(NSUInteger) index
{
    return index < self.cards.count ? self.cards[index] : nil;
}

@end
