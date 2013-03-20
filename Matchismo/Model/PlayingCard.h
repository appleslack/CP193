//
//  PlayingCard.h
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;      // 1 - 14 (1 - Ace)

+(NSArray *)validSuits;
+(NSUInteger) maxRank;

@end
