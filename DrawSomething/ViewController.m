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
    
    UIButton * yellowButton = [[UIButton alloc]init];
    [yellowButton setBackgroundColor:[UIColor yellowColor]];
    [yellowButton addTarget:self action:@selector(yellowColor) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * redColor = [[UIButton alloc]init];
    [redColor setBackgroundColor:[UIColor redColor]];
    [redColor addTarget:self action:@selector(redColor) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton * blueColor = [[UIButton alloc]init];
    [blueColor setBackgroundColor:[UIColor blueColor]];
    [blueColor addTarget:self action:@selector(blueColor) forControlEvents:UIControlEventTouchUpInside];
    
    UIStackView * colorsButtonsStackView = [[UIStackView alloc]initWithArrangedSubviews:@[yellowButton,redColor,blueColor]];
    
    UISlider * slider = [[UISlider alloc]init];
    [slider setMinimumValue:1];
    [slider setMaximumValue:10];
    [slider addTarget:self action:@selector(changeSliderValue:) forControlEvents:UIControlEventValueChanged];
    
    NSArray<UIView *> * buttons= [[NSArray alloc]initWithObjects:undoButton,clearButton, colorsButtonsStackView,slider, nil];
    
    UIStackView * buttonView = [[UIStackView alloc]initWithArrangedSubviews:buttons];
    [buttonView setSpacing:20];
    [drawView addSubview:buttonView];
    
    [buttonView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[[buttonView leadingAnchor]constraintEqualToAnchor:[drawView leadingAnchor] constant:20]setActive:YES];
    [[[buttonView bottomAnchor]constraintEqualToAnchor:[[self.view safeAreaLayoutGuide] bottomAnchor] constant:-10]setActive:YES];
    [[[buttonView trailingAnchor]constraintEqualToAnchor:[drawView trailingAnchor] constant:-20]setActive:YES];
}

-(void)yellowColor{
    [drawView setStrokeColor:[UIColor yellowColor]];
}

-(void)redColor{
    [drawView setStrokeColor:[UIColor redColor]];
}

-(void)blueColor{
    [drawView setStrokeColor:[UIColor blueColor]];
}

-(void)changeSliderValue:(UISlider *)slider{
    [drawView setStrokeWidth:slider.value];
}

-(void)undoAction{
    [drawView undoAction];
}

-(void)clearAction{
    [drawView clearAction];
}


@end
