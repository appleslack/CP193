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
    kCardFillSolid,
    kCardFillPattern,
    kCardFillEmpty
} kSGCardFill;

typedef enum {
    kCardShapeSwiggles,
    kCardShapeDiamond,
    kCardShapeOval
} kSGCardShape;

@interface SetsCard : Card

@property (nonatomic) kSGCardColor cardColor;
@property (nonatomic) kSGCardFill  cardFill;
@property (nonatomic) kSGCardShape cardShape;
@property (nonatomic) int         numShapes;

@end
