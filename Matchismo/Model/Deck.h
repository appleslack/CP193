//
//  Deck.h
//  Matchismo
//
//  Created by Stuart Slack on 3/13/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
-(void) addCard:(Card *)card atTop:(BOOL) atTop;
-(Card *) drawRandomCard;
@end
