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

-(id) cardWithNumSymbols:(int)numSymbols color:(kSGCardColor)color shading:(kSGCardShading)shading symbol:(kSGCardSymbol) symbol
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
    NSMutableString *str = [NSMutableString new];
    [str appendFormat:@"Card has %d", self.numSymbols];
    NSString *colorStr = nil;

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
        symbolStr = @"Diamonds";
    }
    else if( self.symbol == kCardSymbolOvals ) {
        symbolStr = @"Ovals";
    }
    else {
        symbolStr = @"Swiggles";
    }
    
    return [NSString stringWithFormat:@"Card has %d %@ %@ %@",
            self.numSymbols,
            shadeStr,
            colorStr,
            symbolStr
            ];
}

@end
