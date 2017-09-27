//
//  CustomBackground.m
//  TicTacToe
//
//  Created by Martin Berger on 9/14/17.
//  Copyright © 2017 heavydebugging.inc. All rights reserved.
//

#import "CustomBackground.h"

@implementation CustomBackground

- (void)drawRect:(CGRect)rect {
    // Drawing code
    UIColor *blackColor = [UIColor blackColor];
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIColor * whiteColor = [UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
    UIColor * grayColor = [UIColor colorWithRed:128.0/255.0 green:128.0/255.0 blue:128.0/255.0 alpha:1.0];
    CGRect paperRect = self.bounds;
    drawLinearGradient(context, paperRect, whiteColor.CGColor, grayColor.CGColor);
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
    x = 1;
    o = 3;
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(add:)]];
    if (turnCount == 0) {
        turn = true;
    }
    NSLog(@"%@",[self binaryStringFromInteger:table]);
    [self drawText:@"NewGame" withX:self.bounds.size.width*1/3 yPosition:self.bounds.size.height*5/6 canvasWidth:160 canvasHeight:40];
    
    if (table & TableMarks1) {
        NSLog(@"Prva pozicija je popunjena");
    }
    if (table & TableMarks2 ) {
        NSLog(@"Druga pozicija je popunjena");
    }
    if (table & TableMarks3 ) {
        NSLog(@"Treca pozicija je popunjena");
    }
    if (table & TableMarks4 ) {
        NSLog(@"Cetvrta pozicija je popunjena");
    }
    if (table & TableMarks5 ) {
        NSLog(@"Peta pozicija je popunjena");
    }
    if (table & TableMarks6 ) {
        NSLog(@"Sesta pozicija je popunjena");
    }
    if (table & TableMarks7 ) {
        NSLog(@"Sedma pozicija je popunjena");
    }
    if (table & TableMarks8 ) {
        NSLog(@"Osma pozicija je popunjena");
    }
    if (table & TableMarks9 ) {
        NSLog(@"Deveta pozicija je popunjena");
    }
    
    if (self.myRect.origin.x == 0.1 && self.myRect.origin.y == 0.1) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 1/3 && self.myRect.origin.y == 0 ) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 2/3 && self.myRect.origin.y == 0) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == 0 && self.myRect.origin.y == self.bounds.size.height * 1/6) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 1/3 && self.myRect.origin.y == self.bounds.size.height * 1/6) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 2/3 && self.myRect.origin.y == self.bounds.size.height * 1/6) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == 0 && self.myRect.origin.y == self.bounds.size.height * 2/6) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 1/3 && self.myRect.origin.y == self.bounds.size.height * 2/6) {
        [self drawXwithContext:context];
    } else if (self.myRect.origin.x == self.bounds.size.width * 2/3 && self.myRect.origin.y == self.bounds.size.height * 2/6) {
        [self drawXwithContext:context];
    }
    
    if(turn == false) {

         if ((!(table & TableMarks1) || !(table & TableMarks2) || !(table & TableMarks3) || !(table & TableMarks4) || !(table & TableMarks5) || !(table & TableMarks6) || !(table & TableMarks7) || !(table & TableMarks8) || !(table & TableMarks9) )) {
            [self drawOwithContext:context];
        }
        turnCount++;
    }
        //Draw winner's rect and finish the game
    if ((table & TableMarks1) && (table & TableMarks2) && (table & TableMarks3)) {
        if ((table & OMarks1) && (table & OMarks2) && (table & OMarks3))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if  (!(table & OMarks1) && !(table & OMarks2) && !(table & OMarks3))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];

    }
    if ((table & TableMarks4) && (table & TableMarks5) && (table & TableMarks6)) {
        if ((table & OMarks4) && (table & OMarks5) && (table & OMarks6))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks4) && !(table & OMarks5) && !(table & OMarks6))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks7) && (table & TableMarks8) && (table & TableMarks9)) {
        if ((table & OMarks7) && (table & OMarks8) && (table & OMarks9))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks7) && !(table & OMarks8) && !(table & OMarks9))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks1) && (table & TableMarks4) && (table & TableMarks7)) {
        if ((table & OMarks1) && (table & OMarks4) && (table & OMarks7))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks1) && !(table & OMarks4) && !(table & OMarks7))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks2) && (table & TableMarks5) && (table & TableMarks8)) {
        if ((table & OMarks2) && (table & OMarks5) && (table & OMarks8))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks2) && !(table & OMarks5) && !(table & OMarks8))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks3) && (table & TableMarks6) && (table & TableMarks9)) {
        if ((table & OMarks3) && (table & OMarks6) && (table & OMarks9))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks3) && !(table & OMarks6) && !(table & OMarks9))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks1) && (table & TableMarks5) && (table & TableMarks9)) {
        if ((table & OMarks1) && (table & OMarks5) && (table & OMarks9))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks1) && !(table & OMarks5) && !(table & OMarks9))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks3) && (table & TableMarks5) && (table & TableMarks7)) {
        if ((table & OMarks3) && (table & OMarks5) && (table & OMarks7))
            [self drawText:@"O wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
        else if (!(table & OMarks3) && !(table & OMarks5) && !(table & OMarks7))
            [self drawText:@"X wins this game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    
    NSLog(@"%@",[self binaryStringFromInteger:table]);
    
    if (turnCount == 10 && gameOver == 0) {
        [self drawText:@"It's a tie game!" withX:self.bounds.size.width * 1/3 yPosition:self.bounds.size.height * 4/6 canvasWidth:200 canvasHeight:200];
    }
    if ((table & TableMarks1) && (table & TableMarks2) && (table & TableMarks3) && (table & TableMarks4) && (table & TableMarks5) && (table & TableMarks6) && (table & TableMarks7) && (table & TableMarks8) && (table & TableMarks9))
    {
        NSLog(@"Popunjena tabela");
    }
    
}

-(void)drawXwithContext:(CGContextRef)context {
    
    CGColorRef blue = [[UIColor blueColor] CGColor];
    CGContextSetLineWidth(context, 10);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextMoveToPoint(context, self.myRect.origin.x + 20, self.myRect.origin.y + 20);
    CGContextAddLineToPoint(context, self.myRect.origin.x + 110, self.myRect.origin.y + 110);
    CGContextMoveToPoint(context, self.myRect.origin.x + 110, self.myRect.origin.y + 20);
    CGContextAddLineToPoint(context, self.myRect.origin.x + 20, self.myRect.origin.y + 110);
    CGContextSetStrokeColorWithColor(context, blue);
    CGContextStrokePath(context);

}

-(void)drawOwithContext:(CGContextRef)context {
    
    CGContextAddEllipseInRect(context, CGRectMake(self.AI.origin.x + 20, self.AI.origin.y + 10, 95,100));
    CGContextClosePath(context);
    CGContextAddEllipseInRect(context, CGRectMake(self.AI.origin.x + 30, self.AI.origin.y + 20, 75, 80));
    CGContextSetRGBFillColor(context, 1, 0, 0, 1);
    CGContextEOFillPath(context);
    
}

-(void)add:(UIGestureRecognizer*)tap1 {
    
    CGPoint p =  [tap1 locationInView:self];
    NSLog(@"x= %f", p.x);
    NSLog(@"y= %f", p.y);
    NSLog(@"%d",turnCount);
    NSLog(@"%f,%f,%f,%f",self.bounds.size.width * 2/3, self.bounds.size.height * 1/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    self.mypoint = p;
    CGRect first = CGRectMake(0.1, 0.1, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect second = CGRectMake(self.bounds.size.width * 1/3, 0, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect third = CGRectMake(self.bounds.size.width * 2/3, 0, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect fourth = CGRectMake(0, self.bounds.size.height * 1/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect fifth = CGRectMake(self.bounds.size.width * 1/3, self.bounds.size.height * 1/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect sixth = CGRectMake(self.bounds.size.width * 2/3, self.bounds.size.height * 1/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect seventh = CGRectMake(0, self.bounds.size.height * 2/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect eight = CGRectMake(self.bounds.size.width * 1/3, self.bounds.size.height * 2/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect nineth = CGRectMake(self.bounds.size.width * 2/3, self.bounds.size.height * 2/6, self.bounds.size.width * 1/3, self.bounds.size.height * 1/6);
    CGRect newGame = CGRectMake(self.bounds.size.width * 1/3, self.bounds.size.height * 5/6, 160.0, 40.0);
    turn = true;
    x = 1;
    o = 3;
    
    // Which rect is clicked
    if(CGRectContainsPoint(newGame, p)) {
        turnCount = 0;
        self.newGame = newGame;
        gameOver = 0;
        table = 0;
        self.myRect = CGRectZero;
        [self binaryStringFromInteger:table];
        [self setNeedsDisplay];
        turn = true;
        
    } else if(CGRectContainsPoint(first, p) && !(table & TableMarks1) && gameOver == 0) {
            turnCount++;
            self.myRect = first;
            if(!(table & TableMarks1)){
                [self setNeedsDisplayInRect:first];
                table = table | x;
                turn = false;

            }
    } else if (CGRectContainsPoint(second, p) && !(table & TableMarks2) && gameOver == 0) {
            turnCount++;
            self.myRect = second;
            if(!(table & TableMarks2)) {
                [self setNeedsDisplayInRect:second];
                x = x << 2;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(third, p) && !(table & TableMarks3) && gameOver == 0) {
            turnCount++;
            self.myRect = third;
            if(!(table & TableMarks3)) {
                [self setNeedsDisplayInRect:third];
                x = x << 4;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(fourth, p) && !(table & TableMarks4) && gameOver == 0) {
            turnCount++;
            self.myRect = fourth;
            if(!(table & TableMarks4)) {
                [self setNeedsDisplayInRect:fourth];
                x = x << 6;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(fifth, p) && !(table & TableMarks5) && gameOver== 0) {
            turnCount++;
            self.myRect = fifth;
            if (!(table & TableMarks5)) {
                [self setNeedsDisplayInRect:fifth];
                x = x << 8;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(sixth, p) && !(table & TableMarks6) && gameOver == 0) {
            turnCount++;
            self.myRect = sixth;
            if(!(table & TableMarks6)) {
                [self setNeedsDisplayInRect:sixth];
                x = x << 10;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(seventh, p) && !(table & TableMarks7) && gameOver == 0) {
            turnCount++;
            self.myRect = seventh;
            if(!(table & TableMarks7)) {
                [self setNeedsDisplayInRect:seventh];
                x = x << 12;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(eight, p) && !(table & TableMarks8) && gameOver == 0) {
            turnCount++;
            self.myRect = eight;
            if(!(table & TableMarks8)) {
                [self setNeedsDisplayInRect:eight];
                x = x << 14;
                table = table | x;
                turn = false;
            }
    } else if (CGRectContainsPoint(nineth, p) && !(table & TableMarks9) && gameOver == 0) {
            turnCount++;
            self.myRect = nineth;
            if(!(table & TableMarks9)){
                [self setNeedsDisplayInRect:nineth];
                x = x << 16;
                table = table | x;
                turn = false;
        }
    }
    
    [self displayWinnerRect];
    
    if(turn == false) {
        // O chanses to win horizontaly
        if ((table & TableMarks1) && (table & TableMarks2) && (table & OMarks1) && (table & OMarks2) && !(table & TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks3) && (table & OMarks1) && (table & OMarks3) && !(table & TableMarks2) && gameOver == 0) {
            self.AI = second;
            o = o << 2;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks2) && (table & TableMarks3) && (table & OMarks2) && (table & OMarks3) && !(table & TableMarks1) && gameOver == 0) {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks4) && (table & TableMarks5) && (table & OMarks4) && (table & OMarks5) && !(table & TableMarks6) && gameOver == 0) {
            self.AI = sixth;
            o = o << 10;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks6) && (table & OMarks5) && (table & OMarks6) && !(table & TableMarks4) && gameOver == 0) {
            self.AI = fourth;
            o = o << 6;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks4) && (table & TableMarks6) && (table & OMarks4) && (table & OMarks6) && !(table & TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks7) && (table & TableMarks8) && (table & OMarks7) && (table & OMarks8) && !(table & TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks8) && (table & TableMarks9) && (table & OMarks8) && (table & OMarks9) && !(table & TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks7) && (table & TableMarks9) && (table & OMarks7) && (table & OMarks9) && !(table & TableMarks8) && gameOver == 0) {
            self.AI = eight;
            o = o << 14;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        //O chances to win verticaly
        else if ((table & TableMarks1) && (table & TableMarks4) && (table & OMarks1) && (table & OMarks4) && !(table & TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks4) && (table & TableMarks7) && (table & OMarks4) && (table & OMarks7) && !(table & TableMarks1) && gameOver == 0) {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks7) && (table & OMarks1) && (table & OMarks7) && !(table & TableMarks4) && gameOver == 0) {
            self.AI = fourth;
            o = o << 6;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks2) && (table & TableMarks5) && (table & OMarks2) && (table & OMarks5) && !(table & TableMarks8) && gameOver == 0) {
            self.AI = eight;
            o = o << 14;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks8) && (table & OMarks5) && (table & OMarks8) && !(table & TableMarks2) && gameOver == 0) {
            self.AI = second;
            o = o << 2;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks2) && (table & TableMarks8) && (table & OMarks2) && (table & OMarks8) && !(table & TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks6) && (table & OMarks3) && (table & OMarks6) && !(table & TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks6) && (table & TableMarks9) && (table & OMarks6) && (table & OMarks9) && !(table & TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks9) && (table & OMarks3) && (table & OMarks9) && !(table & TableMarks6) && gameOver == 0) {
            self.AI = sixth;
            o = o << 10;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        //O chances to win diagonaly
        else if ((table & TableMarks1) && (table & TableMarks5) && (table & OMarks1) && (table & OMarks5) && !(table & TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks9) && (table & OMarks5) && (table & OMarks9) && !(table & TableMarks1) && gameOver == 0) {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks9) && (table & OMarks1) && (table & OMarks9) && !(table & TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks5) && (table & OMarks3) && (table & OMarks5) && !(table & TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks7) && (table & OMarks5) && (table & OMarks7) && !(table & TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks7) && (table & OMarks3) && (table & OMarks7) && !(table & TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        // Where to put O? horizontaly
        else if ((table & TableMarks1) && (table & TableMarks2) && !(table & OMarks1) && !(table & OMarks2) && gameOver==0 && !(table &TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
    
        else if ((table & TableMarks2) && (table & TableMarks3) && !(table & OMarks2) && !(table & OMarks3) && gameOver==0 && !(table &TableMarks1) && gameOver == 0)  {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks3) && !(table & OMarks1) && !(table & OMarks3) && gameOver==0 && !(table &TableMarks2) && gameOver == 0)  {
            self.AI = second;
            o = o << 2;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks4) && (table & TableMarks5) && !(table & OMarks4) && !(table & OMarks5) && gameOver==0 && !(table &TableMarks6) && gameOver == 0) {
            self.AI = sixth;
            o = o << 10;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks6) && !(table & OMarks5) && !(table & OMarks6) && gameOver==0 && !(table &TableMarks4) && gameOver == 0) {
            self.AI = fourth;
            o = o << 6;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks4) && (table & TableMarks6) && !(table & OMarks4) && !(table & OMarks6) && gameOver==0 && !(table &TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks7) && (table & TableMarks8) && !(table & OMarks7) && !(table & OMarks8) && gameOver==0 && !(table &TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks8) && (table & TableMarks9) && !(table & OMarks8) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o=o<<12;
            table = table|o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks7) && (table & TableMarks9) && !(table & OMarks7) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks8) && gameOver == 0) {
            self.AI = eight;
            o = o << 14;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        // verticaly
        else if ((table & TableMarks1) && (table & TableMarks4) && !(table & OMarks1) && !(table & OMarks4) && gameOver==0 && !(table &TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
    
        else if ((table & TableMarks4) && (table & TableMarks7) && !(table & OMarks4) && !(table & OMarks7) && gameOver==0 && !(table &TableMarks1) && gameOver == 0)  {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks7) && !(table & OMarks1) && !(table & OMarks7) && gameOver==0 && !(table &TableMarks4) && gameOver == 0)  {
            self.AI = fourth;
            o = o << 6;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks2) && (table & TableMarks5) && !(table & OMarks2) && !(table & OMarks5) && gameOver==0 && !(table &TableMarks8) && gameOver == 0) {
            self.AI = eight;
            o = o << 14;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks8) && !(table & OMarks5) && !(table & OMarks8) && gameOver==0 && !(table &TableMarks2) && gameOver == 0) {
            self.AI = second;
            o = o << 2;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks2) && (table & TableMarks8) && !(table & OMarks2) && !(table & OMarks8) && gameOver==0 && !(table &TableMarks5) && gameOver == 0) {
            self.AI = fifth;;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks6) && !(table & OMarks3) && !(table & OMarks6) && gameOver==0 && !(table &TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks6) && (table & TableMarks9) && !(table & OMarks6) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks9) && !(table & OMarks3) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks6) && gameOver == 0) {
            self.AI = sixth;
            o = o << 10;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        // diagonaly
        else if ((table & TableMarks1) && (table & TableMarks5) && !(table & OMarks1) && !(table & OMarks5) && gameOver==0 && !(table &TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks9) && !(table & OMarks5) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks1) && gameOver == 0) {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks1) && (table & TableMarks9) && !(table & OMarks1) && !(table & OMarks9) && gameOver==0 && !(table &TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks5) && !(table & OMarks3) && !(table & OMarks5) && gameOver==0 && !(table &TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks5) && (table & TableMarks7) && !(table & OMarks5) && !(table & OMarks7) && gameOver==0 && !(table &TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if ((table & TableMarks3) && (table & TableMarks7) && !(table & OMarks3) && !(table & OMarks7) && gameOver==0 && !(table &TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        //singles
        else if(!(table & TableMarks5) && gameOver == 0) {
            self.AI = fifth;
            o = o << 8;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks2) && gameOver == 0) {
            self.AI = second;
            o = o << 2;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks3) && gameOver == 0) {
            self.AI = third;
            o = o << 4;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks4) && gameOver == 0) {
            self.AI = fourth;
            o = o << 6;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks1) && gameOver == 0) {
            self.AI = first;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks6) && gameOver == 0) {
            self.AI = sixth;
            o = o << 10;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks7) && gameOver == 0) {
            self.AI = seventh;
            o = o << 12;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks8) && gameOver == 0) {
            self.AI = eight;
            o = o << 14;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
        else if(!(table & TableMarks9) && gameOver == 0) {
            self.AI = nineth;
            o = o << 16;
            table = table | o;
            [self setNeedsDisplayInRect:self.AI];
        }
    }
    //  tie?
    if(turnCount == 9) {
        [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
    }
    
    [self displayWinnerRect];
    
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

- (void)displayWinnerRect {
    
    if ((table & TableMarks1) && (table & TableMarks2) && (table & TableMarks3) && gameOver == 0) {
        if((table & OMarks1) && (table & OMarks2) && (table & OMarks3)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        } else if(!(table & OMarks1) && !(table & OMarks2) && !(table & OMarks3)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    
    if ((table & TableMarks4) && (table & TableMarks5) && (table & TableMarks6) && gameOver == 0) {
        if((table & OMarks4) && (table & OMarks5) && (table & OMarks6)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else if(!(table & OMarks4) && !(table & OMarks5) && !(table & OMarks6)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks7) && (table & TableMarks8) && (table & TableMarks9) && gameOver == 0) {
        if ((table & OMarks7) && (table & OMarks8) && (table & OMarks9)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else if (!(table & OMarks7) && !(table & OMarks8) && !(table & OMarks9)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks1) && (table & TableMarks4) && (table & TableMarks7) && gameOver == 0) {
        if((table & OMarks1) && (table & OMarks4) && (table & OMarks7)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else if(!(table & OMarks1) && !(table & OMarks4) && !(table & OMarks7)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks2) && (table & TableMarks5) && (table & TableMarks8) && gameOver == 0) {
        if ((table & OMarks2) && (table & OMarks5) && (table & OMarks8)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else  if (!(table & OMarks2) && !(table & OMarks5) && !(table & OMarks8)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks3) && (table & TableMarks6) && (table & TableMarks9) && gameOver==0) {
        if((table & OMarks3) && (table & OMarks6) && (table & OMarks9)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else if(!(table & OMarks3) && !(table & OMarks6) && !(table & OMarks9)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks1) && (table & TableMarks5) && (table & TableMarks9) && gameOver==0) {
        if ((table & OMarks1) && (table & OMarks5) && (table & OMarks9)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else  if (!(table & OMarks1) && !(table & OMarks5) && !(table & OMarks9)){
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
    if ((table & TableMarks3) && (table & TableMarks5) && (table & TableMarks7) && gameOver==0) {
        if ((table & OMarks3) && (table & OMarks5) && (table & OMarks7)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
        else  if (!(table & OMarks3) && !(table & OMarks5) && !(table & OMarks7)) {
            [self setNeedsDisplayInRect:CGRectMake(self.bounds.size.width * 1/3,self.bounds.size.height * 4/6,200,200)];
            gameOver = 1;
        }
    }
}

- (void)drawText:(NSString*)string withX:(CGFloat)xPosition yPosition:(CGFloat)yPosition canvasWidth:(CGFloat)canvasWidth canvasHeight:(CGFloat)canvasHeight
{
    //Draw Text
    CGRect textRect = CGRectMake(xPosition, yPosition, canvasWidth, canvasHeight);
    NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
    textStyle.alignment = NSTextAlignmentLeft;
    NSDictionary* textFontAttributes = @{NSFontAttributeName: [UIFont fontWithName: @"Helvetica" size: 20], NSForegroundColorAttributeName: UIColor.redColor, NSParagraphStyleAttributeName: textStyle};
    [string drawInRect: textRect withAttributes: textFontAttributes];
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

typedef NS_OPTIONS(int, OMarks) {
    OMarks1 = 1 << 1,
    OMarks2 = 1 << 3,
    OMarks3 = 1 << 5,
    OMarks4 = 1 << 7,
    OMarks5 = 1 << 9,
    OMarks6 = 1 << 11,
    OMarks7 = 1 << 13,
    OMarks8 = 1 << 15,
    OMarks9 = 1 << 17,
};

@end
