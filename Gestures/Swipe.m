//
//  Swipe.m
//  Gestures
//
//  Created by Alex Bearinger on 2017-01-19.
//  Copyright © 2017 Alex Bearinger. All rights reserved.
//

#import "Swipe.h"

@interface Swipe ()

@property bool centered;

@end

@implementation Swipe

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat width = (CGRectGetMidX(self.view.bounds)*2)-50;
    CGFloat height = 50;
    
    CGRect frame = CGRectMake(CGRectGetMidX(self.view.bounds) - width/2, CGRectGetMidY(self.view.bounds) - height/2, width, height);
    
    UIView *backView = [[UIView alloc] initWithFrame:frame];
    backView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:backView];
    
    
    CGFloat width2 = (CGRectGetMidX(self.view.bounds)*2)-50;
    CGFloat height2 = 50;
    
    CGRect frame2 = CGRectMake(CGRectGetMidX(backView.bounds) - width2/2, CGRectGetMidY(backView.bounds) - height2/2, width2, height2);
    
    UIView *frontView = [[UIView alloc] initWithFrame:frame2];
    frontView.backgroundColor = [UIColor lightGrayColor];

    [backView addSubview:frontView];
    backView.clipsToBounds = YES;
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiping:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [frontView addGestureRecognizer:swipeLeft];
    UISwipeGestureRecognizer *swiperight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swiping:)];
    swiperight.direction = UISwipeGestureRecognizerDirectionRight;
    [frontView addGestureRecognizer:swiperight];
}

-(void)swiping:(UISwipeGestureRecognizer*)sender{
    switch (sender.direction) {
        case UISwipeGestureRecognizerDirectionLeft:{
            if(self.centered){
                sender.view.transform = CGAffineTransformMakeTranslation(-100, 0);
                self.centered = NO;
            }
            else{
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
            }
        }
            break;
        case UISwipeGestureRecognizerDirectionRight:{
            if(self.centered){
                sender.view.transform = CGAffineTransformMakeTranslation(100, 0);
                self.centered = NO;
            }
            else{
                sender.view.transform = CGAffineTransformMakeTranslation(0, 0);
                self.centered = YES;
            }
    }
            break;
        default:
            break;
    }
    
}

@end
