//
//  ViewController.m
//  Core-Animation
//
//  Created by friendestMAC on 16/8/22.
//  Copyright © 2016年 slyfy27. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *blueLayer;
    CALayer *redLayer;
    UIView *outerView;
    UIView *innerView;
    IBOutletCollection(UIView) NSArray *faces;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //2016年08月22日11:58:50 实现CALayerDelegate//
    //create sublayer
//    blueLayer = [CALayer layer];
//    blueLayer.frame = CGRectMake(50.0f, 50.f, 100.0f, 100.0f);
//    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
//    
//    blueLayer.delegate = self;
//    blueLayer.contentsScale = [UIScreen mainScreen].scale;
////    [self.view.layer addSublayer:blueLayer];
//    
//    redLayer = [CALayer layer];
//    redLayer.frame = CGRectMake(100.0f, 100.f, 100.0f, 100.0f);
//    redLayer.backgroundColor = [UIColor grayColor].CGColor;
//    
//    redLayer.delegate = self;
//    redLayer.contentsScale = [UIScreen mainScreen].scale;
////    [self.view.layer addSublayer:redLayer];
//    
//    [blueLayer display];
//    [redLayer display];
//    
//    //use zPosition
//    blueLayer.zPosition = 1;
////    redLayer.zPosition = 1;
//    
//    //create mask
////    CALayer *maskLayer = [CALayer layer];
////    maskLayer.frame = blueLayer.bounds;
////    UIImage *maskImage = [UIImage imageNamed:@"false_person_s_m3"];
////    maskLayer.contents = (__bridge id)maskImage.CGImage;
////    blueLayer.mask = maskLayer;
//    
//    //2016年08月23日11:18:18 变换//
//    outerView = [[UIView alloc] initWithFrame:(CGRect){100,100,100,100}];
//    outerView.backgroundColor = [UIColor grayColor];
//    [self.view addSubview:outerView];
//    
//    innerView = [[UIView alloc] initWithFrame:(CGRect){25,25,50,50}];
//    innerView.backgroundColor  =[UIColor blueColor];
//    [outerView addSubview:innerView];
//    
//    //rotate the outer layer 45 degress
//    CATransform3D outer = CATransform3DIdentity;
//    //m34
//    outer.m34 = -1.0/500;
//    outer = CATransform3DRotate(outer, M_PI_4, 0, 1, 0);
//    outerView.layer.transform = outer;
//    //rotate the inner layer -45 degress
//    CATransform3D inner = CATransform3DIdentity;
//    inner.m34 = -1.0/500;
//    inner = CATransform3DRotate(inner,-M_PI_4, 0, 1, 0);
//    innerView.layer.transform = inner;
//    innerView.layer.masksToBounds = YES;
    
    //2016年08月23日15:25:19 create cube//
    CATransform3D perspective = CATransform3DIdentity;
    perspective.m34 = -1.0 / 500.0;
    self.view.layer.sublayerTransform = perspective;
    //add cube1
    CATransform3D transform = CATransform3DMakeTranslation(0, 0, 100);
    [self addFace:0 withTransform:transform];
    
    transform = CATransform3DMakeTranslation(100, 0, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 0, 1, 0);
    [self addFace:1 withTransform:transform];
    //add cube face 3
    transform = CATransform3DMakeTranslation(0, -100, 0);
    transform = CATransform3DRotate(transform, M_PI_2, 1, 0, 0);
    [self addFace:2 withTransform:transform];
    //add cube face 4
    transform = CATransform3DMakeTranslation(0, 100, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 1, 0, 0);
    [self addFace:3 withTransform:transform];
    //add cube face 5
    transform = CATransform3DMakeTranslation(-100, 0, 0);
    transform = CATransform3DRotate(transform, -M_PI_2, 0, 1, 0);
    [self addFace:4 withTransform:transform];
    //add cube face 6
    transform = CATransform3DMakeTranslation(0, 0, -100);
    transform = CATransform3DRotate(transform, M_PI, 0, 1, 0);
    [self addFace:5 withTransform:transform];
}

- (void)addFace:(NSInteger)index withTransform:(CATransform3D)transform{
    UIView *face = faces[index];
    face.center = CGPointMake(self.view.bounds.size.width/2.0, self.view.bounds.size.height/2.0);
    face.layer.transform = transform;
    [self.view addSubview:face];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //use containsPoint charge which layer been touched
//    CGPoint point = [[touches anyObject] locationInView:self.view];
//    point = [blueLayer convertPoint:point fromLayer:self.view.layer];
//    if ([blueLayer containsPoint:point]) {
//        NSLog(@"blue");
//    }
//    else{
//        NSLog(@"red");
//    }
    //use hitTest charge which layer been touched
    CGPoint point = [[touches anyObject]locationInView:self.view];
    CALayer *layer = [self.view.layer hitTest:point];
    if (layer == blueLayer) {
        NSLog(@"blue");
    }
    else if (layer == redLayer) {
        NSLog(@"red");
    }
    else{
        NSLog(@"none");
    }
}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx{
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
