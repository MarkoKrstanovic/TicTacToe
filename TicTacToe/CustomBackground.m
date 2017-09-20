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
    CGContextMoveToPoint(context, self.bounds.size.width/3, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width/3, self.bounds.size.height/2);
    CGContextMoveToPoint(context, self.bounds.size.width* 2/3, 0);
    CGContextAddLineToPoint(context, self.bounds.size.width* 2/3, self.bounds.size.height/2);
    CGContextMoveToPoint(context, 0, self.bounds.size.height* 1/6);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height*1/6);
    CGContextMoveToPoint(context, 0, self.bounds.size.height*2/6);
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height*2/6);
    CGContextSetStrokeColorWithColor(context, blackColor.CGColor);
    CGContextStrokePath(context);
    x=1;
    o=3;
    turn = !turn;
    
    TableMarks tableMark1 = TableMarks1;
    if (tabla & tableMark1 ) {
        NSLog(@"Prva pozicija je popunjena");
    }
    TableMarks tableMark2 = TableMarks2;
    if (tabla & tableMark2 ) {
        NSLog(@"Druga pozicija je popunjena");
    }
    TableMarks tableMark3 = TableMarks3;
    if (tabla & tableMark3 ) {
        NSLog(@"Treca pozicija je popunjena");
    }
    TableMarks tableMark4 = TableMarks4;
    if (tabla & tableMark4 ) {
        NSLog(@"Cetvrta pozicija je popunjena");
    }
    TableMarks tableMark5 = TableMarks5;
    if (tabla & tableMark5 ) {
        NSLog(@"Peta pozicija je popunjena");
    }
    TableMarks tableMark6 = TableMarks6;
    if (tabla & tableMark6 ) {
        NSLog(@"Sesta pozicija je popunjena");
    }
    TableMarks tableMark7 = TableMarks7;
    if (tabla & tableMark7 ) {
        NSLog(@"Sedma pozicija je popunjena");
    }
    TableMarks tableMark8 = TableMarks8;
    if (tabla & tableMark8 ) {
        NSLog(@"Osma pozicija je popunjena");
    }
    TableMarks tableMark9 = TableMarks9;
    if (tabla & tableMark9 ) {
        NSLog(@"Deveta pozicija je popunjena");
    }
    TableMarks fullTable = TableMarks1 | TableMarks2 | TableMarks3 | TableMarks4 | TableMarks5 | TableMarks6 | TableMarks7 | TableMarks8 | TableMarks9;
    
    NSLog(@"%@",[self binaryStringFromInteger:fullTable]);
    
    if ((tabla & tableMark1) && (tabla & tableMark2) && (tabla & tableMark3) && (tabla & tableMark4) && (tabla & tableMark5) && (tabla & tableMark6) && (tabla & tableMark7) && (tabla & tableMark8) && (tabla & tableMark9))
    {
        NSLog(@"Popunjena tabela");
        
        for (UIGestureRecognizer *recognizer in self.gestureRecognizers) {
            [self removeGestureRecognizer:recognizer];
        }
    }
    else {
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(add:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    }
    
    if (self.myRect.origin.x == 0.1 && self.myRect.origin.y ==0.1) {
        if(turn && a1 == 0) {
            tabla = tabla|x;
            a1 = 1;
            [self drawXwithContext:context];
        } else if(a1==0) {
            tabla = tabla|o;
            a1 = 2;
            [self drawOwithContext:context];
        }

    }
    else if(self.myRect.origin.x == self.bounds.size.width/3 && self.myRect.origin.y == 0) {
        if(turn && a2 == 0) {
            x = x<<2;
            tabla = tabla|x;
            a2 = 1;
            [self drawXwithContext:context];
        } else if(a2==0) {
            o = o<<2;
            tabla = tabla|o;
            a2 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == self.bounds.size.width* 2/3 && self.myRect.origin.y ==0) {
        if(turn && a3 == 0) {
            x = x<<4;
            tabla = tabla|x;
            a3 = 1;
            [self drawXwithContext:context];
        } else if(a3==0) {
            o = o<<4;
            tabla = tabla|o;
            a3 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == 0 && self.myRect.origin.y ==self.bounds.size.height*1/6) {
        if(turn && b1 == 0) {
            x = x<<6;
            tabla = tabla|x;
            b1 = 1;
            [self drawXwithContext:context];
        } else if(b1==0) {
            o = o<<6;
            tabla = tabla|o;
            b1 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == self.bounds.size.width* 1/3 && self.myRect.origin.y ==self.bounds.size.height*1/6) {
        if(turn && b2 == 0) {
            x = x<<8;
            tabla = tabla|x;
            b2 = 1;
            [self drawXwithContext:context];
        } else if(b2==0){
            o = o<<8;
            tabla = tabla|o;
            b2 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == self.bounds.size.width* 2/3 && self.myRect.origin.y ==self.bounds.size.height*1/6) {
        if(turn && b3 == 0) {
            x = x<<10;
            tabla = tabla|x;
            b3 = 1;
            [self drawXwithContext:context];
        } else if(b3==0) {
            o = o<<10;
            tabla = tabla|o;
            b3 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == 0 && self.myRect.origin.y ==self.bounds.size.height*2/6) {
        if(turn && c1 == 0) {
            x = x<<12;
            tabla = tabla|x;
            c1 = 1;
            [self drawXwithContext:context];
        } else if(c1==0){
            o = o<<12;
            tabla = tabla|o;
            c1 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == self.bounds.size.width* 1/3 && self.myRect.origin.y ==self.bounds.size.height* 2/6) {
        if(turn && c2 == 0) {
            x = x<<14;
            tabla = tabla|x;
            c2 = 1;
            [self drawXwithContext:context];
        } else if(c2==0) {
            o = o<<14;
            tabla = tabla|o;
            c2 = 2;
            [self drawOwithContext:context];
        }
    }
    else if(self.myRect.origin.x == self.bounds.size.width* 2/3 && self.myRect.origin.y ==self.bounds.size.height*2/6) {
        if(turn && c3 == 0) {
            x = x<<16;
            tabla = tabla|x;
            c3 = 1;
            [self drawXwithContext:context];
        } else if(c3==0) {
            o = o<<16;
            tabla = tabla|o;
            c3 = 2;
            [self drawOwithContext:context];
        }
        }
    if (a1 == 1 && a2 == 1 && a3 == 1) {

        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
        
    } else if (b1 == 1 && b2 == 1 && b3 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (c1 == 1 && c2 == 1 && c3 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a1 == 1 && b2 == 1 && c3 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a3 == 1 && b2 == 1 && c1 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a1 == 1 && b1 == 1 && c1 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a2 == 1 && b2 == 1 && c2 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a3 == 1 && b3 == 1 && c3 == 1) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"X wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a1 == 2 && a2 == 2 && a3 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (b1 == 2 && b2 == 2 && b3 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (c1 == 2 && c2 == 2 && c3 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a1 == 2 && b2 == 2 && c3 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a3 == 2 && b2 == 2 && c1 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a1 == 2 && b1 == 2 && c1 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a2 == 2 && b2 == 2 && c2 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
    } else if (a3 == 2 && b3 == 2 && c3 == 2) {
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(300, 500, 200, 30)];
        label.text = @"O wins";
        [self addSubview:label];
        gameOver = 1;
        

        
        
    }
    NSLog(@"%@",[self binaryStringFromInteger:tabla]);
}
- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if (CGRectContainsPoint(self.myRect, [touch locationInView:self]))
        return NO;
    
    return YES;
}

-(void)drawXwithContext:(CGContextRef)context {
    
    CGColorRef blue = [[UIColor blueColor] CGColor];
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.myRect.origin.x + 20, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+110, self.myRect.origin.y+110);
    CGContextMoveToPoint(context, self.myRect.origin.x+110, self.myRect.origin.y+20);
    CGContextAddLineToPoint(context, self.myRect.origin.x+20, self.myRect.origin.y+110);
    CGContextSetStrokeColorWithColor(context, blue);
    CGContextStrokePath(context);
  
}

-(void)drawOwithContext:(CGContextRef)context {
    
    CGColorRef blue = [[UIColor blueColor] CGColor];
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.myRect.origin.x+25, self.myRect.origin.y+15);
    CGContextAddLineToPoint(context, self.myRect.origin.x+100, self.myRect.origin.y+15);
    CGContextAddLineToPoint(context, self.myRect.origin.x+100, self.myRect.origin.y+110);
    CGContextAddLineToPoint(context, self.myRect.origin.x+25, self.myRect.origin.y+110);
    CGContextAddLineToPoint(context, self.myRect.origin.x+25, self.myRect.origin.y+15);
    CGContextSetStrokeColorWithColor(context, blue);
    CGContextStrokePath(context);
    
}

-(void)add:(UIGestureRecognizer*)tap1 {
    
    CGPoint p =  [tap1 locationInView:self];
    NSLog(@"x=%f", p.x);
    NSLog(@"y=%f", p.y);
    NSLog(@"%d",turnCount);
    NSLog(@"%f,%f,%f,%f",self.bounds.size.width* 2/3, self.bounds.size.height*1/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    self.mypoint = p;
    
    CGRect first = CGRectMake(0.1, 0.1, self.bounds.size.width/3, self.bounds.size.height/6);
    CGRect second = CGRectMake(self.bounds.size.width/3, 0,self.bounds.size.width/3, self.bounds.size.height/6);
    CGRect third = CGRectMake(self.bounds.size.width* 2/3, 0, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect fourth = CGRectMake(0, self.bounds.size.height*1/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect fifth = CGRectMake(self.bounds.size.width* 1/3, self.bounds.size.height*1/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect sixth = CGRectMake(self.bounds.size.width* 2/3, self.bounds.size.height*1/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect seventh = CGRectMake(0, self.bounds.size.height*2/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect eight = CGRectMake(self.bounds.size.width* 1/3, self.bounds.size.height* 2/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    CGRect nineth = CGRectMake(self.bounds.size.width* 2/3, self.bounds.size.height*2/6, self.bounds.size.width* 1/3, self.bounds.size.height*1/6);
    
    if(CGRectContainsPoint(first, p)){
            turnCount++;
        self.turnbool++;
            self.myRect = first;
        if(a1==0){
            [self setNeedsDisplayInRect:first];
        }
    } else if (CGRectContainsPoint(second, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = second;
        if(a2==0) {
            [self setNeedsDisplayInRect:second];
        }
        
    } else if (CGRectContainsPoint(third, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = third;
        if(a3==0) {
            [self setNeedsDisplayInRect:third];
             }
    } else if (CGRectContainsPoint(fourth, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = fourth;
        if(b1==0) {
        [self setNeedsDisplayInRect:fourth];
        }
    } else if (CGRectContainsPoint(fifth, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = fifth;
        if (b2==0) {
        
           [self setNeedsDisplayInRect:fifth];
        }
    } else if (CGRectContainsPoint(sixth, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = sixth;
        if(b3==0) {
            [self setNeedsDisplayInRect:sixth];
        }
    } else if (CGRectContainsPoint(seventh, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = seventh;
        if(c1==0) {
            [self setNeedsDisplayInRect:seventh];
        }
    } else if (CGRectContainsPoint(eight, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = eight;
        if(c2==0) {
            [self setNeedsDisplayInRect:eight];
        }
    } else if (CGRectContainsPoint(nineth, p)) {
            turnCount++;
        self.turnbool++;
            self.myRect = nineth;
        if(c3==0){
            [self setNeedsDisplayInRect:nineth];
        }
    }
    
    if (/*turnCount == 9 ||*/ self.turnbool == 9) {
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

-(NSString *) binaryStringFromInteger: (int)number
{
    NSMutableString * string = [[NSMutableString alloc] init];
    
    int spacing = pow( 2, 3 );
    int width = ( sizeof( number ) ) * spacing;
    int binaryDigit = 0;
    int integer = number;
    
    while( binaryDigit < width )
    {
        binaryDigit++;
        
        [string insertString:( (integer & 1) ? @"1" : @"0" )atIndex:0];
        
        if( binaryDigit % spacing == 0 && binaryDigit != width )
        {
            [string insertString:@" " atIndex:0];
        }
        
        integer = integer >> 1;
    }
    
    return string;
}

typedef NS_OPTIONS(int, TableMarks) {
    TableMarks1 = 1 << 0,
    TableMarks2 = 1 << 2,
    TableMarks3 = 1 << 4,
    TableMarks4 = 1 << 6,
    TableMarks5 = 1 << 8,
    TableMarks6 = 1 << 10,
    TableMarks7 = 1 << 12,
    TableMarks8 = 1 << 14,
    TableMarks9 = 1 << 16,
};

@end
