//
//  Pinch.m
//  Gestures
//
//  Created by Alex Bearinger on 2017-01-19.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Pinch.h"

@interface Pinch ()

@end

@implementation Pinch

-(void)viewDidLoad{
    [super viewDidLoad];
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - height/2, CGRectGetMidY(self.view.bounds) - width/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(viewPinched:)];
    [view addGestureRecognizer:pinchGesture];
}

-(void)viewPinched:(UIPinchGestureRecognizer *)sender{
    CGFloat scale = sender.scale;
    sender.view.transform = CGAffineTransformMakeScale(scale, scale);
    scale = 1.0;
}

@end
