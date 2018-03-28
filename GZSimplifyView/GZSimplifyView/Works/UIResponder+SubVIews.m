//
//  UIResponder+SubVIews.m
//  GZWork
//
//  Created by Tim on 2018/3/19.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "UIResponder+SubVIews.h"
#import <objc/message.h>
@implementation UIResponder (SubVIews)

///获取属性的类型
-(Class)gz_getViewProper:(SEL)sel{
    objc_property_t p = class_getProperty(self.class, NSStringFromSelector(sel).UTF8String);
    NSString *attrs = @(property_getAttributes(p));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 3;
    if (dotLoc == NSNotFound) {
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc-1)];
    }
    if ([code isEqualToString:NSStringFromClass(WKWebView.class)]) {//这里有一个底层的bug
       return NSClassFromString(code);
    }
    return NSClassFromString(code);
}
///获取当前需要创建的对象
-(UIView *)gz_getView:(SEL)sel{
    UIView * view = objc_getAssociatedObject(self, sel);
    if (!view) {
        view =[[[self gz_getViewProper:sel] alloc] init];
        [self setValue:view forKey:NSStringFromSelector(sel)];
        [self gz_AddSubView:view];
    }
    return view;
}
///初始化UICollectionView
-(UICollectionView *)gz_getCollectionView:(SEL)sel{
    UICollectionView * view = objc_getAssociatedObject(self, sel);
    if (!view) {
        NSMutableString *targerStr = [[NSMutableString alloc] initWithString:NSStringFromSelector(sel)];
        NSRange range = [targerStr rangeOfString:@"Collection"];
        if (range.location != NSNotFound) {
            [targerStr insertString:@"Layout" atIndex:range.location+range.length];
        }else{
            NSLog(@"Not Found %@",NSStringFromSelector(sel));
        }
        view =[[[self gz_getViewProper:sel] alloc] initWithFrame:CGRectZero collectionViewLayout:[self valueForKeyPath:targerStr]];
        [self setValue:view forKey:NSStringFromSelector(sel)];
        [self gz_AddSubView:view];
    }
    return view;
}
///设置默认布局
-(UICollectionViewLayout *)gz_getCollecLayout:(SEL)sel{
    UICollectionViewLayout * layout = objc_getAssociatedObject(self, sel);
    if (!layout) {
        layout =[[[self gz_getViewProper:sel] alloc] init];
        [self setValue:layout forKey:NSStringFromSelector(sel)];
    }
    return layout;
}
///添加手势
-(UIGestureRecognizer *)gz_getGestureRecognizer:(SEL)sel{
    UIGestureRecognizer * gestureRecognizer = objc_getAssociatedObject(self, sel);
    if (!gestureRecognizer) {
        gestureRecognizer =[[[self gz_getViewProper:sel] alloc] init];
        [self setValue:gestureRecognizer forKey:NSStringFromSelector(sel)];
        if ([self isKindOfClass:UIView.class]) {
            [(UIView*)self addGestureRecognizer:gestureRecognizer];
        }
        
    }
    return gestureRecognizer;
}
///添加View
-(void)gz_AddSubView:(UIView *)view{
    if ([self isKindOfClass:UIView.class]) {
        [(UIView *)self addSubview:view];
    }else if ([self isKindOfClass:UIViewController.class]){
        UIViewController * viewController = (UIViewController *)self;
        [viewController.view addSubview:view];
    }
}

-(void)setGz_LabelLeft:(UILabel *)gz_LabelLeft{
    objc_setAssociatedObject(self, @selector(gz_LabelLeft), gz_LabelLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)gz_LabelLeft{
    return (UILabel *)[self gz_getView:_cmd];
}

-(void)setGz_LabelTop:(UILabel *)gz_LabelTop{
    objc_setAssociatedObject(self, @selector(gz_LabelTop), gz_LabelTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)gz_LabelTop{
    return (UILabel *)[self gz_getView:_cmd];
}

-(void)setGz_LabelRight:(UILabel *)gz_LabelRight{
    objc_setAssociatedObject(self, @selector(gz_LabelRight), gz_LabelRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)gz_LabelRight{
    return (UILabel *)[self gz_getView:_cmd];
}

-(void)setGz_LabelBottom:(UILabel *)gz_LabelBottom{
    objc_setAssociatedObject(self, @selector(gz_LabelBottom), gz_LabelBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)gz_LabelBottom{
    return (UILabel *)[self gz_getView:_cmd];
}

-(void)setGz_LabelCenter:(UILabel *)gz_LabelCenter{
    objc_setAssociatedObject(self, @selector(gz_LabelCenter), gz_LabelCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILabel *)gz_LabelCenter{
    return (UILabel *)[self gz_getView:_cmd];
}

-(void)setGz_ButtonLeft:(UIButton *)gz_ButtonLeft{
    objc_setAssociatedObject(self, @selector(gz_ButtonLeft), gz_ButtonLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)gz_ButtonLeft{
    return (UIButton *)[self gz_getView:_cmd];
}

-(void)setGz_ButtonTop:(UIButton *)gz_ButtonTop{
    objc_setAssociatedObject(self, @selector(gz_ButtonTop), gz_ButtonTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)gz_ButtonTop{
    return (UIButton *)[self gz_getView:_cmd];
}

-(void)setGz_ButtonRight:(UIButton *)gz_ButtonRight{
    objc_setAssociatedObject(self, @selector(gz_ButtonRight), gz_ButtonRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)gz_ButtonRight{
    return (UIButton *)[self gz_getView:_cmd];
}

-(void)setGz_ButtonBottom:(UIButton *)gz_ButtonBottom{
    objc_setAssociatedObject(self, @selector(gz_ButtonBottom), gz_ButtonBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)gz_ButtonBottom{
    return (UIButton *)[self gz_getView:_cmd];
}

-(void)setGz_ButtonCenter:(UIButton *)gz_ButtonCenter{
    objc_setAssociatedObject(self, @selector(gz_ButtonCenter), gz_ButtonCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)gz_ButtonCenter{
    return (UIButton *)[self gz_getView:_cmd];
}
-(void)setGz_ControlLeft:(UIControl *)gz_ControlLeft{
    objc_setAssociatedObject(self, @selector(gz_ControlLeft), gz_ControlLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)gz_ControlLeft{
    return (UIControl *)[self gz_getView:_cmd];
}

-(void)setGz_ControlTop:(UIControl *)gz_ControlTop{
    objc_setAssociatedObject(self, @selector(gz_ControlTop), gz_ControlTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)gz_ControlTop{
    return (UIControl *)[self gz_getView:_cmd];
}

-(void)setGz_ControlRight:(UIControl *)gz_ControlRight{
    objc_setAssociatedObject(self, @selector(gz_ControlRight), gz_ControlRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)gz_ControlRight{
    return (UIControl *)[self gz_getView:_cmd];
}

-(void)setGz_ControlBottom:(UIControl *)gz_ControlBottom{
    objc_setAssociatedObject(self, @selector(gz_ControlBottom), gz_ControlBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)gz_ControlBottom{
    return (UIControl *)[self gz_getView:_cmd];
}

-(void)setGz_ControlCenter:(UIControl *)gz_ControlCenter{
    objc_setAssociatedObject(self, @selector(gz_ControlCenter), gz_ControlCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)gz_ControlCenter{
    return (UIControl *)[self gz_getView:_cmd];
}
-(void)setGz_SegmentedLeft:(UISegmentedControl *)gz_SegmentedLeft{
    objc_setAssociatedObject(self, @selector(gz_SegmentedLeft), gz_SegmentedLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)gz_SegmentedLeft{
    return (UISegmentedControl *)[self gz_getView:_cmd];
}

-(void)setGz_SegmentedTop:(UISegmentedControl *)gz_SegmentedTop{
    objc_setAssociatedObject(self, @selector(gz_SegmentedTop), gz_SegmentedTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)gz_SegmentedTop{
    return (UISegmentedControl *)[self gz_getView:_cmd];
}

-(void)setGz_SegmentedRight:(UISegmentedControl *)gz_SegmentedRight{
    objc_setAssociatedObject(self, @selector(gz_SegmentedRight), gz_SegmentedRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)gz_SegmentedRight{
    return (UISegmentedControl *)[self gz_getView:_cmd];
}

-(void)setGz_SegmentedBottom:(UISegmentedControl *)gz_SegmentedBottom{
    objc_setAssociatedObject(self, @selector(gz_SegmentedBottom), gz_SegmentedBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)gz_SegmentedBottom{
    return (UISegmentedControl *)[self gz_getView:_cmd];
}

-(void)setGz_SegmentedCenter:(UISegmentedControl *)gz_SegmentedCenter{
    objc_setAssociatedObject(self, @selector(gz_SegmentedCenter), gz_SegmentedCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)gz_SegmentedCenter{
    return (UISegmentedControl *)[self gz_getView:_cmd];
}

-(void)setGz_TextFieldLeft:(UITextField *)gz_TextFieldLeft{
    objc_setAssociatedObject(self, @selector(gz_TextFieldLeft), gz_TextFieldLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)gz_TextFieldLeft{
    return (UITextField *)[self gz_getView:_cmd];
}

-(void)setGz_TextFieldTop:(UITextField *)gz_TextFieldTop{
    objc_setAssociatedObject(self, @selector(gz_TextFieldTop), gz_TextFieldTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)gz_TextFieldTop{
    return (UITextField *)[self gz_getView:_cmd];
}

-(void)setGz_TextFieldRight:(UITextField *)gz_TextFieldRight{
    objc_setAssociatedObject(self, @selector(gz_TextFieldRight), gz_TextFieldRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)gz_TextFieldRight{
    return (UITextField *)[self gz_getView:_cmd];
}

-(void)setGz_TextFieldBottom:(UITextField *)gz_TextFieldBottom{
    objc_setAssociatedObject(self, @selector(gz_TextFieldBottom), gz_TextFieldBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)gz_TextFieldBottom{
    return (UITextField *)[self gz_getView:_cmd];
}

-(void)setGz_TextFieldCenter:(UITextField *)gz_TextFieldCenter{
    objc_setAssociatedObject(self, @selector(gz_TextFieldCenter), gz_TextFieldCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)gz_TextFieldCenter{
    return (UITextField *)[self gz_getView:_cmd];
}

-(void)setGz_SliderLeft:(UISlider *)gz_SliderLeft{
    objc_setAssociatedObject(self, @selector(gz_SliderLeft), gz_SliderLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)gz_SliderLeft{
    return (UISlider *)[self gz_getView:_cmd];
}

-(void)setGz_SliderTop:(UISlider *)gz_SliderTop{
    objc_setAssociatedObject(self, @selector(gz_SliderTop), gz_SliderTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)gz_SliderTop{
    return (UISlider *)[self gz_getView:_cmd];
}

-(void)setGz_SliderRight:(UISlider *)gz_SliderRight{
    objc_setAssociatedObject(self, @selector(gz_SliderRight), gz_SliderRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)gz_SliderRight{
    return (UISlider *)[self gz_getView:_cmd];
}

-(void)setGz_SliderBottom:(UISlider *)gz_SliderBottom{
    objc_setAssociatedObject(self, @selector(gz_SliderBottom), gz_SliderBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)gz_SliderBottom{
    return (UISlider *)[self gz_getView:_cmd];
}

-(void)setGz_SliderCenter:(UISlider *)gz_SliderCenter{
    objc_setAssociatedObject(self, @selector(gz_SliderCenter), gz_SliderCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)gz_SliderCenter{
    return (UISlider *)[self gz_getView:_cmd];
}

-(void)setGz_SwitchLeft:(UISwitch *)gz_SwitchLeft{
    objc_setAssociatedObject(self, @selector(gz_SwitchLeft), gz_SwitchLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)gz_SwitchLeft{
    return (UISwitch *)[self gz_getView:_cmd];
}

-(void)setGz_SwitchTop:(UISwitch *)gz_SwitchTop{
    objc_setAssociatedObject(self, @selector(gz_SwitchTop), gz_SwitchTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)gz_SwitchTop{
    return (UISwitch *)[self gz_getView:_cmd];
}

-(void)setGz_SwitchRight:(UISwitch *)gz_SwitchRight{
    objc_setAssociatedObject(self, @selector(gz_SwitchRight), gz_SwitchRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)gz_SwitchRight{
    return (UISwitch *)[self gz_getView:_cmd];
}

-(void)setGz_SwitchBottom:(UISwitch *)gz_SwitchBottom{
    objc_setAssociatedObject(self, @selector(gz_SwitchBottom), gz_SwitchBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)gz_SwitchBottom{
    return (UISwitch *)[self gz_getView:_cmd];
}

-(void)setGz_SwitchCenter:(UISwitch *)gz_SwitchCenter{
    objc_setAssociatedObject(self, @selector(gz_SwitchCenter), gz_SwitchCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)gz_SwitchCenter{
    return (UISwitch *)[self gz_getView:_cmd];
}

-(void)setGz_ActivityIndicatorLeft:(UIActivityIndicatorView *)gz_ActivityIndicatorLeft{
    objc_setAssociatedObject(self, @selector(gz_ActivityIndicatorLeft), gz_ActivityIndicatorLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)gz_ActivityIndicatorLeft{
    return (UIActivityIndicatorView *)[self gz_getView:_cmd];
}

-(void)setGz_ActivityIndicatorTop:(UIActivityIndicatorView *)gz_ActivityIndicatorTop{
    objc_setAssociatedObject(self, @selector(gz_ActivityIndicatorTop), gz_ActivityIndicatorTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)gz_ActivityIndicatorTop{
    return (UIActivityIndicatorView *)[self gz_getView:_cmd];
}

-(void)setGz_ActivityIndicatorRight:(UIActivityIndicatorView *)gz_ActivityIndicatorRight{
    objc_setAssociatedObject(self, @selector(gz_ActivityIndicatorRight), gz_ActivityIndicatorRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)gz_ActivityIndicatorRight{
    return (UIActivityIndicatorView *)[self gz_getView:_cmd];
}

-(void)setGz_ActivityIndicatorBottom:(UIActivityIndicatorView *)gz_ActivityIndicatorBottom{
    objc_setAssociatedObject(self, @selector(gz_ActivityIndicatorBottom), gz_ActivityIndicatorBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)gz_ActivityIndicatorBottom{
    return (UIActivityIndicatorView *)[self gz_getView:_cmd];
}

-(void)setGz_ActivityIndicatorCenter:(UIActivityIndicatorView *)gz_ActivityIndicatorCenter{
    objc_setAssociatedObject(self, @selector(gz_ActivityIndicatorCenter), gz_ActivityIndicatorCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)gz_ActivityIndicatorCenter{
    return (UIActivityIndicatorView *)[self gz_getView:_cmd];
}

-(void)setGz_ProgressLeft:(UIProgressView *)gz_ProgressLeft{
    objc_setAssociatedObject(self, @selector(gz_ProgressLeft), gz_ProgressLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)gz_ProgressLeft{
    return (UIProgressView *)[self gz_getView:_cmd];
}

-(void)setGz_ProgressTop:(UIProgressView *)gz_ProgressTop{
    objc_setAssociatedObject(self, @selector(gz_ProgressTop), gz_ProgressTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)gz_ProgressTop{
    return (UIProgressView *)[self gz_getView:_cmd];
}

-(void)setGz_ProgressRight:(UIProgressView *)gz_ProgressRight{
    objc_setAssociatedObject(self, @selector(gz_ProgressRight), gz_ProgressRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)gz_ProgressRight{
    return (UIProgressView *)[self gz_getView:_cmd];
}

-(void)setGz_ProgressBottom:(UIProgressView *)gz_ProgressBottom{
    objc_setAssociatedObject(self, @selector(gz_ProgressBottom), gz_ProgressBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)gz_ProgressBottom{
    return (UIProgressView *)[self gz_getView:_cmd];
}

-(void)setGz_ProgressCenter:(UIProgressView *)gz_ProgressCenter{
    objc_setAssociatedObject(self, @selector(gz_ProgressCenter), gz_ProgressCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)gz_ProgressCenter{
    return (UIProgressView *)[self gz_getView:_cmd];
}

-(void)setGz_PageControlLeft:(UIPageControl *)gz_PageControlLeft{
    objc_setAssociatedObject(self, @selector(gz_PageControlLeft), gz_PageControlLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)gz_PageControlLeft{
    return (UIPageControl *)[self gz_getView:_cmd];
}

-(void)setGz_PageControlTop:(UIPageControl *)gz_PageControlTop{
    objc_setAssociatedObject(self, @selector(gz_PageControlTop), gz_PageControlTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)gz_PageControlTop{
    return (UIPageControl *)[self gz_getView:_cmd];
}

-(void)setGz_PageControlRight:(UIPageControl *)gz_PageControlRight{
    objc_setAssociatedObject(self, @selector(gz_PageControlRight), gz_PageControlRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)gz_PageControlRight{
    return (UIPageControl *)[self gz_getView:_cmd];
}

-(void)setGz_PageControlBottom:(UIPageControl *)gz_PageControlBottom{
    objc_setAssociatedObject(self, @selector(gz_PageControlBottom), gz_PageControlBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)gz_PageControlBottom{
    return (UIPageControl *)[self gz_getView:_cmd];
}

-(void)setGz_PageControlCenter:(UIPageControl *)gz_PageControlCenter{
    objc_setAssociatedObject(self, @selector(gz_PageControlCenter), gz_PageControlCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)gz_PageControlCenter{
    return (UIPageControl *)[self gz_getView:_cmd];
}

-(void)setGz_StepperLeft:(UIStepper *)gz_StepperLeft{
    objc_setAssociatedObject(self, @selector(gz_StepperLeft), gz_StepperLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)gz_StepperLeft{
    return (UIStepper *)[self gz_getView:_cmd];
}

-(void)setGz_StepperTop:(UIStepper *)gz_StepperTop{
    objc_setAssociatedObject(self, @selector(gz_StepperTop), gz_StepperTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)gz_StepperTop{
    return (UIStepper *)[self gz_getView:_cmd];
}

-(void)setGz_StepperRight:(UIStepper *)gz_StepperRight{
    objc_setAssociatedObject(self, @selector(gz_StepperRight), gz_StepperRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)gz_StepperRight{
    return (UIStepper *)[self gz_getView:_cmd];
}

-(void)setGz_StepperBottom:(UIStepper *)gz_StepperBottom{
    objc_setAssociatedObject(self, @selector(gz_StepperBottom), gz_StepperBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)gz_StepperBottom{
    return (UIStepper *)[self gz_getView:_cmd];
}

-(void)setGz_StepperCenter:(UIStepper *)gz_StepperCenter{
    objc_setAssociatedObject(self, @selector(gz_StepperCenter), gz_StepperCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)gz_StepperCenter{
    return (UIStepper *)[self gz_getView:_cmd];
}

-(void)setGz_TableViewLeft:(UITableView *)gz_TableViewLeft{
    objc_setAssociatedObject(self, @selector(gz_TableViewLeft), gz_TableViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)gz_TableViewLeft{
    return (UITableView *)[self gz_getView:_cmd];
}

-(void)setGz_TableViewTop:(UITableView *)gz_TableViewTop{
    objc_setAssociatedObject(self, @selector(gz_TableViewTop), gz_TableViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)gz_TableViewTop{
    return (UITableView *)[self gz_getView:_cmd];
}

-(void)setGz_TableViewRight:(UITableView *)gz_TableViewRight{
    objc_setAssociatedObject(self, @selector(gz_TableViewRight), gz_TableViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)gz_TableViewRight{
    return (UITableView *)[self gz_getView:_cmd];
}

-(void)setGz_TableViewBottom:(UITableView *)gz_TableViewBottom{
    objc_setAssociatedObject(self, @selector(gz_TableViewBottom), gz_TableViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)gz_TableViewBottom{
    return (UITableView *)[self gz_getView:_cmd];
}

-(void)setGz_TableViewCenter:(UITableView *)gz_TableViewCenter{
    objc_setAssociatedObject(self, @selector(gz_TableViewCenter), gz_TableViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)gz_TableViewCenter{
    return (UITableView *)[self gz_getView:_cmd];
}

-(void)setGz_ImageViewLeft:(UIImageView *)gz_ImageViewLeft{
    objc_setAssociatedObject(self, @selector(gz_ImageViewLeft), gz_ImageViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)gz_ImageViewLeft{
    return (UIImageView *)[self gz_getView:_cmd];
}

-(void)setGz_ImageViewTop:(UIImageView *)gz_ImageViewTop{
    objc_setAssociatedObject(self, @selector(gz_ImageViewTop), gz_ImageViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)gz_ImageViewTop{
    return (UIImageView *)[self gz_getView:_cmd];
}

-(void)setGz_ImageViewRight:(UIImageView *)gz_ImageViewRight{
    objc_setAssociatedObject(self, @selector(gz_ImageViewRight), gz_ImageViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)gz_ImageViewRight{
    return (UIImageView *)[self gz_getView:_cmd];
}

-(void)setGz_ImageViewBottom:(UIImageView *)gz_ImageViewBottom{
    objc_setAssociatedObject(self, @selector(gz_ImageViewBottom), gz_ImageViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)gz_ImageViewBottom{
    return (UIImageView *)[self gz_getView:_cmd];
}

-(void)setGz_ImageViewCenter:(UIImageView *)gz_ImageViewCenter{
    objc_setAssociatedObject(self, @selector(gz_ImageViewCenter), gz_ImageViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)gz_ImageViewCenter{
    return (UIImageView *)[self gz_getView:_cmd];
}

-(void)setGz_CollectionLayoutLeft:(UICollectionViewLayout *)gz_CollectionLayoutLeft{
    objc_setAssociatedObject(self, @selector(gz_CollectionLayoutLeft), gz_CollectionLayoutLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)gz_CollectionLayoutLeft{
    return [self gz_getCollecLayout:_cmd];
}

-(void)setGz_CollectionLayoutTop:(UICollectionViewLayout *)gz_CollectionLayoutTop{
    objc_setAssociatedObject(self, @selector(gz_CollectionLayoutTop), gz_CollectionLayoutTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)gz_CollectionLayoutTop{
    return [self gz_getCollecLayout:_cmd];
}

-(void)setGz_CollectionLayoutRight:(UICollectionViewLayout *)gz_CollectionLayoutRight{
    objc_setAssociatedObject(self, @selector(gz_CollectionLayoutRight), gz_CollectionLayoutRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)gz_CollectionLayoutRight{
    return [self gz_getCollecLayout:_cmd];
}

-(void)setGz_CollectionLayoutBottom:(UICollectionViewLayout *)gz_CollectionLayoutBottom{
    objc_setAssociatedObject(self, @selector(gz_CollectionLayoutBottom), gz_CollectionLayoutBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)gz_CollectionLayoutBottom{
    return [self gz_getCollecLayout:_cmd];
}

-(void)setGz_CollectionLayoutCenter:(UICollectionViewLayout *)gz_CollectionLayoutCenter{
    objc_setAssociatedObject(self, @selector(gz_CollectionLayoutCenter), gz_CollectionLayoutCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)gz_CollectionLayoutCenter{
    return [self gz_getCollecLayout:_cmd];
}

-(void)setGz_CollectionLeft:(UICollectionView *)gz_CollectionLeft{
    objc_setAssociatedObject(self, @selector(gz_CollectionLeft), gz_CollectionLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)gz_CollectionLeft{
    return [self gz_getCollectionView:_cmd];
}

-(void)setGz_CollectionTop:(UICollectionView *)gz_CollectionTop{
    objc_setAssociatedObject(self, @selector(gz_CollectionTop), gz_CollectionTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)gz_CollectionTop{
    return [self gz_getCollectionView:_cmd];
}

-(void)setGz_CollectionRight:(UICollectionView *)gz_CollectionRight{
    objc_setAssociatedObject(self, @selector(gz_CollectionRight), gz_CollectionRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)gz_CollectionRight{
    return [self gz_getCollectionView:_cmd];
}

-(void)setGz_CollectionBottom:(UICollectionView *)gz_CollectionBottom{
    objc_setAssociatedObject(self, @selector(gz_CollectionBottom), gz_CollectionBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)gz_CollectionBottom{
    return [self gz_getCollectionView:_cmd];
}

-(void)setGz_CollectionCenter:(UICollectionView *)gz_CollectionCenter{
    objc_setAssociatedObject(self, @selector(gz_CollectionCenter), gz_CollectionCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)gz_CollectionCenter{
    return [self gz_getCollectionView:_cmd];
}

-(void)setGz_TextViewLeft:(UITextView *)gz_TextViewLeft{
    objc_setAssociatedObject(self, @selector(gz_TextViewLeft), gz_TextViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)gz_TextViewLeft{
    return (UITextView *)[self gz_getView:_cmd];
}

-(void)setGz_TextViewTop:(UITextView *)gz_TextViewTop{
    objc_setAssociatedObject(self, @selector(gz_TextViewTop), gz_TextViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)gz_TextViewTop{
    return (UITextView *)[self gz_getView:_cmd];
}

-(void)setGz_TextViewRight:(UITextView *)gz_TextViewRight{
    objc_setAssociatedObject(self, @selector(gz_TextViewRight), gz_TextViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)gz_TextViewRight{
    return (UITextView *)[self gz_getView:_cmd];
}

-(void)setGz_TextViewBottom:(UITextView *)gz_TextViewBottom{
    objc_setAssociatedObject(self, @selector(gz_TextViewBottom), gz_TextViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)gz_TextViewBottom{
    return (UITextView *)[self gz_getView:_cmd];
}

-(void)setGz_TextViewCenter:(UITextView *)gz_TextViewCenter{
    objc_setAssociatedObject(self, @selector(gz_TextViewCenter), gz_TextViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)gz_TextViewCenter{
    return (UITextView *)[self gz_getView:_cmd];
}

-(void)setGz_ScrollLeft:(UIScrollView *)gz_ScrollLeft{
    objc_setAssociatedObject(self, @selector(gz_ScrollLeft), gz_ScrollLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)gz_ScrollLeft{
    return (UIScrollView *)[self gz_getView:_cmd];
}

-(void)setGz_ScrollTop:(UIScrollView *)gz_ScrollTop{
    objc_setAssociatedObject(self, @selector(gz_ScrollTop), gz_ScrollTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)gz_ScrollTop{
    return (UIScrollView *)[self gz_getView:_cmd];
}

-(void)setGz_ScrollRight:(UIScrollView *)gz_ScrollRight{
    objc_setAssociatedObject(self, @selector(gz_ScrollRight), gz_ScrollRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)gz_ScrollRight{
    return (UIScrollView *)[self gz_getView:_cmd];
}

-(void)setGz_ScrollBottom:(UIScrollView *)gz_ScrollBottom{
    objc_setAssociatedObject(self, @selector(gz_ScrollBottom), gz_ScrollBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)gz_ScrollBottom{
    return (UIScrollView *)[self gz_getView:_cmd];
}

-(void)setGz_ScrollCenter:(UIScrollView *)gz_ScrollCenter{
    objc_setAssociatedObject(self, @selector(gz_ScrollCenter), gz_ScrollCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)gz_ScrollCenter{
    return (UIScrollView *)[self gz_getView:_cmd];
}

-(void)setGz_DatePickerLeft:(UIDatePicker *)gz_DatePickerLeft{
    objc_setAssociatedObject(self, @selector(gz_DatePickerLeft), gz_DatePickerLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)gz_DatePickerLeft{
    return (UIDatePicker *)[self gz_getView:_cmd];
}

-(void)setGz_DatePickerTop:(UIDatePicker *)gz_DatePickerTop{
    objc_setAssociatedObject(self, @selector(gz_DatePickerTop), gz_DatePickerTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)gz_DatePickerTop{
    return (UIDatePicker *)[self gz_getView:_cmd];
}

-(void)setGz_DatePickerRight:(UIDatePicker *)gz_DatePickerRight{
    objc_setAssociatedObject(self, @selector(gz_DatePickerRight), gz_DatePickerRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)gz_DatePickerRight{
    return (UIDatePicker *)[self gz_getView:_cmd];
}

-(void)setGz_DatePickerBottom:(UIDatePicker *)gz_DatePickerBottom{
    objc_setAssociatedObject(self, @selector(gz_DatePickerBottom), gz_DatePickerBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)gz_DatePickerBottom{
    return (UIDatePicker *)[self gz_getView:_cmd];
}

-(void)setGz_DatePickerCenter:(UIDatePicker *)gz_DatePickerCenter{
    objc_setAssociatedObject(self, @selector(gz_DatePickerCenter), gz_DatePickerCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)gz_DatePickerCenter{
    return (UIDatePicker *)[self gz_getView:_cmd];
}

-(void)setGz_PickerViewLeft:(UIPickerView *)gz_PickerViewLeft{
    objc_setAssociatedObject(self, @selector(gz_PickerViewLeft), gz_PickerViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)gz_PickerViewLeft{
    return (UIPickerView *)[self gz_getView:_cmd];
}

-(void)setGz_PickerViewTop:(UIPickerView *)gz_PickerViewTop{
    objc_setAssociatedObject(self, @selector(gz_PickerViewTop), gz_PickerViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)gz_PickerViewTop{
    return (UIPickerView *)[self gz_getView:_cmd];
}

-(void)setGz_PickerViewRight:(UIPickerView *)gz_PickerViewRight{
    objc_setAssociatedObject(self, @selector(gz_PickerViewRight), gz_PickerViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)gz_PickerViewRight{
    return (UIPickerView *)[self gz_getView:_cmd];
}

-(void)setGz_PickerViewBottom:(UIPickerView *)gz_PickerViewBottom{
    objc_setAssociatedObject(self, @selector(gz_PickerViewBottom), gz_PickerViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)gz_PickerViewBottom{
    return (UIPickerView *)[self gz_getView:_cmd];
}

-(void)setGz_PickerViewCenter:(UIPickerView *)gz_PickerViewCenter{
    objc_setAssociatedObject(self, @selector(gz_PickerViewCenter), gz_PickerViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)gz_PickerViewCenter{
    return (UIPickerView *)[self gz_getView:_cmd];
}

-(void)setGz_WkWebLeft:(WKWebView *)gz_WkWebLeft{
    objc_setAssociatedObject(self, @selector(gz_WkWebLeft), gz_WkWebLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)gz_WkWebLeft{
    return (WKWebView *)[self gz_getView:_cmd];
}

-(void)setGz_WkWebTop:(WKWebView *)gz_WkWebTop{
    objc_setAssociatedObject(self, @selector(gz_WkWebTop), gz_WkWebTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)gz_WkWebTop{
    return (WKWebView *)[self gz_getView:_cmd];
}

-(void)setGz_WkWebRight:(WKWebView *)gz_WkWebRight{
    objc_setAssociatedObject(self, @selector(gz_WkWebRight), gz_WkWebRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)gz_WkWebRight{
    return (WKWebView *)[self gz_getView:_cmd];
}

-(void)setGz_WkWebBottom:(WKWebView *)gz_WkWebBottom{
    objc_setAssociatedObject(self, @selector(gz_WkWebBottom), gz_WkWebBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)gz_WkWebBottom{
    return (WKWebView *)[self gz_getView:_cmd];
}

-(void)setGz_WkWebCenter:(WKWebView *)gz_WkWebCenter{
    objc_setAssociatedObject(self, @selector(gz_WkWebCenter), gz_WkWebCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)gz_WkWebCenter{
    return (WKWebView *)[self gz_getView:_cmd];
}

-(void)setGz_ViewLeft:(UIView *)gz_ViewLeft{
    objc_setAssociatedObject(self, @selector(gz_ViewLeft), gz_ViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)gz_ViewLeft{
    return (UIView *)[self gz_getView:_cmd];
}

-(void)setGz_ViewTop:(UIView *)gz_ViewTop{
    objc_setAssociatedObject(self, @selector(gz_ViewTop), gz_ViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)gz_ViewTop{
    return (UIView *)[self gz_getView:_cmd];
}

-(void)setGz_ViewRight:(UIView *)gz_ViewRight{
    objc_setAssociatedObject(self, @selector(gz_ViewRight), gz_ViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)gz_ViewRight{
    return (UIView *)[self gz_getView:_cmd];
}

-(void)setGz_ViewBottom:(UIView *)gz_ViewBottom{
    objc_setAssociatedObject(self, @selector(gz_ViewBottom), gz_ViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)gz_ViewBottom{
    return (UIView *)[self gz_getView:_cmd];
}

-(void)setGz_ViewCenter:(UIView *)gz_ViewCenter{
    objc_setAssociatedObject(self, @selector(gz_ViewCenter), gz_ViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)gz_ViewCenter{
    return (UIView *)[self gz_getView:_cmd];
}

-(void)setGz_ToolbarLeft:(UIToolbar *)gz_ToolbarLeft{
    objc_setAssociatedObject(self, @selector(gz_ToolbarLeft), gz_ToolbarLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)gz_ToolbarLeft{
    return (UIToolbar *)[self gz_getView:_cmd];
}

-(void)setGz_ToolbarTop:(UIToolbar *)gz_ToolbarTop{
    objc_setAssociatedObject(self, @selector(gz_ToolbarTop), gz_ToolbarTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)gz_ToolbarTop{
    return (UIToolbar *)[self gz_getView:_cmd];
}

-(void)setGz_ToolbarRight:(UIToolbar *)gz_ToolbarRight{
    objc_setAssociatedObject(self, @selector(gz_ToolbarRight), gz_ToolbarRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)gz_ToolbarRight{
    return (UIToolbar *)[self gz_getView:_cmd];
}

-(void)setGz_ToolbarBottom:(UIToolbar *)gz_ToolbarBottom{
    objc_setAssociatedObject(self, @selector(gz_ToolbarBottom), gz_ToolbarBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)gz_ToolbarBottom{
    return (UIToolbar *)[self gz_getView:_cmd];
}

-(void)setGz_ToolbarCenter:(UIToolbar *)gz_ToolbarCenter{
    objc_setAssociatedObject(self, @selector(gz_ToolbarCenter), gz_ToolbarCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)gz_ToolbarCenter{
    return (UIToolbar *)[self gz_getView:_cmd];
}

-(void)setGz_SearchBarLeft:(UISearchBar *)gz_SearchBarLeft{
    objc_setAssociatedObject(self, @selector(gz_SearchBarLeft), gz_SearchBarLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)gz_SearchBarLeft{
    return (UISearchBar *)[self gz_getView:_cmd];
}

-(void)setGz_SearchBarTop:(UISearchBar *)gz_SearchBarTop{
    objc_setAssociatedObject(self, @selector(gz_SearchBarTop), gz_SearchBarTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)gz_SearchBarTop{
    return (UISearchBar *)[self gz_getView:_cmd];
}

-(void)setGz_SearchBarRight:(UISearchBar *)gz_SearchBarRight{
    objc_setAssociatedObject(self, @selector(gz_SearchBarRight), gz_SearchBarRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)gz_SearchBarRight{
    return (UISearchBar *)[self gz_getView:_cmd];
}

-(void)setGz_SearchBarBottom:(UISearchBar *)gz_SearchBarBottom{
    objc_setAssociatedObject(self, @selector(gz_SearchBarBottom), gz_SearchBarBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)gz_SearchBarBottom{
    return (UISearchBar *)[self gz_getView:_cmd];
}

-(void)setGz_SearchBarCenter:(UISearchBar *)gz_SearchBarCenter{
    objc_setAssociatedObject(self, @selector(gz_SearchBarCenter), gz_SearchBarCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)gz_SearchBarCenter{
    return (UISearchBar *)[self gz_getView:_cmd];
}

-(void)setGz_TapGestureRecognizer:(UITapGestureRecognizer *)gz_TapGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_TapGestureRecognizer), gz_TapGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITapGestureRecognizer *)gz_TapGestureRecognizer{
    return (UITapGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_PinchGestureRecognizer:(UIPinchGestureRecognizer *)gz_PinchGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_PinchGestureRecognizer), gz_PinchGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPinchGestureRecognizer *)gz_PinchGestureRecognizer{
    return (UIPinchGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_RotationGestureRecognizer:(UIRotationGestureRecognizer *)gz_RotationGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_RotationGestureRecognizer), gz_RotationGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIRotationGestureRecognizer *)gz_RotationGestureRecognizer{
    return (UIRotationGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_SwipeGestureRecognizer:(UISwipeGestureRecognizer *)gz_SwipeGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_SwipeGestureRecognizer), gz_SwipeGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwipeGestureRecognizer *)gz_SwipeGestureRecognizer{
    return (UISwipeGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_PanGestureRecognizer:(UIPanGestureRecognizer *)gz_PanGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_PanGestureRecognizer), gz_PanGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPanGestureRecognizer *)gz_PanGestureRecognizer{
    return (UIPanGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_ScreenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)gz_ScreenEdgePanGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_ScreenEdgePanGestureRecognizer), gz_ScreenEdgePanGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScreenEdgePanGestureRecognizer *)gz_ScreenEdgePanGestureRecognizer{
    return (UIScreenEdgePanGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

-(void)setGz_LongPressGestureRecognizer:(UILongPressGestureRecognizer *)gz_LongPressGestureRecognizer{
    objc_setAssociatedObject(self, @selector(gz_LongPressGestureRecognizer), gz_LongPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILongPressGestureRecognizer *)gz_LongPressGestureRecognizer{
    return (UILongPressGestureRecognizer *)[self gz_getGestureRecognizer:_cmd];
}

@end
