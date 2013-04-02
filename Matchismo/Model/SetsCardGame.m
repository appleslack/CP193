//
//  SetsCardGame.m
//  Matchismo
//
//  Created by Stuart Slack on 3/20/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "SetsCardGame.h"
#import "SetsCard.h"

@interface SetsCardGame()

@property (strong, nonatomic) NSMutableArray *selectedCards;
@property (strong, nonatomic) NSArray *lastMatchedSet;
@end

@implementation SetsCardGame

-(NSMutableArray *) selectedCards
{
    if( _selectedCards == nil ) {
        _selectedCards = [NSMutableArray new];
    }
    return _selectedCards;
}

-(void) selectCardAtIndex:(NSUInteger) index
{
    SetsCard *card = (SetsCard *)[self cardAtIndex:index];
    
    if(!card.isUnplayable) {
        if( !card.isSelected ) {
            // Put the newly selected card in the array of selected cards.
            [self.selectedCards addObject:card];
            if( self.selectedCards.count == 3 ) {
                // MATCH THEM!
                BOOL match = [self matchSet:self.selectedCards];
                if( match ){
                    NSLog(@"Match Found!!!");
                    
                    // If they match - make them all unplayable then
                }
                for( SetsCard *card in self.selectedCards ) {
                    card.unplayable = match;
                }
                self.lastMatchedSet = self.selectedCards;
                self.selectedCards = nil;
            }
//            if( !resultSet ) {
//                [self setLastFlipResultString: [NSString stringWithFormat:@"Flipped up %@: -%d points", [card contents], FLIP_COST]];
//            }
        }
        card.isSelected = !card.isSelected;
    }
}


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

-(BOOL) matchSet:(NSArray *) selectedCards
{
    BOOL matched = NO;
    
    if( selectedCards.count == 3 ) {
        SetsCard *firstCard = (SetsCard *)selectedCards[0];
        SetsCard *secondCard = (SetsCard *)selectedCards[1];
        SetsCard *thirdCard = (SetsCard *)selectedCards[2];
        
        //        BOOL matchColor = NO, matchFill = NO, matchShape = NO, matchNumber = NO;
        NSUInteger matchResult = 0;
        
        // Check to see if all suits same or not same
        if( thirdCard.color == firstCard.color == secondCard.color ) {
            matchResult &= MATCH_COLOR;
            //            matchColor = TRUE;
        }
        if( thirdCard.symbol == firstCard.symbol == secondCard.symbol ) {
            matchResult &= MATCH_SHAPE;
        }
        if( thirdCard.shading == firstCard.shading == secondCard.shading ) {
            matchResult &= MATCH_FILL;
        }
        if( thirdCard.numSymbols == firstCard.numSymbols == secondCard.numSymbols ) {
            matchResult &= MATCH_NUMBER;
        }
        NSLog(@"Attempting to match:  \n%@\n%@\n%@", thirdCard, firstCard, secondCard);
        
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

//-(void) match
//{
//    // See if we make a match!
//    for ( Card *otherCard in self.cards ) {
//        if( card != otherCard && otherCard.isFaceUp && !otherCard.isUnplayable ) {
//            int matchScore = [card match:@[otherCard]];
//            if( matchScore ) {
//                otherCard.unplayable = YES;
//                card.unplayable = YES;
//                self.score += matchScore*MATCH_BONUS;
//                [self setLastFlipResultString: [NSString stringWithFormat:@"Matched %@ & %@: %d points!", [card contents], [otherCard contents], matchScore*MATCH_BONUS]];
//                resultSet = YES;
//            }
//            else {
//                otherCard.faceUp = NO;
//                self.score -= MISMATCH_PENALTY;
//                [self setLastFlipResultString: [NSString stringWithFormat:@"%@ & %@ don't match: -%d points!", [card contents], [otherCard contents], MISMATCH_PENALTY]];
//                resultSet = YES;
//            }
//        }
//    }
//}

@end
