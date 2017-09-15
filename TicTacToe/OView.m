//
//  OView.m
//  TicTacToe
//
//  Created by Martin Berger on 9/15/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "OView.h"

@implementation OView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [self drawText:20 yPosition:10 canvasWidth:140 canvasHeight:140];
}
- (void)drawText:(CGFloat)xPosition yPosition:(CGFloat)yPosition canvasWidth:(CGFloat)canvasWidth canvasHeight:(CGFloat)canvasHeight
{
    //Draw Text
    CGRect textRect = CGRectMake(xPosition, yPosition, canvasWidth, canvasHeight);
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 120], NSForegroundColorAttributeName: UIColor.redColor, NSParagraphStyleAttributeName: textStyle};
    
    [@"O " drawInRect: textRect withAttributes: textFontAttributes];
}

@end
