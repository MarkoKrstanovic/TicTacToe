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
    
    if( ![self.view isKindOfClass:[CustomBackground class]]) {
         self.view = [[CustomBackground alloc]init];
    }
}
@end


