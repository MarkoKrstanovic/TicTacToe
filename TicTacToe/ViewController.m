//
//  ViewController.m
//  TicTacToe
//
//  Created by Martin Berger on 9/13/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
bool turn;
int turn_count;
    bool didWin;
    int x;
    int o;
    int tie;
}
-(void)disableButtons;
-(void)enableButtons;
-(void)setButtonsTitles;
@end

@implementation ViewController

- (void)viewDidLoad {
    turn = true; // true za x , false za o
    turn_count = 0;
    x=0;
    o=0;
    tie=0;
    [super viewDidLoad];
    self.whoPlaysLabel.text = @"X";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    UIButton *b = sender;
    if (turn) {
        [b setTitle:@"X" forState:UIControlStateNormal];
    } else
        [b setTitle:@"O" forState:UIControlStateNormal];
    
    turn = !turn;
    if(turn == true) {
        self.whoPlaysLabel.text =@"X";
    } else
        self.whoPlaysLabel.text = @"O";
    b.enabled = NO;
    turn_count++;
    
    [self checkForWinner];
}

- (IBAction)startNewGame:(id)sender {
  
    turn = true;
    turn_count = 0;
    self.winnerLabel.text = @"";
    didWin= false;
    [self setButtonsTitles];
    [self enableButtons];
    self.whoPlaysLabel.text = @"X";
    
    if (x>o) {
        self.leadershipLabel.text = @"X is on fire";
    } else if (x<o) {
        self.leadershipLabel.text = @"O is kicking some ass";
    } else if (x==o) {
        self.leadershipLabel.text = @"Score is tied";
    }
}



-(void)checkForWinner{
    bool isThereWinner = false;
    didWin = isThereWinner;
    if ([self.button1.currentTitle isEqualToString: self.button2.currentTitle] && [self.button2.currentTitle isEqualToString: self.button3.currentTitle] && (!self.button1.isEnabled) && (!self.button2.isEnabled) && (!self.button3.isEnabled))  {
        isThereWinner = true;
    }
    else if ([self.button4.currentTitle isEqualToString: self.button5.currentTitle] && [self.button5.currentTitle isEqualToString: self.button6.currentTitle] && (!self.button4.isEnabled) && (!self.button5.isEnabled) && (!self.button6.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button7.currentTitle isEqualToString: self.button8.currentTitle] && [self.button8.currentTitle isEqualToString: self.button9.currentTitle] && (!self.button7.isEnabled) && (!self.button8.isEnabled) && (!self.button9.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button1.currentTitle isEqualToString: self.button4.currentTitle] && [self.button4.currentTitle isEqualToString: self.button7.currentTitle] && (!self.button1.isEnabled) && (!self.button4.isEnabled) && (!self.button7.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button2.currentTitle isEqualToString: self.button5.currentTitle] && [self.button5.currentTitle isEqualToString: self.button8.currentTitle] && (!self.button2.isEnabled) && (!self.button5.isEnabled) && (!self.button8.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button3.currentTitle isEqualToString: self.button6.currentTitle] && [self.button6.currentTitle isEqualToString: self.button9.currentTitle] && (!self.button3.isEnabled) && (!self.button6.isEnabled) && (!self.button9.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button1.currentTitle isEqualToString: self.button5.currentTitle] && [self.button5.currentTitle isEqualToString: self.button9.currentTitle] && (!self.button1.isEnabled) && (!self.button5.isEnabled) && (!self.button9.isEnabled)) {
        isThereWinner = true;
    }
    else if ([self.button3.currentTitle isEqualToString: self.button5.currentTitle] && [self.button5.currentTitle isEqualToString: self.button7.currentTitle] && (!self.button1.isEnabled) && (!self.button5.isEnabled) && (!self.button7.isEnabled)) {
        isThereWinner = true;
    }
    
    if (isThereWinner) {
        [self disableButtons];
        NSString *winner = [[NSString alloc] init];
        if(turn){
            winner = @"O";
            o++;
            self.oScoreLabel.text = [NSString stringWithFormat:@"%d",o];
            
    
        }
        else {
        winner = @"X";
            x++;
            self.xScoreLabel.text = [NSString stringWithFormat:@"%d",x];
        }
        self.winnerLabel.text = [NSString stringWithFormat:@"Winner is %@",winner];
        
    }
    else if (turn_count==9){
        tie++;
        self.winnerLabel.text = @"It's a tie!!!";
        self.tieScoreLabel.text = [NSString stringWithFormat:@"%d",tie];
        self.whoPlaysLabel.text = @"---";
    }
}
-(void)disableButtons {
    self.button1.enabled = NO;
    self.button2.enabled = NO;
    self.button3.enabled = NO;
    self.button4.enabled = NO;
    self.button5.enabled = NO;
    self.button6.enabled = NO;
    self.button7.enabled = NO;
    self.button8.enabled = NO;
    self.button9.enabled = NO;
}
-(void)enableButtons {
    self.button1.enabled = YES;
    self.button2.enabled = YES;
    self.button3.enabled = YES;
    self.button4.enabled = YES;
    self.button5.enabled = YES;
    self.button6.enabled = YES;
    self.button7.enabled = YES;
    self.button8.enabled = YES;
    self.button9.enabled = YES;
}
-(void)setButtonsTitles {
    
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    [self.button2 setTitle:@"" forState:UIControlStateNormal];
    [self.button3 setTitle:@"" forState:UIControlStateNormal];
    [self.button4 setTitle:@"" forState:UIControlStateNormal];
    [self.button5 setTitle:@"" forState:UIControlStateNormal];
    [self.button6 setTitle:@"" forState:UIControlStateNormal];
    [self.button7 setTitle:@"" forState:UIControlStateNormal];
    [self.button8 setTitle:@"" forState:UIControlStateNormal];
    [self.button9 setTitle:@"" forState:UIControlStateNormal];
}
@end
