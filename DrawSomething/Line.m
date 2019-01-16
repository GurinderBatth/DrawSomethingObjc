//
//  Line.m
//  DrawSomething
//
//  Created by Apple on 16/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "Line.h"

@implementation Line


-(instancetype)init:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor allLines:(NSMutableArray<NSValue *>*)lines{
    self.strokeColor = strokeColor;
    self.strokeWidth = strokeWidth;
    self.lines = lines;
    return [super init];
}

@end
