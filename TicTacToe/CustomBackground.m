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
    
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(addX1:)]];

}

-(void)addX1:(UIGestureRecognizer*)tap {
    CGPoint p =  [ tap locationInView:self];
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
//        self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
//        self.xview.backgroundColor = [UIColor clearColor];
//        [self addSubview:self.xview];
        
        self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
        self.oview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.oview];
        
    } else if (CGRectContainsPoint(second, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(140, 0, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(third, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(280, 0, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(fourth, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 140, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(fifth, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(140, 140, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(sixth, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(280, 140, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(seventh, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 280, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(eight, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(140, 280, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
    } else if (CGRectContainsPoint(nineth, p)) {
        self.xview = [[Xview alloc]initWithFrame:CGRectMake(280, 280, 140, 140)];
        self.xview.backgroundColor = [UIColor clearColor];
        [self addSubview:self.xview];
        
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
