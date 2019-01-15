//
//  DrawView.h
//  DrawSomething
//
//  Created by Apple on 15/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DrawView : UIView{
    NSMutableArray<NSMutableArray<NSValue *> *> * lines;
}

-(void)undoAction;
-(void)clearAction;

@end

NS_ASSUME_NONNULL_END
