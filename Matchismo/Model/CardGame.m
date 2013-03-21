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
        [self startGame];
    }
    
    return self;
}

-(void) startGame
{
    NSMutableArray *newCards = [NSMutableArray array];
    for( int inx=0; inx<self.cardCount; inx++ ) {
        newCards[inx] = [self.deck drawRandomCard];
    }
    self.cards = newCards;
    self.score = 0;
    
}

-(Card *) cardAtIndex:(NSUInteger) index
{
    return index < self.cards.count ? self.cards[index] : nil;
}

@end
