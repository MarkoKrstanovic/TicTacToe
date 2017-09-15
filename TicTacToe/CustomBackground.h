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

@interface CustomBackground : UIView
@property (strong, nonatomic) Xview* xview;
@property (strong, nonatomic) OView* oview;
@end
