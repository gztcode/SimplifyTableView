//
//  ViewController.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "ViewController.h"
#import "UIResponder+SubVIews.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.gz_SearchBarLeft.frame =CGRectMake(0, 100, 200, 95);
    self.gz_SearchBarLeft.backgroundColor = [UIColor redColor];
    NSLog(@"%@",self.gz_SearchBarLeft);

    self.gz_SearchBarTop.frame =CGRectMake(0, 200, 200, 95);
    self.gz_SearchBarTop.backgroundColor = [UIColor greenColor];
    NSLog(@"%@",self.gz_SearchBarTop);

    self.gz_SearchBarRight.frame =CGRectMake(0, 300, 200, 95);
    self.gz_SearchBarRight.backgroundColor = [UIColor blueColor];
    NSLog(@"%@",self.gz_SearchBarRight);

    self.gz_SearchBarBottom.frame =CGRectMake(0, 400, 200, 95);
    self.gz_SearchBarBottom.backgroundColor = [UIColor orangeColor];
    NSLog(@"%@",self.gz_SearchBarBottom);

    self.gz_SearchBarCenter.frame =CGRectMake(0, 500, 200, 95);
    self.gz_SearchBarCenter.backgroundColor = [UIColor brownColor];
    NSLog(@"%@",self.gz_SearchBarCenter);
  

}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    GZCeshiViewController * cehi =[[GZCeshiViewController alloc]init];
//    [self.navigationController pushViewController:cehi animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
