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
                BOOL match = [[self class] matchSet:self.selectedCards];
                if( match ){
                    NSLog(@"Match Found!!!");
                    
                    // If they match - make them all unplayable then
                }
                for( SetsCard *card in self.selectedCards ) {
                    card.unplayable = match;
                    card.isSelected = NO;
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
#define MATCH_SYMBOL    1<<2
#define MATCH_SHADING   1<<1
#define MATCH_NUMBER    1<<0
#define MATCH_ALL       MATCH_COLOR&MATCH_SHAPE&MATCH_FILL&MATCH_NUMBER
#define MATCH_NONE      0
#define MATCH_THREE     (1<<0|1<<1|1<<2)

+(BOOL) matchSet:(NSArray *) selectedCards
{
    BOOL matched = NO;
    
    if( selectedCards.count == 3 ) {
        SetsCard *firstCard = (SetsCard *)selectedCards[0];
        SetsCard *secondCard = (SetsCard *)selectedCards[1];
        SetsCard *thirdCard = (SetsCard *)selectedCards[2];

        NSLog(@"Attempting to match:  \n%@\n%@\n%@", thirdCard, firstCard, secondCard);

        //        BOOL matchColor = NO, matchFill = NO, matchShape = NO, matchNumber = NO;
        NSUInteger matchResult = 0;
        kSGCardColor matchedColor =0;
        kSGCardShading matchedShading;
        kSGCardSymbol matchedSymbol;
        kSGCardNumSymbols matchedNumSymbols;
        int numMatched = 0;
        
        // Check to see if all suits same or not same
        if( thirdCard.color&firstCard.color&secondCard.color ) {
            numMatched++;
            matchResult &= MATCH_COLOR;
            matchedColor = firstCard.color;
        }
        // If they're not all the same then they need to be all different - check this
        else if( (firstCard.color|secondCard.color|thirdCard.color) != MATCH_THREE ) {
            NSLog(@"No match - TWO colors are the same and one is different");
            goto finished;
        }

        if( firstCard.symbol&secondCard.symbol&thirdCard.symbol ) {
            numMatched++;
            matchResult |= MATCH_SYMBOL;
            matchedSymbol = firstCard.symbol;
        }
        else if( (firstCard.symbol|secondCard.symbol|thirdCard.symbol) != MATCH_THREE ) {
            NSLog(@"No match - TWO symbols are the same and one is different");
            goto finished;
        }

        if( firstCard.shading&secondCard.shading&thirdCard.shading) {
            numMatched++;
            matchResult |= MATCH_SHADING;
            matchedShading = firstCard.shading;
        }
        else if( (firstCard.shading|secondCard.shading|thirdCard.shading) != MATCH_THREE ){
            NSLog(@"No match - TWO shadings are the same and one is different");
            goto finished;
        }
        
        if( firstCard.numSymbols&secondCard.numSymbols&thirdCard.numSymbols) {
            numMatched++;
            matchResult |= MATCH_NUMBER;
            matchedNumSymbols = firstCard.numSymbols;
        }
        else if( (firstCard.numSymbols|secondCard.numSymbols|thirdCard.numSymbols) != MATCH_THREE ) {
            NSLog(@"No match - TWO number symbols are the same and one is different");
            goto finished;
        }
        
        if( numMatched == 0 ) {
            NSLog(@"All different Numbers - All different Colors - All different Symbols - All different Shadings!");
            matched = TRUE;
        }
        else if( numMatched == 1 ) {
            NSLog(@"Good match - 1 the same!");
            matched = TRUE;
        }
        else if( numMatched == 3 ) {
            NSLog(@"Good match - all the same" );
            matched = TRUE;
        }
        else {
            NSLog(@"Cards to not make a valid set");
        }
        
//        // 1st Case:  Nothing is the same
//        if( matchResult == 0 ) {
//            NSLog(@"All different Numbers - All different Colors - All different Symbols - All different Shadings!");
//            matched = TRUE;
//        }
//        // 2nd Case:  Only 1 matched, none of the others (Ex: color match, none others)
//        if( (MATCH_COLOR & matchResult) == matchResult ) {
//            NSLog(@"Matched COLOR everything else is different");
//            matched = TRUE;
//        }
//        else if( (MATCH_SYMBOL & matchResult) == matchResult) {
//            NSLog(@"Matched SHAPE - everything else is different");
//            matched = TRUE;
//        }
//        else if( (MATCH_SHADING & matchResult) == matchResult) {
//            NSLog(@"Matched FILL - everything else is different");
//            matched = TRUE;
//        }
//        else if( (MATCH_NUMBER & matchResult) == matchResult) {
//            NSLog(@"Matched NUMBER - everything else is different");
//            matched = TRUE;
//        }
        
    }
    
finished:
    
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
