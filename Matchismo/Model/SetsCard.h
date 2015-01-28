//
//  SetsCard.h
//  Matchismo
//
//  Created by Stuart Slack on 3/21/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "Card.h"

typedef enum {
    kCardColorRed       =   1<<0,
    kCardColorPurple    =   1<<1,
    kCardColorGreen     =   1<<2
} kSGCardColor;

typedef enum {
    kCardShadeSolid     =   1<<0,
    kCardShadeOpen      =   1<<1,
    kCardShadeStripped  =   1<<2,
} kSGCardShading;

typedef enum {
    kCardSymbolSwiggles =   1<<0,
    kCardSymbolDiamonds =   1<<1,
    kCardSymbolOvals    =   1<<2,
} kSGCardSymbol;

typedef enum {
    kCardOneSymbol      =   1<<0,
    kCardTwoSymbols     =   1<<1,
    kCardThreeSymbols   =   1<<2
} kSGCardNumSymbols;

@interface SetsCard : Card

+(id) cardWithNumSymbols:(int)numSymbols color:(kSGCardColor)color shading:(kSGCardShading)shading symbol:(kSGCardSymbol) symbol;

@property (nonatomic) BOOL              isSelected;
@property (nonatomic) kSGCardColor      color;
@property (nonatomic) kSGCardShading    shading;
@property (nonatomic) kSGCardSymbol     symbol;
@property (nonatomic) int               numSymbols;

@end
