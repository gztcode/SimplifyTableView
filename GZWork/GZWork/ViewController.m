//
//  ViewController.m
//  GZWork
//
//  Created by Tim on 2018/2/25.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "ViewController.h"
#import "GZCeshiViewController.h"
#import "UIView+SubVIews.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.searchBarLeft.frame =CGRectMake(0, 100, 200, 95);
    self.view.searchBarLeft.backgroundColor = [UIColor redColor];
    NSLog(@"%@",self.view.searchBarLeft);

    self.view.searchBarTop.frame =CGRectMake(0, 200, 200, 95);
    self.view.searchBarTop.backgroundColor = [UIColor greenColor];
    NSLog(@"%@",self.view.searchBarTop);

    self.view.searchBarRight.frame =CGRectMake(0, 300, 200, 95);
    self.view.searchBarRight.backgroundColor = [UIColor blueColor];
    NSLog(@"%@",self.view.searchBarRight);

    self.view.searchBarBottom.frame =CGRectMake(0, 400, 200, 95);
    self.view.searchBarBottom.backgroundColor = [UIColor orangeColor];
    NSLog(@"%@",self.view.searchBarBottom);

    self.view.searchBarCenter.frame =CGRectMake(0, 500, 200, 95);
    self.view.searchBarCenter.backgroundColor = [UIColor brownColor];
    NSLog(@"%@",self.view.searchBarCenter);
//
    
    
}
/**
 -(void)setLabelLeft:(UILabel *)labelLeft{
 objc_setAssociatedObject(self, @selector(labelLeft), labelLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 
 -(UILabel *)labelLeft{
 return (UILabel *)[self getView:_cmd];
 }
 
 -(void)setLabelTop:(UILabel *)labelTop{
 objc_setAssociatedObject(self, @selector(labelTop), labelTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 
 -(UILabel *)labelTop{
 return (UILabel *)[self getView:_cmd];
 }
 
 -(void)setLabelRight:(UILabel *)labelRight{
 objc_setAssociatedObject(self, @selector(labelRight), labelRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 
 -(UILabel *)labelRight{
 return (UILabel *)[self getView:_cmd];
 }
 
 -(void)setLabelBottom:(UILabel *)labelBottom{
 objc_setAssociatedObject(self, @selector(labelBottom), labelBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 
 -(UILabel *)labelBottom{
 return (UILabel *)[self getView:_cmd];
 }
 
 -(void)setLabelCenter:(UILabel *)labelCenter{
 objc_setAssociatedObject(self, @selector(labelCenter), labelCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
 }
 
 -(UILabel *)labelCenter{
 return (UILabel *)[self getView:_cmd];
 }
 
 */
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    GZCeshiViewController * cehi =[[GZCeshiViewController alloc]init];
//    [self.navigationController pushViewController:cehi animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
