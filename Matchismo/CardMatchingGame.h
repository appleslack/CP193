//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"
#import "CardGame.h"

@interface CardMatchingGame : CardGame

-(void) flipCardAtIndex:(NSUInteger) index;


/* Returns a string describing the result of the last flip:
 *   If matching:                   "Matched C1 & C2: x points"
 *   Flip no match or mismatch:     "Flipped up C1:  -1 point for flip"
 *   Flip mismatch:                 "C1 & C2 don't match: -2 point penalty"
*/
// -(NSString *) lastFlipResultString;

@property (strong, nonatomic) NSString *lastFlipResultString;

@end
