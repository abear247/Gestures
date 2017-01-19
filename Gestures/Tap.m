//
//  Tap.m
//  Gestures
//
//  Created by Alex Bearinger on 2017-01-19.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Tap.h"

@interface Tap ()

@end

@implementation Tap

-(void)viewDidLoad{
    [super viewDidLoad];
    
    CGFloat width = 100;
    CGFloat height = 100;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - height/2, CGRectGetMidY(self.view.bounds) - width/2, 100, 100);
    
    UIView *boxView = [[UIView alloc] initWithFrame:frame];
    boxView.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:boxView];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [boxView addGestureRecognizer:tapGesture];
    
}


-(void)tap:(UITapGestureRecognizer *)sender{
    UIColor *colour = [sender.view.backgroundColor isEqual:[UIColor blueColor]] ? [UIColor redColor] : [UIColor blueColor];
    sender.view.backgroundColor = colour;
}

@end
