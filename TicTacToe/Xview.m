//
//  Xview.m
//  TicTacToe
//
//  Created by Martin Berger on 9/15/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "Xview.h"

@implementation Xview


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
   
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef red = [UIColor redColor].CGColor;
    CGContextMoveToPoint(context, 20, 30);
    CGContextAddLineToPoint(context, 120, 120);
    CGContextMoveToPoint(context, 120, 30);
    CGContextAddLineToPoint(context, 20, 120);
    CGContextSetStrokeColorWithColor(context, red);
    CGContextStrokePath(context);
}


@end
