//
//  ViewController.m
//  AnimationsTest
//
//  Created by Admin on 27.06.2018.
//  Copyright © 2018 Sergio Lechini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

//@property (weak, nonatomic) UIView* testView;
@property (weak, nonatomic) UIImageView* testImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView* view = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 40, 40)];
    
    UIImage* image1 = [UIImage imageWithContentsOfFile:@"/Users/sergejlepinin/Documents/iOSeducation/objC/objC_uiviewAnim/AnimationsTest/images/1.jpg"];
    UIImage* image2 = [UIImage imageWithContentsOfFile:@"/Users/sergejlepinin/Documents/iOSeducation/objC/objC_uiviewAnim/AnimationsTest/images/2.jpg"];
    UIImage* image3 = [UIImage imageWithContentsOfFile:@"/Users/sergejlepinin/Documents/iOSeducation/objC/objC_uiviewAnim/AnimationsTest/images/3.jpg"];
    
    NSArray* images = [NSArray arrayWithObjects:image1, image2, image3, image1, nil];
    
    view.animationImages = images;
    view.animationDuration = 1.0f;
    [view startAnimating];
    
    //view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:view];
    
    
    self.testImageView = view;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
//    [UIView animateWithDuration:5
//                     animations:^{
//                         self.testView.center = CGPointMake(190, 100);
//                     }];
    

    [self moveView:self.testImageView:0.5];
    //[self moveView:self.testView2:1];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.testView.layer removeAllAnimations];
//    });
//
    
}

- (void) moveView:(UIView*) view :(double) dur {
    
    CGRect rect = self.view.bounds;
    
    rect = CGRectInset(rect, CGRectGetWidth(view.frame), CGRectGetHeight(view.frame));
    
    CGFloat x = arc4random() % (int)CGRectGetWidth(rect) + CGRectGetMinX(rect);
    CGFloat y = arc4random() % (int)CGRectGetHeight(rect) + CGRectGetMinY(rect);
    
    CGFloat rndScale = .1f + (float)(arc4random() % 151) / 100.f + 0.5f;
    
    NSLog(@"scale: %f", rndScale);
    
    CGFloat rndRotate = (float)(arc4random() % (int)(M_PI * 2 * 10000)) / 10000 - M_PI;
    
    [UIView animateWithDuration:dur
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         view.center = CGPointMake(x, y);
                         //view.backgroundColor = [self randomColor];
                         
                         CGAffineTransform scale = CGAffineTransformMakeScale(rndScale, rndScale);
                         CGAffineTransform rotation = CGAffineTransformMakeRotation(rndRotate);
                         
                         CGAffineTransform transform = CGAffineTransformConcat(scale, rotation);
                         
                         view.transform = transform;
                     }
                     completion:^(BOOL finished) {
                         
                         __weak UIView* v = view;
                        
                         [self moveView:v :1];
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
