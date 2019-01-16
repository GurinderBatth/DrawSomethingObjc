//
//  DrawView.h
//  DrawSomething
//
//  Created by Apple on 15/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Line.h"

NS_ASSUME_NONNULL_BEGIN


//struct

@interface DrawView : UIView{
    
    NSMutableArray<Line *> * lines;
    
    UIColor                                     * strokeColor;
    
    CGFloat                                       strokeWidth;
    
}

-(void)setStrokeWidth:(CGFloat)width;
-(void)setStrokeColor:(UIColor *)color;
-(void)undoAction;
-(void)clearAction;

@end

NS_ASSUME_NONNULL_END
