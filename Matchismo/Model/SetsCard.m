//
//  SetsCard.m
//  Matchismo
//
//  Created by Stuart Slack on 3/21/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "SetsCard.h"

@implementation SetsCard
// Need to answer this basic premise:
/* A SET is 3 cards in which each individual feature is either:
      ALL THE SAME on each card  
        (OR)
      ALL DIFFERENT on each card

 EX:  NOT A SET!  Two have TWO symbols and one does not.
 */

+(id) cardWithNumSymbols:(int)numSymbols color:(kSGCardColor)color shading:(kSGCardShading)shading symbol:(kSGCardSymbol) symbol
{
    SetsCard *card = [SetsCard new];
    card.numSymbols = numSymbols;
    card.color = color;
    card.shading = shading;
    card.symbol = symbol;
    
    return card;
}

-(NSString *) numberStr
{
    if( self.numSymbols == kCardOneSymbol)
        return @"One";
    else if(self.numSymbols == kCardOneSymbol)
        return @"Two";
    else
        return @"Three";
}

-(NSString *) colorStr
{
    if( self.color == kCardColorRed )
        return @"Red";
    else if( self.color == kCardColorGreen)
        return @"Green";
    else
        return @"Purple";
}

-(NSString *) shadingStr
{
    if( self.shading == kCardShadeOpen )
        return @"Open";
    else if( self.shading == kCardShadeStripped )
        return @"Stripped";
    else
        return @"Solid";
}

-(NSString *) symbolStr
{
    NSString *symbolStr;
    
    if( self.symbol == kCardSymbolDiamonds ) {
        if(self.numSymbols==kCardOneSymbol) {
            symbolStr = @"Diamond";
        }
        else {
            symbolStr = @"Diamonds";
        }
    }
    else if( self.symbol == kCardSymbolOvals ) {
        if(self.numSymbols==kCardOneSymbol) {
            symbolStr = @"Oval";
        }
        else {
            symbolStr = @"Ovals";
        }
    }
    else {
        if(self.numSymbols==kCardOneSymbol) {
            symbolStr = @"Swiggle";
        }
        else {
            symbolStr = @"Swiggles";
        }
    }
    
    return symbolStr;
}

// This is to have a mapping of card -> UIButtons.  Just return a unique NSString for every type
-(NSString *) contents
{
    NSString *colorStr = [self colorStr];
    NSString *numberStr = [self numberStr];
    NSString *shadeStr = [self shadingStr];
    NSString *symbolStr = [self symbolStr];

    return [NSString stringWithFormat:@"%@%@%@%@", numberStr, shadeStr, colorStr,symbolStr];
}

-(NSString *) description
{   // Card has 2 Solid Red Squirleys
    NSString *colorStr = [self colorStr];
    NSString *numberStr = [self numberStr];
    NSString *shadeStr = [self shadingStr];
    NSString *symbolStr = [self symbolStr];
    
    return [NSString stringWithFormat:@"Card has %@ %@ %@ %@",
            numberStr,
            shadeStr,
            colorStr,
            symbolStr
            ];
}

@end
