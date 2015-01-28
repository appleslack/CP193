//
//  MatchismoTests.m
//  MatchismoTests
//
//  Created by Stuart Slack on 3/26/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "MatchismoTests.h"
#import "CardGame.h"
#import "SetsCard.h"
#import "SetsCardGame.h"

@implementation MatchismoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testDealSomeCards
{
    
    
//    STFail(@"Unit tests are not implemented yet in MatchismoTests");
}

-(void) testDoSomethingElse
{
//    STFail(@"Unit tests are not implemented yet in MatchismoTests");
    
}

-(void) testMatchingCards
{
    // Test Match 1:    All have 2 - All different Colors - All different Symbols - All different Shadings
    //                  2 Purple Open Diamonds
    //                  2 Red Solid Ovals
    //                  2 Green Stripped Swiggles
    NSArray *cardSet =
         @[
           [SetsCard cardWithNumSymbols:(int)kCardTwoSymbols color:kCardColorPurple shading:kCardShadeOpen symbol:kCardSymbolDiamonds],
           [SetsCard cardWithNumSymbols:(int)kCardTwoSymbols color:kCardColorRed shading:kCardShadeSolid symbol:kCardSymbolOvals],
           [SetsCard cardWithNumSymbols:(int)kCardTwoSymbols color:kCardColorGreen shading:kCardShadeStripped symbol:kCardSymbolSwiggles]
          ];
    BOOL matchSet = [SetsCardGame matchSet:cardSet];
    STAssertTrue(matchSet, @"The following should have matched: %@, %@, %@", cardSet[0], cardSet[1], cardSet[2]);

    cardSet =
    @[
      [SetsCard cardWithNumSymbols:(int)kCardTwoSymbols color:kCardColorPurple shading:kCardShadeOpen symbol:kCardSymbolDiamonds],
      [SetsCard cardWithNumSymbols:(int)kCardOneSymbol color:kCardColorRed shading:kCardShadeSolid symbol:kCardSymbolOvals],
      [SetsCard cardWithNumSymbols:(int)kCardTwoSymbols color:kCardColorGreen shading:kCardShadeStripped symbol:kCardSymbolSwiggles]
      ];
    matchSet = [SetsCardGame matchSet:cardSet];
    STAssertTrue(!matchSet, @"The following should NOT have matched: %@, %@, %@", cardSet[0], cardSet[1], cardSet[2]);

}

@end
