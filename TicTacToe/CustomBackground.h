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
     int tabla;
    int x;
    int o;
    UITapGestureRecognizer *tap;
    int gameOver;
    
    
}
@property (strong, nonatomic) View* regularView1;
@property (strong, nonatomic) View* regularView2;
@property (strong, nonatomic) View* regularView3;
@property (strong, nonatomic) View* regularView4;
@property (strong, nonatomic) View* regularView5;
@property (strong, nonatomic) View* regularView6;
@property (strong, nonatomic) View* regularView7;
@property (strong, nonatomic) View* regularView8;
@property (strong, nonatomic) View* regularView9;
@property (strong, nonatomic) Xview* xview;
@property (strong, nonatomic) OView* oview;
@property (nonatomic) CGRect myRect;
@property (nonatomic) CGPoint mypoint;
@property (nonatomic) NSInteger turnbool;
-(void)add:(UIGestureRecognizer*)tap1;

@end
