//
//  CustomBackground.h
//  TicTacToe
//
//  Created by Martin Berger on 9/14/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Xview.h"
#import "OView.h"
#import "View.h"

@interface CustomBackground : UIView <UIGestureRecognizerDelegate>{
    bool turn;
    int turnCount;
    int a1,a2,a3,b1,b2,b3,c1,c2,c3;
     int table;
    int x;
    int o;
    UITapGestureRecognizer *tap;
    int gameOver;
}
@property (nonatomic) CGRect myRect;
@property (nonatomic) CGRect newGame;
@property (nonatomic) CGRect AI;
@property (nonatomic) CGPoint mypoint;
-(void)add:(UIGestureRecognizer*)tap1;

@end
