//
//  CustomBackground.m
//  TicTacToe
//
//  Created by Martin Berger on 9/14/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "CustomBackground.h"

@implementation CustomBackground
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIColor *blackColor = [UIColor blackColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * lightRedColor = [UIColor colorWithRed:230.0/255.0 green:0.0/255.0 blue:0.0/255.0 alpha:1.0];
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor.CGColor, lightRedColor.CGColor);
    CGContextSetLineWidth(context, 5);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, 140, 0);
    CGContextAddLineToPoint(context, 140, 420);
    CGContextMoveToPoint(context, 280, 0);
    CGContextAddLineToPoint(context, 280, 420);
    CGContextMoveToPoint(context, 0, 140);
    CGContextAddLineToPoint(context, 500, 140);
    CGContextMoveToPoint(context, 0, 280);
    CGContextAddLineToPoint(context, 500, 280);
    CGContextSetStrokeColorWithColor(context, blackColor.CGColor);
    CGContextStrokePath(context);
    
    turn = !turn;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(add:)]];
    if(turn) {
        [self drawXwithContext:context];
    } else
        [self drawOwithContext:context];
    
}

-(void)drawXwithContext:(CGContextRef)context {
    
    CGColorRef blue = [[UIColor blueColor] CGColor];
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.myRect.origin.x + 20, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+120, self.myRect.origin.y+120);
    CGContextMoveToPoint(context, self.myRect.origin.x+120, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+20, self.myRect.origin.y+120);
    CGContextSetStrokeColorWithColor(context, blue);
    CGContextStrokePath(context);
  
}

-(void)drawOwithContext:(CGContextRef)context {
    
    CGColorRef blue = [[UIColor blueColor] CGColor];
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.myRect.origin.x+20, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+90, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+90, self.myRect.origin.y+120);
    CGContextAddLineToPoint(context, self.myRect.origin.x+20, self.myRect.origin.y+120);
    CGContextAddLineToPoint(context, self.myRect.origin.x+20, self.myRect.origin.y+20);
    CGContextSetStrokeColorWithColor(context, blue);
    CGContextStrokePath(context);
    
}

-(void)add:(UIGestureRecognizer*)tap {
    
    CGPoint p =  [tap locationInView:self];
    NSLog(@"x=%f", p.x);
    NSLog(@"y=%f", p.y);
    NSLog(@"%d",turnCount);
    self.mypoint = p;
    
    CGRect first = CGRectMake(0, 0, 140, 140);
    CGRect second = CGRectMake(140, 0, 140, 140);
    CGRect third = CGRectMake(280, 0, 140, 140);
    CGRect fourth = CGRectMake(0, 140, 140, 140);
    CGRect fifth = CGRectMake(140, 140, 140, 140);
    CGRect sixth = CGRectMake(280, 140, 140, 140);
    CGRect seventh = CGRectMake(0, 280, 140, 140);
    CGRect eight = CGRectMake(140, 280, 140, 140);
    CGRect nineth = CGRectMake(280, 280, 140, 140);
    
    if(CGRectContainsPoint(first, p)){
            turnCount++;
            self.myRect = first;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(second, p)) {
            turnCount++;
            self.myRect = second;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(third, p)) {
            turnCount++;
            self.myRect = third;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(fourth, p)) {
            turnCount++;
            self.myRect = fourth;
        [self setNeedsDisplay];
    } else if (CGRectContainsPoint(fifth, p)) {
            turnCount++;
            self.myRect = fifth;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(sixth, p)) {
            turnCount++;
            self.myRect = sixth;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(seventh, p)) {
            turnCount++;
            self.myRect = seventh;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(eight, p)) {
            turnCount++;
            self.myRect = eight;
            [self setNeedsDisplay];
    } else if (CGRectContainsPoint(nineth, p)) {
            turnCount++;
            self.myRect = nineth;
            [self setNeedsDisplay];
    }
    
    if (turnCount == 8) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 500, 200, 30)];
        label.text = @"It's a tie";
        [self addSubview:label];
    }
}
 // background Gradinet
void drawLinearGradient(CGContextRef context, CGRect rect, CGColorRef startColor, CGColorRef endColor)
{
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = { 0.0, 1.0 };
    NSArray *colors = @[(__bridge id) startColor, (__bridge id) endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef) colors, locations);
    CGPoint startPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMinY(rect));
    CGPoint endPoint = CGPointMake(CGRectGetMidX(rect), CGRectGetMaxY(rect));
    CGContextSaveGState(context);
    CGContextAddRect(context, rect);
    CGContextClip(context);
    CGContextDrawLinearGradient(context, gradient, startPoint, endPoint, 0);
    CGContextRestoreGState(context);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}

@end
