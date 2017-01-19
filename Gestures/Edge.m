//
//  Edge.m
//  Gestures
//
//  Created by Alex Bearinger on 2017-01-19.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Edge.h"

@interface Edge ()

@property bool open;
@property UIScreenEdgePanGestureRecognizer *edgey;
@property UIPanGestureRecognizer *panney;

@end

@implementation Edge

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat width = 400;
    CGFloat height = 400;
    CGRect frame = CGRectMake(CGRectGetMaxX(self.view.bounds)-20, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:view];
    
    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(edgePanner:)];
    self.edgey = edgePan;
    [view addGestureRecognizer:self.edgey];
    
    UIPanGestureRecognizer *regPan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panner:)];
    self.panney = regPan;
}


-(void)edgePanner:(UIScreenEdgePanGestureRecognizer *)sender{
    sender.minimumNumberOfTouches = 100;
    if(sender.minimumNumberOfTouches){
        [sender.view removeGestureRecognizer:self.edgey];
        [sender.view addGestureRecognizer:self.panney];
    }
     sender.view.transform = CGAffineTransformMakeTranslation(-300, 0);
}

-(void)panner:(UIPanGestureRecognizer *)sender{
    sender.minimumNumberOfTouches = 100;
    if(sender.minimumNumberOfTouches){
        [sender.view removeGestureRecognizer:self.panney];
        [sender.view addGestureRecognizer:self.edgey];
    }
    sender.view.transform = CGAffineTransformMakeTranslation(300, 0);
}


@end
