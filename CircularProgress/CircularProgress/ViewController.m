//
//  ViewController.m
//  CircularProgress
//
//  Created by Saul Alberto Cortez Garcia on 8/30/19.
//  Copyright © 2019 Saul Alberto Cortez Garcia. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>
#import <CoreImage/CoreImage.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // De IZTAPALAPA... para el CHINO!!!
    CGRect screenSize =  UIScreen.mainScreen.bounds;

    UIView *circle = [[UIView alloc]init];
    circle.backgroundColor = [UIColor blackColor];
    circle.frame = CGRectMake(screenSize.size.width / 2 - 150, 100, 300, 300);
    [circle layoutIfNeeded];
    [self.view addSubview:circle];
    
    CAShapeLayer * progressCircle = [[CAShapeLayer alloc] init];
    CGPoint centerPoint = CGPointMake(circle.bounds.size.width / 2, circle.bounds.size.width / 2 );
    CGFloat circleRadius = circle.bounds.size.width / 2 * .80;
    
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:centerPoint
                                                              radius:circleRadius
                                                          startAngle:-.5 * M_PI
                                                            endAngle:1.5 * M_PI
                                                           clockwise:true];
    
    
    progressCircle.path = circlePath.CGPath;
    progressCircle.strokeColor = [UIColor whiteColor].CGColor;
    progressCircle.fillColor =  [UIColor clearColor].CGColor;
    progressCircle.lineWidth = 2;
    progressCircle.strokeStart = 0;
    progressCircle.strokeEnd = .95;
    progressCircle.borderColor = [UIColor redColor].CGColor;
    [circle.layer addSublayer:progressCircle];

    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithDouble:0];
    //animation.toValue = [NSNumber numberWithDouble:0];
    animation.duration = 20;
    [progressCircle addAnimation:animation forKey:@"foregroundAnimation"];
    
    

}


@end
