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

@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
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
    if( card.cardShape == kCardShapeDiamond ) {
        shapeChar = @"♦️";
    }
    else if( card.cardShape == kCardShapeOval ) {
        shapeChar = @"🔴";
    }
    else {
        shapeChar = @"➰";
    }
    for( int inx=0; inx<card.numShapes; inx++ ) {
        [string appendString:shapeChar];
    }
    UIColor *colorVal = nil;
    if( card.cardColor == kCardColorGreen ) {
        colorVal = [UIColor greenColor];
    }
    else if( card.cardColor == kCardColorPurple ) {
        colorVal = [UIColor purpleColor];
    }
    else {
        colorVal = [UIColor redColor];
    }
    
    NSMutableAttributedString *titleString = [[NSMutableAttributedString alloc] initWithString:string];
    
    
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
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
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
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

@end
