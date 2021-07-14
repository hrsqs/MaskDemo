//
//  ViewController.m
//  MaskDemo
//
//  Created by CiJay on 2021/7/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 毛玻璃
    UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
    effectView.frame = self.view.bounds;
    [self.view addSubview:effectView];
    
    // 文字内容底部渐变
    UIView *gradientView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 350, 200)];
    [self.view addSubview:gradientView];
    
    // 文字内容
    UITextView *textView = [[UITextView alloc] initWithFrame:gradientView.bounds];
    textView.backgroundColor = UIColor.clearColor;
    textView.selectable = NO;
    textView.textColor = UIColor.whiteColor;
    textView.text = @"这是第1行文字。。。\n这是第2行文字。。。\n这是第3行文字。。。\n这是第4行文字。。。\n这是第5行文字。。。\n这是第6行文字。。。\n这是第7行文字。。。\n这是第8行文字。。。\n这是第9行文字。。。\n这是第10行文字。。。\n这是第11行文字。。。\n这是第12行文字。。。\n这是第13行文字。。。\n这是第14行文字。。。\n这是第15行文字。。。\n这是第16行文字。。。";
    [gradientView addSubview:textView];
    
    [self updateGradientLayer:gradientView];
}

/// 更新渐变图层
- (void)updateGradientLayer:(UIView *)gradientView {
    NSObject *transparent = (NSObject*)[UIColor.clearColor CGColor];
    NSObject *opaque = (NSObject*)[UIColor.blackColor CGColor];
    CALayer *maskLayer = [CALayer layer];
    maskLayer.frame = gradientView.bounds;
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = maskLayer.bounds;
    gradientLayer.colors = @[opaque, opaque, transparent];
    gradientLayer.locations = @[@(0), @(0.857), @(1)];
    gradientLayer.startPoint = CGPointMake(0.5, 0);
    gradientLayer.endPoint = CGPointMake(0.5, 1);
    [maskLayer addSublayer:gradientLayer];
    gradientView.layer.mask = maskLayer;
}


@end
