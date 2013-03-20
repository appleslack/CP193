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

@end
