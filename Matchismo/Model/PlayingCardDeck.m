//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"
#import "Deck.h"

@implementation PlayingCardDeck

-(id) init
{
    if( (self = [super init])) {
        
        for( NSString *suit in [PlayingCard validSuits] ) {
            for( NSUInteger rank = 1; rank <= [PlayingCard maxRank]; rank++ ) {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.suit = suit;
                card.rank = rank;
                
                [self addCard:card atTop:TRUE];
            }
        }
    }
    
    return self;
}

@end
