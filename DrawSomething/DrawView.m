//
//  DrawView.m
//  DrawSomething
//
//  Created by Apple on 15/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView


-(instancetype)init{
    lines = [[NSMutableArray alloc]init];
    strokeColor = [UIColor blackColor];
    strokeWidth = 1.0f;
    return [super init];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (Line * linesPoint in lines) {
        for (int i = 0; i < [[linesPoint lines] count]; i++){
            CGContextSetLineWidth(context, [linesPoint strokeWidth]);
            CGContextSetStrokeColorWithColor(context, [linesPoint strokeColor].CGColor);
            if (i == 0){
                CGPoint startPoint = [[[linesPoint lines] objectAtIndex:i] CGPointValue];
                CGContextMoveToPoint(context, startPoint.x, startPoint.y);
            }else{
                CGPoint endPoint = [[[linesPoint lines] objectAtIndex:i]CGPointValue];
                CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
            }
        }
        CGContextStrokePath(context);
    }
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    Line * line = [[Line alloc]init:strokeWidth strokeColor:strokeColor allLines:[NSMutableArray new]];
    [lines addObject:line];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[[touches allObjects]firstObject]locationInView:nil];
    NSValue * value = [NSValue valueWithCGPoint:point];
    
    Line * lastObject = [lines lastObject];
    [lines removeLastObject];
    [[lastObject lines] addObject:value];
    [lines addObject:lastObject];
    
    [self setNeedsDisplay];
}


-(void)setStrokeWidth:(CGFloat)width{
    strokeWidth = width;
}

-(void)setStrokeColor:(UIColor *)color{
    strokeColor = color;
}

-(void)undoAction{
    [lines removeLastObject];
    [self setNeedsDisplay];
}

-(void)clearAction{
    [lines removeAllObjects];
    [self setNeedsDisplay];
}


@end
