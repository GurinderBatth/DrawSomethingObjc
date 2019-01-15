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
    return [super init];
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for (NSMutableArray<NSValue *> * linesPoint in lines) {
        for (int i = 0; i < [linesPoint count]; i++){
            if (i == 0){
                CGPoint startPoint = [[linesPoint objectAtIndex:i] CGPointValue];
                CGContextMoveToPoint(context, startPoint.x, startPoint.y);
            }else{
                CGPoint endPoint = [[linesPoint objectAtIndex:i]CGPointValue];
                CGContextAddLineToPoint(context, endPoint.x, endPoint.y);
            }
        }
    }
    
    CGContextSetLineWidth(context, 4);
    CGContextStrokePath(context);
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [lines addObject:[NSMutableArray new]];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[[touches allObjects]firstObject]locationInView:nil];
    NSValue * value = [NSValue valueWithCGPoint:point];
    
    NSMutableArray<NSValue *> * lastObject = [lines lastObject];
    [lines removeLastObject];
    [lastObject addObject:value];
    [lines addObject:lastObject];
    
    [self setNeedsDisplay];
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
