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

-(NSString *) description
{   // Card has 2 Solid Red Squirleys
    NSString *colorStr = nil;
    NSString *numberStr = nil;
    
    if( self.numSymbols == kCardOneSymbol) {
        numberStr = @"One";
    }
    else if(self.numSymbols == kCardOneSymbol) {
        numberStr = @"Two";
    }
    else
        numberStr = @"Three";
    
    if( self.color == kCardColorRed )
        colorStr = @"Red";
    else if( self.color == kCardColorGreen)
        colorStr = @"Green";
    else colorStr = @"Purple";

    NSString *shadeStr = nil;
    if( self.shading == kCardShadeOpen ) {
        shadeStr = @"Open";
    }
    else if( self.shading == kCardShadeStripped ) {
        shadeStr = @"Stripped";
    }
    else {
        shadeStr = @"Solid";
    }
    NSString *symbolStr = nil;
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
    
    return [NSString stringWithFormat:@"Card has %@ %@ %@ %@",
            numberStr,
            shadeStr,
            colorStr,
            symbolStr
            ];
}

@end
