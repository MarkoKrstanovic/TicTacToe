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
    turn = YES;
    turnCount=0;
    self.regularView1 = [[View alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
    self.regularView1.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView1];
    
    self.regularView2 = [[View alloc]initWithFrame:CGRectMake(140, 0, 140, 140)];
    self.regularView2.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView2];
    
    self.regularView3 = [[View alloc]initWithFrame:CGRectMake(280, 0, 140, 140)];
    self.regularView3.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView3];
    
    self.regularView4 = [[View alloc]initWithFrame:CGRectMake(0, 140, 140, 140)];
    self.regularView4.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView4];
    
    self.regularView5 = [[View alloc]initWithFrame:CGRectMake(140, 140, 140, 140)];
    self.regularView5.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView5];
    
    self.regularView6 = [[View alloc]initWithFrame:CGRectMake(280, 140, 140, 140)];
    self.regularView6.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView6];
    
    self.regularView7 = [[View alloc]initWithFrame:CGRectMake(0, 280, 140, 140)];
    self.regularView7.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView7];
    
    self.regularView8 = [[View alloc]initWithFrame:CGRectMake(140, 280, 140, 140)];
    self.regularView8.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView8];
    
    self.regularView9 = [[View alloc]initWithFrame:CGRectMake(280, 280, 140, 140)];
    self.regularView9.backgroundColor = [UIColor clearColor];
    [self addSubview:self.regularView9];
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
        if (![self.regularView1 isUserInteractionEnabled]) {
            
        } else {
        
            if (turn){
                self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.xview.backgroundColor = [UIColor clearColor];
                [self.regularView1 addSubview:self.xview];
            
            } else {
                self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.oview.backgroundColor = [UIColor clearColor];
                [self.regularView1 addSubview:self.oview];
            }
            
            self.regularView1.userInteractionEnabled=false;
            turn = !turn;
            turnCount++;
        }
    } else if (CGRectContainsPoint(second, p)) {
        if (![self.regularView2 isUserInteractionEnabled]) {
            
        } else {
            
            if (turn) {
                self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.xview.backgroundColor = [UIColor clearColor];
                [self.regularView2 addSubview:self.xview];
            } else {
                self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.oview.backgroundColor = [UIColor clearColor];
                [self.regularView2 addSubview:self.oview];
        }
            
            self.regularView2.userInteractionEnabled=false;
            turn = !turn;
            turnCount++;
        }
    } else if (CGRectContainsPoint(third, p)) {
        if (![self.regularView3 isUserInteractionEnabled]) {
            
        } else {
            
            if(turn) {
                self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.xview.backgroundColor = [UIColor clearColor];
                [self.regularView3 addSubview:self.xview];
            } else {
                self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.oview.backgroundColor = [UIColor clearColor];
                [self.regularView3 addSubview:self.oview];
        }
        self.regularView3.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(fourth, p)) {
        if (![self.regularView4 isUserInteractionEnabled]) {
            
        } else {
            
            if(turn) {
                self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
                self.xview.backgroundColor = [UIColor clearColor];
                [self.regularView4 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView4 addSubview:self.oview];
        }
        self.regularView4.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(fifth, p)) {
        if (![self.regularView5 isUserInteractionEnabled]) {
            
        } else {
            
        if(turn) {
            self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.xview.backgroundColor = [UIColor clearColor];
            [self.regularView5 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView5 addSubview:self.oview];
        }
        self.regularView5.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(sixth, p)) {
        if (![self.regularView6 isUserInteractionEnabled]) {
            
        } else {
            
        if(turn) {
            self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.xview.backgroundColor = [UIColor clearColor];
            [self.regularView6 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView6 addSubview:self.oview];
        }
        self.regularView6.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(seventh, p)) {
        if (![self.regularView7 isUserInteractionEnabled]) {
            
        } else {
            
        if(turn) {
            self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.xview.backgroundColor = [UIColor clearColor];
            [self.regularView7 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView7 addSubview:self.oview];
        }
        self.regularView7.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(eight, p)) {
        if (![self.regularView8 isUserInteractionEnabled]) {
            
        } else {
            
        if(turn) {
            self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.xview.backgroundColor = [UIColor clearColor];
            [self.regularView8 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView8 addSubview:self.oview];
        }
        self.regularView8.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    } else if (CGRectContainsPoint(nineth, p)) {
        if (![self.regularView9 isUserInteractionEnabled]) {
            
        } else {
            
        if(turn) {
            self.xview = [[Xview alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.xview.backgroundColor = [UIColor clearColor];
            [self.regularView9 addSubview:self.xview];
        } else {
            self.oview = [[OView alloc]initWithFrame:CGRectMake(0, 0, 140, 140)];
            self.oview.backgroundColor = [UIColor clearColor];
            [self.regularView9 addSubview:self.oview];
        }
        self.regularView9.userInteractionEnabled=false;
        turn = !turn;
        turnCount++;
        }
    }
    if (turnCount == 9) {
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
