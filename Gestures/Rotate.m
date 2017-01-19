//
//  Rotate.m
//  Gestures
//
//  Created by Alex Bearinger on 2017-01-19.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Rotate.h"

@interface Rotate ()

@end

@implementation Rotate

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = 100;
    CGFloat height = 100;
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - height/2, CGRectGetMidY(self.view.bounds) - width/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    UIRotationGestureRecognizer *rotate = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotateBox:)];
    [view addGestureRecognizer:rotate];
    
}

-(void)rotateBox:(UIRotationGestureRecognizer *)sender{
    sender.view.transform = CGAffineTransformMakeRotation(sender.rotation);

}


@end
