//
//  MatchingGameViewController.m
//  Matchismo
//
//  Created by Stuart Slack on 3/7/13.
//  Copyright (c) 2013 Redtail Software, Inc. All rights reserved.
//

#import "MatchingGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"
#import "Card.h"

@interface MatchingGameViewController ()
-(void) updateUI;

@property (nonatomic) int flipCount;
@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastFlipLabel;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@end

@implementation MatchingGameViewController

-(CardMatchingGame *) game
{
    if( nil == _game ) {
        _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                  usingDeck:[PlayingCardDeck new]];
    }
    return _game;
}

-(void) updateUI
{
    for( UIButton *cardButton in self.cardButtons ) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];

        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable?0.3:1.0;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    }
    self.lastFlipLabel.text = [self.game lastFlipResultString];
    
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

- (void)viewDidLoad
{
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.lastFlipLabel.text = @"";

}

- (IBAction)dealCards
{
    [self.game startGame:FALSE];
    [self updateUI];
}

- (IBAction)flipCard:(CardButton *)sender
{
    self.lastFlipLabel.text = @"";
    
    NSUInteger index = [self.cardButtons indexOfObject:sender];
    if( NSNotFound != index ) {
        [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
        self.flipCount++;
        [self updateUI];
    }
    else {
        self.lastFlipLabel.text = @"Error - card not found";
        [self updateUI];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    //  update the flip count now
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}

@end
