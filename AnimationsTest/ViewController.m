//
//  ViewController.m
//  AnimationsTest
//
//  Created by Admin on 27.06.2018.
//  Copyright © 2018 Sergio Lechini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIView* testView2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView* view = [[UIView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
    
    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(30, 200, 40, 40)];
    view2.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view2];
    
    self.testView = view;
    self.testView2 = view2;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [UIView animateWithDuration:5
//                     animations:^{
//                         self.testView.center = CGPointMake(190, 100);
//                     }];
    

    [self moveView:self.testView:5];
    [self moveView:self.testView2:1];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.testView.layer removeAllAnimations];
//    });
//
    
}

- (void) moveView:(UIView*) view :(double) dur {
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    
    [UIView animateWithDuration:dur
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         view.center = CGPointMake(300, 200);
                         view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(2, 2);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(M_PI);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         view.backgroundColor = [UIColor redColor];
                     }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) randomFromZeroToOne {
    
    return (float)(arc4random() % 256) / 255;
    
}

- (UIColor*) randomColor {
    
    CGFloat r = [self randomFromZeroToOne];
    CGFloat g = [self randomFromZeroToOne];
    CGFloat b = [self randomFromZeroToOne];
    
    return [UIColor colorWithRed:r green:g blue:b alpha:1.f];
    
}

@end
