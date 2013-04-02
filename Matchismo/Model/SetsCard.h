//
//  SetsCard.h
//  Matchismo
//
//  Created by Stuart Slack on 3/21/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "Card.h"

typedef enum {
    kCardColorRed,
    kCardColorPurple,
    kCardColorGreen
} kSGCardColor;

typedef enum {
    kCardShadeSolid,
    kCardShadeOpen,
    kCardShadeStripped
} kSGCardShading;

typedef enum {
    kCardSymbolSwiggles,
    kCardSymbolDiamonds,
    kCardSymbolOvals
} kSGCardSymbol;

@interface SetsCard : Card

@property (nonatomic) BOOL              isSelected;
@property (nonatomic) kSGCardColor      color;
@property (nonatomic) kSGCardShading    shading;
@property (nonatomic) kSGCardSymbol     symbol;
@property (nonatomic) int               numSymbols;

@end
