//
//  SetsCardDeck.m
//  Matchismo
//
//  Created by Stuart Slack on 3/21/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "SetsCardDeck.h"
#import "SetsCard.h"

@interface SetsCardDeck()
@end

@implementation SetsCardDeck

-(id) init
{
    if( (self = [super init])) {
        [self _setupDeck];
    }
    
    return self;
}
#define NUM_COLORS 3
#define NUM_SHAPES 3
#define NUM_FILLS 3

//  There are 81 cards total
//  3 colors * 3 shades * 3 shapes * 3 (num shapes) = 81 cards
-(void) _setupDeck
{
    for( int inx=0; inx<NUM_COLORS; inx++ ) {
        for( int jnx=0; jnx<NUM_SHAPES; jnx++ ) {
            for( int knx=0;knx<NUM_FILLS;knx++) {
                for( int numShapes=1; numShapes <= 3; numShapes++ ) {
                    SetsCard *card = [[SetsCard alloc] init];

                    card.color = (kSGCardColor)inx;
                    card.symbol = (kSGCardSymbol) jnx;
                    card.shading = (kSGCardShading) knx;
                    card.numSymbols = numShapes;
                    
                    [self addCard:card atTop:TRUE];
                }
            }
        }
    }
}

@end
