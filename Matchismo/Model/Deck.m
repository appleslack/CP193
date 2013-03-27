//
//  Deck.m
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "Deck.h"
@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *) cards
{
    if( nil == _cards ) {
        _cards = [NSMutableArray new];
    }
    return _cards;
}

-(void) addCard:(Card *)card atTop:(BOOL) atTop
{
    if( atTop ) {
        [self.cards insertObject:card atIndex:0];
    }
    else {
        [self.cards addObject:card];
    }
}

-(Card *) drawRandomCard
{
    Card *retCard = nil;
    
    if( self.cards.count > 0 ) {
        unsigned index = arc4random() % self.cards.count;
        retCard = self.cards[index];

        [self.cards removeObjectAtIndex:index];
    }
    return retCard;
}

-(Card *) cardAtIndex:(NSUInteger) index
{
    return self.cards[index];
}

// Return <class> has %d cards: card[0].description, card[1].description, ... card[n-1].description

-(NSString *) description
{
    NSMutableString *desc = [NSMutableString stringWithFormat:@"%@ has %d cards: ", [[self class]description], self.cards.count];
    for( int inx=0; inx<self.cards.count; inx++ ) {
        [desc appendFormat:@"%@, ", [self.cards[inx] description]];
    }

    return desc;
}

@end
