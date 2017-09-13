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
}
@end

@implementation ViewController

- (void)viewDidLoad {
    turn = true; // true za x , false za o
    turn_count = 0;
    [super viewDidLoad];
    
   
    // Do any additional setup after loading the view, typically from a nib.
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonClicked:(id)sender {
    UIButton *b = sender;
    if (turn) {
    [b setTitle:@"X" forState:UIControlStateNormal];
    }
    else
        [b setTitle:@"O" forState:UIControlStateNormal];
    
    turn = !turn;
    
    b.enabled = NO;
    turn_count++;
    
    [self checkForWinner];
}

- (IBAction)startNewGame:(id)sender {
  
    turn = true;
    turn_count = 0;
    self.winnerLabel.text = @"";
    didWin= false;
    
    [self.button1 setTitle:@"" forState:UIControlStateNormal];
    [self.button2 setTitle:@"" forState:UIControlStateNormal];
    [self.button3 setTitle:@"" forState:UIControlStateNormal];
    [self.button4 setTitle:@"" forState:UIControlStateNormal];
    [self.button5 setTitle:@"" forState:UIControlStateNormal];
    [self.button6 setTitle:@"" forState:UIControlStateNormal];
    [self.button7 setTitle:@"" forState:UIControlStateNormal];
    [self.button8 setTitle:@"" forState:UIControlStateNormal];
    [self.button9 setTitle:@"" forState:UIControlStateNormal];
    
    self.button1.enabled = YES;
    self.button2.enabled = YES;
    self.button3.enabled = YES;
    self.button4.enabled = YES;
    self.button5.enabled = YES;
    self.button6.enabled = YES;
    self.button7.enabled = YES;
    self.button8.enabled = YES;
    self.button9.enabled = YES;
    NSLog(@"ovo je nova igra");
}



-(void)checkForWinner{
    
    didWin = false;
    if ([self.button1.titleLabel.text isEqualToString:self.button2.titleLabel.text] && [self.button2.titleLabel.text isEqualToString:self.button3.titleLabel.text] && (!self.button1.isEnabled) && (!self.button2.isEnabled) && (!self.button3.isEnabled)){
        didWin = true;
    }
    else if ([self.button4.titleLabel.text isEqualToString:self.button5.titleLabel.text] && [self.button5.titleLabel.text isEqualToString:self.button6.titleLabel.text] && (!self.button4.isEnabled) &&(!self.button5.isEnabled) &&(!self.button6.isEnabled)) {
        didWin = true;
    }
    else if ([self.button7.titleLabel.text isEqualToString:self.button8.titleLabel.text] && [self.button8.titleLabel.text isEqualToString:self.button9.titleLabel.text] && (!self.button7.isEnabled)&& (!self.button8.isEnabled) &&(!self.button9.isEnabled)) {
        didWin = true;
    }
    else if ([self.button1.titleLabel.text isEqualToString:self.button5.titleLabel.text] && [self.button5.titleLabel.text isEqualToString:self.button9.titleLabel.text] && (!self.button1.isEnabled) && (!self.button5.isEnabled)&&(!self.button9.isEnabled)) {
        didWin = true;
    }
    else if ([self.button3.titleLabel.text isEqualToString:self.button5.titleLabel.text] && [self.button5.titleLabel.text isEqualToString:self.button7.titleLabel.text] &&(!self.button3.isEnabled)&& (!self.button5.isEnabled) && (!self.button7.isEnabled)) {
        didWin = true;
    }
    else if ([self.button1.titleLabel.text isEqualToString:self.button4.titleLabel.text] && [self.button4.titleLabel.text isEqualToString:self.button7.titleLabel.text] &&(!self.button7.isEnabled)&&(!self.button1.isEnabled)&&(!self.button4.isEnabled)) {
        didWin = true;
    }
    else if ([self.button2.titleLabel.text isEqualToString:self.button5.titleLabel.text] && [self.button5.titleLabel.text isEqualToString:self.button8.titleLabel.text]&& (!self.button2.isEnabled)&&(!self.button5.isEnabled)&&(!self.button8.isEnabled)) {
        didWin = true;
    }
    else if ([self.button3.titleLabel.text isEqualToString:self.button6.titleLabel.text] && [self.button6.titleLabel.text isEqualToString:self.button9.titleLabel.text] &&(!self.button6.isEnabled)&&(!self.button3.isEnabled)&&(!self.button9.isEnabled)) {
        didWin = true;
    }
 
    if (didWin) {
        [self disableButtons];
        NSString *winner = [[NSString alloc] init];
        if(turn){
            winner = @"O";
    
        }
        else winner = @"X";
        self.winnerLabel.text = [NSString stringWithFormat:@"Winner is %@",winner];
        
    }
    else if (turn_count==9){
        self.winnerLabel.text = @"It's a tie!!!";
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
@end
