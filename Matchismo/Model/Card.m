//
//  Card.m
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int) match:(NSArray *) otherCards
{
    int matchScore = 0;
    
    for( Card *card in otherCards) {
        if( [card.contents isEqualToString:self.contents] ) {
            matchScore = 1;
        }
    }
    return matchScore;
}

@end
