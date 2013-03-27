//
//  SetsCard.m
//  Matchismo
//
//  Created by Stuart Slack on 3/21/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "SetsCard.h"

@implementation SetsCard

// Given this card I want to see if there are other cards up that match.
// This method will get called once there are three cards flipped up and
// check the last card flipped against the other two currently flipped cards.
// Return TRUE if set completed properly, NO otherwise.

// Match Examples:
// All different Numbers - All different Colors - All different Symbols - All different Shadings
// All have 3 - All are Red - All different Symbols - All different Shadings
// All different Numbers - All are Red - All are Ovals - All different Shadings
// All different Numbers - All different Colors - All different Symbols - All are Empty
#define MATCH_COLOR     1<<3
#define MATCH_SHAPE     1<<2
#define MATCH_FILL      1<<1
#define MATCH_NUMBER    1<<0
#define MATCH_ALL       MATCH_COLOR&MATCH_SHAPE&MATCH_FILL&MATCH_NUMBER
#define MATCH_NONE      0

// Need to answer this basic premise:
/* A SET is 3 cards in which each individual feature is either:
      ALL THE SAME on each card  
        (OR)
      ALL DIFFERENT on each card

 EX:  NOT A SET!  Two have TWO symbols and one does not.
 */

-(BOOL) completesSet:(NSArray *) otherFlippedCards
{
    BOOL matched = NO;
    
    if( otherFlippedCards.count == 2 ) {
        SetsCard *firstCard = (SetsCard *)otherFlippedCards[0];
        SetsCard *secondCard = (SetsCard *)otherFlippedCards[1];
//        BOOL matchColor = NO, matchFill = NO, matchShape = NO, matchNumber = NO;
        NSUInteger matchResult = 0;
        
        // Check to see if all suits same or not same
        if( self.cardColor == firstCard.cardColor == secondCard.cardColor ) {
            matchResult &= MATCH_COLOR;
//            matchColor = TRUE;
        }
        if( self.cardShape == firstCard.cardShape == secondCard.cardShape ) {
            matchResult &= MATCH_SHAPE;
        }
        if( self.cardFill == firstCard.cardFill == secondCard.cardFill ) {
            matchResult &= MATCH_FILL;
        }
        if( self.numShapes == firstCard.numShapes == secondCard.numShapes ) {
            matchResult &= MATCH_NUMBER;
        }
        
        // 1st Case:  Nothing is the same
        if( matchResult == 0 ) {
            NSLog(@"All different Numbers - All different Colors - All different Symbols - All different Shadings!");
            matched = TRUE;
        }
        // 2nd Case:  Only 1 matched, none of the others (Ex: color match, none others)
        if( (MATCH_COLOR && matchResult) == matchResult ) {
            NSLog(@"Matched COLOR everything else is different");
            matched = TRUE;
        }
        else if( (MATCH_SHAPE && matchResult) == matchResult) {
            NSLog(@"Matched SHAPE - everything else is different");
            matched = TRUE;
        }
        else if( (MATCH_FILL && matchResult) == matchResult) {
            NSLog(@"Matched FILL - everything else is different");
            matched = TRUE;
        }
        else if( (MATCH_NUMBER && matchResult) == matchResult) {
            NSLog(@"Matched NUMBER - everything else is different");
            matched = TRUE;
        }
        
    }
    
    NSLog(@"Returing match result: %@", matched?@"YES" : @"NO");
    return matched;
}

@end
