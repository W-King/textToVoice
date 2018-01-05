//
//  ViewController.m
//  测试GCD串行队列
//
//  Created by pipixia on 2018/1/3.
//  Copyright © 2018年 pipixia. All rights reserved.
//

#import "ViewController.h"
#import "PPSoundPlayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"播放" forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = CGRectMake(210, 100, 100, 100);
    button1.backgroundColor = [UIColor blueColor];
    [button1 addTarget:self action:@selector(buttonClicked1) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"停止" forState:UIControlStateNormal];
    [self.view addSubview:button1];
}

- (void)buttonClicked
{
    NSLog(@"当前运行系统为：iOS%@",[[UIDevice currentDevice] systemVersion]);
    [self ceshi:@"测试GCD串行队列是不是停止好用好用,是不是好用啊"];
}
- (void)buttonClicked1
{
    [[PPSoundPlayer soundPlayerInstance] stopSpeaking];
}
- (void)ceshi:(NSString *)text
{
    [[PPSoundPlayer soundPlayerInstance] play:text];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
