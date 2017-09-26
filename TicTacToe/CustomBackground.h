//
//  CustomBackground.h
//  TicTacToe
//
//  Created by Martin Berger on 9/14/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CustomBackground : UIView {
    bool turn;
    int turnCount;
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
