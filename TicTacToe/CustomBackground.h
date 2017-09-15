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

@interface CustomBackground : UIView{
    bool turn;
    int turnCount;
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
@end
