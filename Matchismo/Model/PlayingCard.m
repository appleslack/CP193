//
//  PlayingCard.m
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "PlayingCard.h"

@interface PlayingCard ()
@end

@implementation PlayingCard

@synthesize suit = _suit;

+(NSArray *) validSuits
{
    return @[@"❤️", @"♦️", @"♠️", @"♣️"];
}

+(NSArray *) rankStrings
{
    return @[@"?", @"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K",@"A",];
}+(NSUInteger) maxRank
{
    return [self rankStrings].count - 1;
}

-(NSString *)contents
{
    return [[[self class] rankStrings][self.rank] stringByAppendingString:self.suit];
}

-(NSString *) suit
{
    return _suit ? _suit : @"?";
}

-(void) setSuit:(NSString *) suit
{
    if( [[[self class]validSuits] containsObject:suit] )
    {
        _suit = suit;
    }
}

-(void) setRank:(NSUInteger)rank
{
    if( rank <= [[self class] maxRank]) {
        _rank = rank;
    }
}
#define SUIT_MATCH_VAL  1
#define RANK_MATCH_VAL  4

-(int) match:(NSArray *)otherCards
{
    int matchScore = 0;
    for( PlayingCard *card in otherCards ) {
        if( [card.suit isEqualToString: self.suit] ) {
            matchScore += SUIT_MATCH_VAL;
        }
        if( card.rank == self.rank ) {
            matchScore += RANK_MATCH_VAL;
        }
    }
    return matchScore;
}

@end
