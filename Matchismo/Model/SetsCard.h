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
} SGCardColor;

typedef enum {
    kCardFillSolid,
    kCardFillPattern,
    kCardFillEmpty
}SGCardFill;

typedef enum {
    kCardShapeSwiggles,
    kCardShapeDiamond,
    kCardShapeOval
} SGCardShape;

@interface SetsCard : Card

@property (nonatomic) SGCardColor cardColor;
@property (nonatomic) SGCardFill  cardFill;
@property (nonatomic) SGCardShape cardShape;
@property (nonatomic) int         numShapes;

@end
