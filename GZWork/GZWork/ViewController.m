//
//  ViewController.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "ViewController.h"
#import "GZCeshiViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    GZCeshiViewController * cehi =[[GZCeshiViewController alloc]init];
    [self.navigationController pushViewController:cehi animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
