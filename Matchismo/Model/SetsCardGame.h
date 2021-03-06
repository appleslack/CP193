//
//  SetsCardGame.h
//  Matchismo
//
//  Created by Stuart Slack on 3/20/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "CardGame.h"

@interface SetsCardGame : CardGame

// Public for unit testing purposes
+(BOOL) matchSet:(NSArray *) selectedCards;

-(void) selectCardAtIndex:(NSUInteger) index;

@property (strong, nonatomic) NSMutableArray *selectedCards;

@end
