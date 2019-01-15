//
//  ViewController.m
//  DrawSomething
//
//  Created by Apple on 13/01/19.
//  Copyright © 2019 Batth. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"

@interface ViewController (){
    DrawView * drawView;
}

@end

@implementation ViewController


-(void)loadView{
    [super loadView];
    
    drawView = [[DrawView alloc]init];
    [drawView setFrame:[[self view] frame]];
    [drawView setBackgroundColor:[UIColor whiteColor]];
    self.view = drawView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupViews];
}

-(void)setupViews{
    UIButton * undoButton = [[UIButton alloc]init];
    [undoButton setTitle:@"Undo" forState:UIControlStateNormal];
    [undoButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [undoButton addTarget:self action:@selector(undoAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * clearButton = [[UIButton alloc]init];
    [clearButton setTitle:@"Clear" forState:UIControlStateNormal];
    [clearButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [clearButton addTarget:self action:@selector(clearAction) forControlEvents:UIControlEventTouchUpInside];
    
    NSArray<UIView *> * buttons= [[NSArray alloc]initWithObjects:undoButton,clearButton, nil];
    
    UIStackView * buttonView = [[UIStackView alloc]initWithArrangedSubviews:buttons];
    [buttonView setSpacing:20];
    [drawView addSubview:buttonView];
    
    [buttonView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[buttonView leadingAnchor]constraintEqualToAnchor:[drawView leadingAnchor] constant:20]setActive:YES];
    [[[buttonView bottomAnchor]constraintEqualToAnchor:[drawView bottomAnchor] constant:-40]setActive:YES];
}

-(void)undoAction{
    [drawView undoAction];
}

-(void)clearAction{
    [drawView clearAction];
}


@end
