//
//  ViewController.m
//  ShakeAnimation-demo
//
//  Created by 黄海燕 on 16/12/6.
//  Copyright © 2016年 huanghy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *view;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 45)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 80, 45)];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(shake:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
}

- (void)shake:(UIButton *)sender{
    
    [self shakeAnimationForView:view];
}

- (void)shakeAnimationForView:(UIView *) view
{
    // 获取到当前的View
    
    CALayer *viewLayer = view.layer;
    
    // 获取当前View的位置
    
    CGPoint position = viewLayer.position;
    
    // 移动的两个终点位置
    
    CGPoint x = CGPointMake(position.x + 10, position.y);
    
    CGPoint y = CGPointMake(position.x - 10, position.y);
    
    // 设置动画
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    
    // 设置运动形式
    
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault]];
    
    // 设置开始位置
    
    [animation setFromValue:[NSValue valueWithCGPoint:x]];
    
    // 设置结束位置
    
    [animation setToValue:[NSValue valueWithCGPoint:y]];
    
    // 设置自动反转
    
    [animation setAutoreverses:YES];
    
    // 设置时间
    
    [animation setDuration:.06];
    
    // 设置次数
    
    [animation setRepeatCount:3];
    
    // 添加上动画
    
    [viewLayer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
