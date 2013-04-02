//
//  SetsCardGameViewController.m
//  Matchismo
//
//  Created by Stuart Slack on 3/20/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "SetsCardGameViewController.h"
#import "CardGame.h"
#import "SetsCardGame.h"
#import "SetsCardDeck.h"
#import "SetsCard.h"

@interface SetsCardGameViewController ()
-(void) drawButton:(UIButton *)button withCard:(Card *)card;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastResultLabel;

@property (strong, nonatomic) SetsCardGame *game;

@end

@implementation SetsCardGameViewController

-(void) drawButton:(UIButton *)button withCard:(SetsCard *)card;
{
    NSMutableString *string = [NSMutableString new];
    NSString *shapeChar = nil;
    if( card.symbol == kCardSymbolDiamonds ) {
        shapeChar = @"♦︎";
    }
    else if( card.symbol == kCardSymbolOvals ) {
        shapeChar = @"●";
    }
    else {
        shapeChar = @"◼︎";
    }
    for( int inx=0; inx<card.numSymbols ; inx++ ) {
        [string appendString:shapeChar];
    }
    UIColor *colorVal = nil;
    if( card.color == kCardColorGreen ) {
        colorVal = [UIColor greenColor];
    }
    else if( card.color == kCardColorPurple ) {
        colorVal = [UIColor purpleColor];
    }
    else {
        colorVal = [UIColor redColor];
    }
    // Shading: kCardFillSolid,    kCardFillPattern,    kCardFillEmpty
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:string];
    NSMutableDictionary *attributes = [NSMutableDictionary new];
    [attributes setObject:[UIFont systemFontOfSize:18]  forKey:NSFontAttributeName];

    // If empty,
    if( card.shading == kCardShadeOpen ) {
        [attributes setObject:[UIColor whiteColor]  forKey:NSForegroundColorAttributeName];
        [attributes setObject:@-5                   forKey:NSStrokeWidthAttributeName];
        [attributes setObject:colorVal              forKey:NSStrokeColorAttributeName];
    }
    else if( card.shading == kCardShadeStripped ) {
        UIColor *transparentColorVal = [colorVal colorWithAlphaComponent:0.1];
        [attributes setObject:transparentColorVal  forKey:NSForegroundColorAttributeName];
        [attributes setObject:@-5                   forKey:NSStrokeWidthAttributeName];
        [attributes setObject:colorVal              forKey:NSStrokeColorAttributeName];
    }
    else {
        [attributes setObject:colorVal  forKey:NSForegroundColorAttributeName];
    }
    [titleString setAttributes:attributes range:NSMakeRange(0, [string length])];
    
    [button setAttributedTitle:titleString forState:UIControlStateNormal];
    
}

-(SetsCardGame *) game
{
    if( nil == _game ) {
        _game = [[SetsCardGame alloc] initWithCardCount:self.cardButtons.count
                                              usingDeck:[SetsCardDeck new]];

    }
    return _game;
}

-(void) updateUI
{
    for( UIButton *cardButton in self.cardButtons ) {
        SetsCard *card = (SetsCard *)[self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
//        [cardButton setTitle:card.contents forState:UIControlStateSelected];
//        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        [self drawButton:cardButton withCard:card];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable?0.3:1.0;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
//    self.lastResultLabel.text = [self.game lastFlipResultString];
}

-(void) setCardButtons:(NSArray *)cardButtons
{
    //    for( UIButton *button in cardButtons ) {
    //        Card *card = [self.deck drawRandomCard];
    //        [button setTitle:card.contents forState:UIControlStateSelected];
    //    }
    _cardButtons = cardButtons;
    [self updateUI];
}

- (IBAction)chooseCard:(id)sender
{
    SetsCard *card = (SetsCard *)[self.game cardAtIndex:[self.cardButtons indexOfObject:(UIButton *)sender]];
    NSLog(@"You selected: %@", card);
    
    [self.game selectCardAtIndex:[self.cardButtons indexOfObject:(UIButton *)sender]];
    
    [self updateUI];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
