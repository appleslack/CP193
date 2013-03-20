//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "CardMatchingGame.h"
@interface CardMatchingGame()

@property (strong, nonatomic) NSMutableArray *cards;
@property (strong, nonatomic) Deck *deck;

@property (nonatomic)         int cardCount;
@property (nonatomic) int score;
@end

@implementation CardMatchingGame
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

    self.lastFlipResultString = @"";
}

-(Card *) cardAtIndex:(NSUInteger) index
{
    return index < self.cards.count ? self.cards[index] : nil;
}

#define MATCH_BONUS 4
#define MISMATCH_PENALTY 2
#define FLIP_COST 1

-(void) flipCardAtIndex:(NSUInteger) index
{
    Card *card = [self cardAtIndex:index];

    BOOL resultSet = NO;
    
    if(!card.isUnplayable) {
        if( !card.isFaceUp ) {
            // See if we make a match!
            for ( Card *otherCard in self.cards ) {
                if( card != otherCard && otherCard.isFaceUp && !otherCard.isUnplayable ) {
                    int matchScore = [card match:@[otherCard]];
                    if( matchScore ) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        self.score += matchScore*MATCH_BONUS;
                        [self setLastFlipResultString: [NSString stringWithFormat:@"Matched %@ & %@: %d points!", [card contents], [otherCard contents], matchScore*MATCH_BONUS]];
                        resultSet = YES;
                    }
                    else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENALTY;
                        [self setLastFlipResultString: [NSString stringWithFormat:@"%@ & %@ don't match: -%d points!", [card contents], [otherCard contents], MISMATCH_PENALTY]];
                        resultSet = YES;
                    }
                }
            }
            self.score -= FLIP_COST;
            if( !resultSet ) {
                [self setLastFlipResultString: [NSString stringWithFormat:@"Flipped up %@: -%d points", [card contents], FLIP_COST]];
            }
        }
        card.faceUp = !card.isFaceUp;
    }
}


@end
