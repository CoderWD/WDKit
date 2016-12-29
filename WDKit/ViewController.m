//
//  ViewController.m
//  WDKit
//
//  Created by 何伟东 on 2016/11/1.
//  Copyright © 2016年 何伟东. All rights reserved.
//

#import "ViewController.h"
#import "WDKit/WDKit.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    [button setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:button];
    [button handlerTouchUpInsideEvent:^(id sender) {
        
    }];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [button removeTargetWithEvent:UIControlEventTouchUpInside];
    });
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
