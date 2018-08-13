//
//  ViewController.m
//  MyScrollView
//
//  Created by Kyla  on 2018-08-13.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ViewController.h"
#import "MyScrollView.h"

@interface ViewController () <UIScrollViewDelegate>

@property (nonatomic) MyScrollView *myScrollView;
@property (nonatomic) UIView *redBox;
@property (nonatomic) UIView *greenBox;
@property (nonatomic) UIView *blueBox;
@property (nonatomic) UIView *yellowBox;

@property (nonatomic,strong) MyScrollView *scrollView;
@property (nonatomic) CGSize contentSize;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ///////add bottom view for whole controller
    MyScrollView *myScrollView = [[MyScrollView alloc] init];
    myScrollView.backgroundColor = [UIColor lightGrayColor];
    [[self view] addSubview:myScrollView];
    self.myScrollView = myScrollView;
    
    UIView *redBox = [[UIView alloc] initWithFrame:CGRectMake(20.0, 20.0, 100.0, 100.0)];
    redBox.backgroundColor = [UIColor redColor];
    [self.myScrollView addSubview:redBox];
    self.redBox = redBox;
    
    UIView *greenBox = [[UIView alloc] initWithFrame:CGRectMake(150.0, 150.0, 150.0, 200.0)];
    greenBox.backgroundColor = [UIColor greenColor];
    [[self myScrollView] addSubview:greenBox];
    self.greenBox = greenBox;
    
    UIView *blueBox = [[UIView alloc] initWithFrame:CGRectMake(40.0, 400.0, 200.0, 150.0)];
    blueBox.backgroundColor = [UIColor blueColor];
    [[self myScrollView] addSubview:blueBox];
    self.blueBox = blueBox;
    
    UIView *yellowBox = [[UIView alloc] initWithFrame:CGRectMake(100.0, 600.0, 180.0, 150.0)];
    yellowBox.backgroundColor = [UIColor yellowColor];
    [[self myScrollView] addSubview:yellowBox];
    self.yellowBox = yellowBox;
    
    
//    self.scrollView = [[MyScrollView alloc] init];
//    [self.view addSubview:self.scrollView];
//    [self.scrollView addSubview:self.myScrollView];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePanGesture:)];
    [self.myScrollView addGestureRecognizer:panGesture];
    CGSize size = CGSizeMake(self.view.frame.size.width, 800);
    self.scrollView.contentSize = size;
//    [self.scrollView setNeedsDisplay];
   
    

    
    
}

-(void)viewDidLayoutSubviews {
    CGRect frame = CGRectMake(0.0, 0.0, self.view.frame.size.width, self.view.frame.size.height);
    self.myScrollView.frame = frame;
}

///////change the bounds 
-(void)viewDidAppear:(BOOL)animated {
    self.myScrollView.bounds = CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.height);
}
///////////////////////////////////

-(void)handlePanGesture:(UIPanGestureRecognizer *)sender {
    NSLog(@"did pan");
    ////self.view.bounds.width
//    size width subratacted by bounds width self.view.width - contentview
///y self.view.bounds.height - greyview.bounds.height
    ///set x limit, set y limit and if it exceeds the maximum value subtract
    
   
    
    // goal is to change the bounds of self.myScrollView by the amount the finger has moved
    
    CGPoint translationInView = [sender translationInView:sender.view];
    CGRect oldBounds = sender.view.bounds;
    CGPoint newOrigin = CGPointMake(oldBounds.origin.x - translationInView.x, oldBounds.origin.y - translationInView.y);
    CGRect newBounds = CGRectMake(newOrigin.x, newOrigin.y, oldBounds.size.width, oldBounds.size.height);
    sender.view.bounds = newBounds;
    [sender setTranslation:CGPointZero inView:sender.view];
    NSLog(@"%i for x, %i for y", newBounds, oldBounds);
    

    }









@end
