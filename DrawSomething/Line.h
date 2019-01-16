//
//  Line.h
//  DrawSomething
//
//  Created by Apple on 16/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Line : NSObject

@property (nonatomic) CGFloat                                 strokeWidth;

@property (nonatomic) UIColor                               * strokeColor;

@property (nonatomic) NSMutableArray<NSValue *>             * lines;

-(instancetype)init:(CGFloat)strokeWidth strokeColor:(UIColor *)strokeColor allLines:(NSMutableArray<NSValue *>*)lines;

@end

NS_ASSUME_NONNULL_END
