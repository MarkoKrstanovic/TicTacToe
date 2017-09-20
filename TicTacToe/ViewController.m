//
//  ViewController.m
//  TicTacToe
//
//  Created by Martin Berger on 9/13/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "ViewController.h"
#import "CustomBackground.h"
#import "Xview.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self.gameView action:@selector(add:)];
        [self.gameView addGestureRecognizer: tap];
    
}
@end


