//
//  ViewController.h
//  TicTacToe
//
//  Created by Martin Berger on 9/13/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UILabel *winnerLabel;
@property (weak, nonatomic) IBOutlet UILabel *xScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *oScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *tieScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *whoPlaysLabel;
@property (weak, nonatomic) IBOutlet UILabel *leadershipLabel;
- (IBAction)buttonClicked:(id)sender;
- (IBAction)startNewGame:(id)sender;


@end

