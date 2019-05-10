//
//  ViewController.m
//  多边形碰撞
//
//  Created by laiyp on 2018/7/10.
//  Copyright © 2018年 laiyongpeng. All rights reserved.
//

#import "ViewController.h"
#import "SeparatingAxisTheorem.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 200)];
    redView.backgroundColor = [UIColor redColor];
    redView.transform = CGAffineTransformMakeRotation(M_PI/12);
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(100, 330, 100, 200)];
    blueView.backgroundColor = [UIColor blueColor];
    blueView.alpha = 0.5;
    [self.view addSubview:blueView];
    
    NSMutableArray *arrayM = [self transformViewConvertToPoint:redView];
    CGPoint topLeft;
    [arrayM[0] getValue:&topLeft];
    CGPoint topRight;
    [arrayM[1] getValue:&topRight];
    CGPoint bottomLeft;
     [arrayM[2] getValue:&bottomLeft];
    CGPoint bottomRight;
    [arrayM[3] getValue:&bottomRight];
    
    Polygon p1;
    Vect verts[] = {vectMake(topLeft.x,topLeft.y),vectMake(topRight.x,topRight.y),vectMake(bottomLeft.x,bottomLeft.y),vectMake(bottomRight.x,bottomRight.y)};
    p1.vertexes = verts;
    p1.vertexCount = 4;
    
    CGFloat originX = blueView.frame.origin.x;
    CGFloat originY = blueView.frame.origin.y;
    CGFloat width = blueView.frame.size.width;
    CGFloat height =blueView.frame.size.height;
    
    Polygon p2;
    Vect verts2[]= {vectMake(originX, originY),vectMake(originX +width ,originY),vectMake(originX+width, originY+height),vectMake(originX, originY+height)};
    p2.vertexes = verts2;
    p2.vertexCount = 4;
    
    BOOL result = polygonCollision(p1, p2);
    NSLog(@"%i",result);
    
}

-(NSMutableArray *)transformViewConvertToPoint:(UIView *)view{
    CGPoint originalCenter = CGPointApplyAffineTransform(view.center,
                                                         CGAffineTransformInvert(view.transform));
    
    CGPoint topLeft = originalCenter;
    topLeft.x -= view.bounds.size.width / 2;
    topLeft.y -= view.bounds.size.height / 2;
    topLeft = CGPointApplyAffineTransform(topLeft, view.transform);
    
        CGPoint topRight = originalCenter;
        topRight.x += view.bounds.size.width / 2;
        topRight.y -= view.bounds.size.height / 2;
        topRight = CGPointApplyAffineTransform(topRight, view.transform);
    
        CGPoint bottomLeft = originalCenter;
        bottomLeft.x -= view.bounds.size.width / 2;
        bottomLeft.y += view.bounds.size.height / 2;
        bottomLeft = CGPointApplyAffineTransform(bottomLeft, view.transform);
    
        CGPoint bottomRight = originalCenter;
        bottomRight.x += view.bounds.size.width / 2;
        bottomRight.y += view.bounds.size.height / 2;
        bottomRight = CGPointApplyAffineTransform(bottomRight, view.transform);
    
    NSMutableArray *array = [[NSMutableArray alloc]init];
    [array addObject:@(topLeft)];
    [array addObject:@(topRight)];
    [array addObject:@(bottomLeft)];
    [array addObject:@(bottomRight)];

    return array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
