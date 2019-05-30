//
//  ViewController.m
//  UIViewAnimationBase
//
//  Created by Civet on 2019/5/28.
//  Copyright © 2019年 PandaTest. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _imageView = [[UIImageView alloc] init];
    _imageView.frame = CGRectMake(100, 100, 80, 80);
    _imageView.image = [UIImage imageNamed:@"2.jpg"];
    [self.view addSubview:_imageView];
    //设置移动按钮
    UIButton *moveBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    moveBtn.frame = CGRectMake(120, 360, 80, 40);
    [moveBtn setTitle:@"移动" forState:UIControlStateNormal];
    [moveBtn addTarget:self action:@selector(pressMove) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:moveBtn];
    
    UIButton *scaleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    scaleBtn.frame = CGRectMake(120, 400, 80, 40);
    [scaleBtn setTitle:@"缩放" forState:UIControlStateNormal];
    [scaleBtn addTarget:self action:@selector(pressScale) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:scaleBtn];
}

- (void)pressMove{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:0];
    
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    //设置动画运动轨迹的方式,线性就是匀速运动
//    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //加速 EaseOUt：减速
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    //设置动画结束调用的函数
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    //目标位置
    _imageView.frame = CGRectMake(300, 100, 80, 80);
    
    [UIView commitAnimations];
}

- (void)pressScale{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:0];
    
    //设置动画代理对象
    [UIView setAnimationDelegate:self];
    //设置动画运动轨迹的方式,线性就是匀速运动
    //    [UIView setAnimationCurve:UIViewAnimationCurveLinear];
    //加速 EaseOUt：减速
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    //设置动画结束调用的函数
    [UIView setAnimationDidStopSelector:@selector(stopAnimation)];
    //目标位置
    _imageView.frame = CGRectMake(100, 100, 120, 120);
    //改变透明度
    _imageView.alpha = 0.3;
    [UIView commitAnimations];}

- (void)stopAnimation{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
