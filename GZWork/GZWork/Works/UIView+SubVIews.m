//
//  UIView+SubVIews.m
//  GZWork
//
//  Created by Tim on 2018/3/19.
//  Copyright © 2018年 tim. All rights reserved.
//

#import "UIView+SubVIews.h"
#import <objc/message.h>
@implementation UIView (SubVIews)

///获取属性的类型
-(Class)getViewProper:(SEL)sel{
    objc_property_t p = class_getProperty(self.class, NSStringFromSelector(sel).UTF8String);
    NSString *attrs = @(property_getAttributes(p));
    NSUInteger dotLoc = [attrs rangeOfString:@","].location;
    NSString *code = nil;
    NSUInteger loc = 3;
    if (dotLoc == NSNotFound) { // 没有,
        code = [attrs substringFromIndex:loc];
    } else {
        code = [attrs substringWithRange:NSMakeRange(loc, dotLoc - loc-1)];
    }
    if ([code isEqualToString:NSStringFromClass(WKWebView.class)]) {
       return NSClassFromString(code);
    }
    return NSClassFromString(code);
}
///获取当前需要创建的对象
-(UIView *)getView:(SEL)sel{
    UIView * view = objc_getAssociatedObject(self, sel);
    if (!view) {
        view =[[[self getViewProper:sel] alloc] init];
        [self setValue:view forKey:NSStringFromSelector(sel)];
        [self addSubview:view];
    }
    return view;
}
-(UICollectionView *)getCollectionView:(SEL)sel{
    UICollectionView * view = objc_getAssociatedObject(self, sel);
    if (!view) {
        NSMutableString *targerStr = [[NSMutableString alloc] initWithString:NSStringFromSelector(sel)];
        NSRange range = [targerStr rangeOfString:@"collection"];
        if (range.location != NSNotFound) {
            [targerStr insertString:@"Layout" atIndex:range.location+range.length];
        }else{
            NSLog(@"Not Found %@",NSStringFromSelector(sel));
        }
        view =[[[self getViewProper:sel] alloc] initWithFrame:CGRectZero collectionViewLayout:[self valueForKeyPath:targerStr]];
        [self setValue:view forKey:NSStringFromSelector(sel)];
        [self addSubview:view];
    }
    return view;
}

///设置默认布局
-(UICollectionViewLayout *)getCollecLayout:(SEL)sel{
    UICollectionViewLayout * layout = objc_getAssociatedObject(self, sel);
    if (!layout) {
        layout =[[[self getViewProper:sel] alloc] init];
        [self setValue:layout forKey:NSStringFromSelector(sel)];
    }
    return layout;
}

///添加手势
-(UIGestureRecognizer *)getGestureRecognizer:(SEL)sel{
    UIGestureRecognizer * gestureRecognizer = objc_getAssociatedObject(self, sel);
    if (!gestureRecognizer) {
        gestureRecognizer =[[[self getViewProper:sel] alloc] init];
        [self setValue:gestureRecognizer forKey:NSStringFromSelector(sel)];
        [self addGestureRecognizer:gestureRecognizer];
    }
    return gestureRecognizer;
}

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

-(void)setButtonLeft:(UIButton *)buttonLeft{
    objc_setAssociatedObject(self, @selector(buttonLeft), buttonLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)buttonLeft{
    return (UIButton *)[self getView:_cmd];
}

-(void)setButtonTop:(UIButton *)buttonTop{
    objc_setAssociatedObject(self, @selector(buttonTop), buttonTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)buttonTop{
    return (UIButton *)[self getView:_cmd];
}

-(void)setButtonRight:(UIButton *)buttonRight{
    objc_setAssociatedObject(self, @selector(buttonRight), buttonRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)buttonRight{
    return (UIButton *)[self getView:_cmd];
}

-(void)setButtonBottom:(UIButton *)buttonBottom{
    objc_setAssociatedObject(self, @selector(buttonBottom), buttonBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)buttonBottom{
    return (UIButton *)[self getView:_cmd];
}

-(void)setButtonCenter:(UIButton *)buttonCenter{
    objc_setAssociatedObject(self, @selector(buttonCenter), buttonCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIButton *)buttonCenter{
    return (UIButton *)[self getView:_cmd];
}
-(void)setControlLeft:(UIControl *)controlLeft{
    objc_setAssociatedObject(self, @selector(controlLeft), controlLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)controlLeft{
    return (UIControl *)[self getView:_cmd];
}

-(void)setControlTop:(UIControl *)controlTop{
    objc_setAssociatedObject(self, @selector(controlTop), controlTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)controlTop{
    return (UIControl *)[self getView:_cmd];
}

-(void)setControlRight:(UIControl *)controlRight{
    objc_setAssociatedObject(self, @selector(controlRight), controlRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)controlRight{
    return (UIControl *)[self getView:_cmd];
}

-(void)setControlBottom:(UIControl *)controlBottom{
    objc_setAssociatedObject(self, @selector(controlBottom), controlBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)controlBottom{
    return (UIControl *)[self getView:_cmd];
}

-(void)setControlCenter:(UIControl *)controlCenter{
    objc_setAssociatedObject(self, @selector(controlCenter), controlCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIControl *)controlCenter{
    return (UIControl *)[self getView:_cmd];
}
-(void)setSegmentedLeft:(UISegmentedControl *)segmentedLeft{
    objc_setAssociatedObject(self, @selector(segmentedLeft), segmentedLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)segmentedLeft{
    return (UISegmentedControl *)[self getView:_cmd];
}

-(void)setSegmentedTop:(UISegmentedControl *)segmentedTop{
    objc_setAssociatedObject(self, @selector(segmentedTop), segmentedTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)segmentedTop{
    return (UISegmentedControl *)[self getView:_cmd];
}

-(void)setSegmentedRight:(UISegmentedControl *)segmentedRight{
    objc_setAssociatedObject(self, @selector(segmentedRight), segmentedRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)segmentedRight{
    return (UISegmentedControl *)[self getView:_cmd];
}

-(void)setSegmentedBottom:(UISegmentedControl *)segmentedBottom{
    objc_setAssociatedObject(self, @selector(segmentedBottom), segmentedBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)segmentedBottom{
    return (UISegmentedControl *)[self getView:_cmd];
}

-(void)setSegmentedCenter:(UISegmentedControl *)segmentedCenter{
    objc_setAssociatedObject(self, @selector(segmentedCenter), segmentedCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISegmentedControl *)segmentedCenter{
    return (UISegmentedControl *)[self getView:_cmd];
}

-(void)setTextFieldLeft:(UITextField *)textFieldLeft{
    objc_setAssociatedObject(self, @selector(textFieldLeft), textFieldLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)textFieldLeft{
    return (UITextField *)[self getView:_cmd];
}

-(void)setTextFieldTop:(UITextField *)textFieldTop{
    objc_setAssociatedObject(self, @selector(textFieldTop), textFieldTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)textFieldTop{
    return (UITextField *)[self getView:_cmd];
}

-(void)setTextFieldRight:(UITextField *)textFieldRight{
    objc_setAssociatedObject(self, @selector(textFieldRight), textFieldRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)textFieldRight{
    return (UITextField *)[self getView:_cmd];
}

-(void)setTextFieldBottom:(UITextField *)textFieldBottom{
    objc_setAssociatedObject(self, @selector(textFieldBottom), textFieldBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)textFieldBottom{
    return (UITextField *)[self getView:_cmd];
}

-(void)setTextFieldCenter:(UITextField *)textFieldCenter{
    objc_setAssociatedObject(self, @selector(textFieldCenter), textFieldCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextField *)textFieldCenter{
    return (UITextField *)[self getView:_cmd];
}

-(void)setSliderLeft:(UISlider *)sliderLeft{
    objc_setAssociatedObject(self, @selector(sliderLeft), sliderLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)sliderLeft{
    return (UISlider *)[self getView:_cmd];
}

-(void)setSliderTop:(UISlider *)sliderTop{
    objc_setAssociatedObject(self, @selector(sliderTop), sliderTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)sliderTop{
    return (UISlider *)[self getView:_cmd];
}

-(void)setSliderRight:(UISlider *)sliderRight{
    objc_setAssociatedObject(self, @selector(sliderRight), sliderRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)sliderRight{
    return (UISlider *)[self getView:_cmd];
}

-(void)setSliderBottom:(UISlider *)sliderBottom{
    objc_setAssociatedObject(self, @selector(sliderBottom), sliderBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)sliderBottom{
    return (UISlider *)[self getView:_cmd];
}

-(void)setSliderCenter:(UISlider *)sliderCenter{
    objc_setAssociatedObject(self, @selector(sliderCenter), sliderCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISlider *)sliderCenter{
    return (UISlider *)[self getView:_cmd];
}

-(void)setSwitchLeft:(UISwitch *)switchLeft{
    objc_setAssociatedObject(self, @selector(switchLeft), switchLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)switchLeft{
    return (UISwitch *)[self getView:_cmd];
}

-(void)setSwitchTop:(UISwitch *)switchTop{
    objc_setAssociatedObject(self, @selector(switchTop), switchTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)switchTop{
    return (UISwitch *)[self getView:_cmd];
}

-(void)setSwitchRight:(UISwitch *)switchRight{
    objc_setAssociatedObject(self, @selector(switchRight), switchRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)switchRight{
    return (UISwitch *)[self getView:_cmd];
}

-(void)setSwitchBottom:(UISwitch *)switchBottom{
    objc_setAssociatedObject(self, @selector(switchBottom), switchBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)switchBottom{
    return (UISwitch *)[self getView:_cmd];
}

-(void)setSwitchCenter:(UISwitch *)switchCenter{
    objc_setAssociatedObject(self, @selector(switchCenter), switchCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwitch *)switchCenter{
    return (UISwitch *)[self getView:_cmd];
}

-(void)setActivityIndicatorLeft:(UIActivityIndicatorView *)activityIndicatorLeft{
    objc_setAssociatedObject(self, @selector(activityIndicatorLeft), activityIndicatorLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activityIndicatorLeft{
    return (UIActivityIndicatorView *)[self getView:_cmd];
}

-(void)setActivityIndicatorTop:(UIActivityIndicatorView *)activityIndicatorTop{
    objc_setAssociatedObject(self, @selector(activityIndicatorTop), activityIndicatorTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activityIndicatorTop{
    return (UIActivityIndicatorView *)[self getView:_cmd];
}

-(void)setActivityIndicatorRight:(UIActivityIndicatorView *)activityIndicatorRight{
    objc_setAssociatedObject(self, @selector(activityIndicatorRight), activityIndicatorRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activityIndicatorRight{
    return (UIActivityIndicatorView *)[self getView:_cmd];
}

-(void)setActivityIndicatorBottom:(UIActivityIndicatorView *)activityIndicatorBottom{
    objc_setAssociatedObject(self, @selector(activityIndicatorBottom), activityIndicatorBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activityIndicatorBottom{
    return (UIActivityIndicatorView *)[self getView:_cmd];
}

-(void)setActivityIndicatorCenter:(UIActivityIndicatorView *)activityIndicatorCenter{
    objc_setAssociatedObject(self, @selector(activityIndicatorCenter), activityIndicatorCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIActivityIndicatorView *)activityIndicatorCenter{
    return (UIActivityIndicatorView *)[self getView:_cmd];
}

-(void)setProgressLeft:(UIProgressView *)progressLeft{
    objc_setAssociatedObject(self, @selector(progressLeft), progressLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)progressLeft{
    return (UIProgressView *)[self getView:_cmd];
}

-(void)setProgressTop:(UIProgressView *)progressTop{
    objc_setAssociatedObject(self, @selector(progressTop), progressTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)progressTop{
    return (UIProgressView *)[self getView:_cmd];
}

-(void)setProgressRight:(UIProgressView *)progressRight{
    objc_setAssociatedObject(self, @selector(progressRight), progressRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)progressRight{
    return (UIProgressView *)[self getView:_cmd];
}

-(void)setProgressBottom:(UIProgressView *)progressBottom{
    objc_setAssociatedObject(self, @selector(progressBottom), progressBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)progressBottom{
    return (UIProgressView *)[self getView:_cmd];
}

-(void)setProgressCenter:(UIProgressView *)progressCenter{
    objc_setAssociatedObject(self, @selector(progressCenter), progressCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIProgressView *)progressCenter{
    return (UIProgressView *)[self getView:_cmd];
}

-(void)setPageControlLeft:(UIPageControl *)pageControlLeft{
    objc_setAssociatedObject(self, @selector(pageControlLeft), pageControlLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)pageControlLeft{
    return (UIPageControl *)[self getView:_cmd];
}

-(void)setPageControlTop:(UIPageControl *)pageControlTop{
    objc_setAssociatedObject(self, @selector(pageControlTop), pageControlTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)pageControlTop{
    return (UIPageControl *)[self getView:_cmd];
}

-(void)setPageControlRight:(UIPageControl *)pageControlRight{
    objc_setAssociatedObject(self, @selector(pageControlRight), pageControlRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)pageControlRight{
    return (UIPageControl *)[self getView:_cmd];
}

-(void)setPageControlBottom:(UIPageControl *)pageControlBottom{
    objc_setAssociatedObject(self, @selector(pageControlBottom), pageControlBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)pageControlBottom{
    return (UIPageControl *)[self getView:_cmd];
}

-(void)setPageControlCenter:(UIPageControl *)pageControlCenter{
    objc_setAssociatedObject(self, @selector(pageControlCenter), pageControlCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPageControl *)pageControlCenter{
    return (UIPageControl *)[self getView:_cmd];
}

-(void)setStepperLeft:(UIStepper *)stepperLeft{
    objc_setAssociatedObject(self, @selector(stepperLeft), stepperLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)stepperLeft{
    return (UIStepper *)[self getView:_cmd];
}

-(void)setStepperTop:(UIStepper *)stepperTop{
    objc_setAssociatedObject(self, @selector(stepperTop), stepperTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)stepperTop{
    return (UIStepper *)[self getView:_cmd];
}

-(void)setStepperRight:(UIStepper *)stepperRight{
    objc_setAssociatedObject(self, @selector(stepperRight), stepperRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)stepperRight{
    return (UIStepper *)[self getView:_cmd];
}

-(void)setStepperBottom:(UIStepper *)stepperBottom{
    objc_setAssociatedObject(self, @selector(stepperBottom), stepperBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)stepperBottom{
    return (UIStepper *)[self getView:_cmd];
}

-(void)setStepperCenter:(UIStepper *)stepperCenter{
    objc_setAssociatedObject(self, @selector(stepperCenter), stepperCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIStepper *)stepperCenter{
    return (UIStepper *)[self getView:_cmd];
}

-(void)setTableLeft:(UITableView *)tableLeft{
    objc_setAssociatedObject(self, @selector(tableLeft), tableLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableLeft{
    return (UITableView *)[self getView:_cmd];
}

-(void)setTableTop:(UITableView *)tableTop{
    objc_setAssociatedObject(self, @selector(tableTop), tableTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableTop{
    return (UITableView *)[self getView:_cmd];
}

-(void)setTableRight:(UITableView *)tableRight{
    objc_setAssociatedObject(self, @selector(tableRight), tableRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableRight{
    return (UITableView *)[self getView:_cmd];
}

-(void)setTableBottom:(UITableView *)tableBottom{
    objc_setAssociatedObject(self, @selector(tableBottom), tableBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableBottom{
    return (UITableView *)[self getView:_cmd];
}

-(void)setTableCenter:(UITableView *)tableCenter{
    objc_setAssociatedObject(self, @selector(tableCenter), tableCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITableView *)tableCenter{
    return (UITableView *)[self getView:_cmd];
}

-(void)setImageViewLeft:(UIImageView *)imageViewLeft{
    objc_setAssociatedObject(self, @selector(imageViewLeft), imageViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)imageViewLeft{
    return (UIImageView *)[self getView:_cmd];
}

-(void)setImageViewTop:(UIImageView *)imageViewTop{
    objc_setAssociatedObject(self, @selector(imageViewTop), imageViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)imageViewTop{
    return (UIImageView *)[self getView:_cmd];
}

-(void)setImageViewRight:(UIImageView *)imageViewRight{
    objc_setAssociatedObject(self, @selector(imageViewRight), imageViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)imageViewRight{
    return (UIImageView *)[self getView:_cmd];
}

-(void)setImageViewBottom:(UIImageView *)imageViewBottom{
    objc_setAssociatedObject(self, @selector(imageViewBottom), imageViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)imageViewBottom{
    return (UIImageView *)[self getView:_cmd];
}

-(void)setImageViewCenter:(UIImageView *)imageViewCenter{
    objc_setAssociatedObject(self, @selector(imageViewCenter), imageViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIImageView *)imageViewCenter{
    return (UIImageView *)[self getView:_cmd];
}

-(void)setCollectionLayoutLeft:(UICollectionViewLayout *)collectionLayoutLeft{
    objc_setAssociatedObject(self, @selector(collectionLayoutLeft), collectionLayoutLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
-(UICollectionViewLayout *)collectionLayoutLeft{
    return [self getCollecLayout:_cmd];
}

-(void)setCollectionLayoutTop:(UICollectionViewLayout *)collectionLayoutTop{
    objc_setAssociatedObject(self, @selector(collectionLayoutTop), collectionLayoutTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)collectionLayoutTop{
    return [self getCollecLayout:_cmd];
}

-(void)setCollectionLayoutRight:(UICollectionViewLayout *)collectionLayoutRight{
    objc_setAssociatedObject(self, @selector(collectionLayoutRight), collectionLayoutRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)collectionLayoutRight{
    return [self getCollecLayout:_cmd];
}

-(void)setCollectionLayoutBottom:(UICollectionViewLayout *)collectionLayoutBottom{
    objc_setAssociatedObject(self, @selector(collectionLayoutBottom), collectionLayoutBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)collectionLayoutBottom{
    return [self getCollecLayout:_cmd];
}

-(void)setCollectionLayoutCenter:(UICollectionViewLayout *)collectionLayoutCenter{
    objc_setAssociatedObject(self, @selector(collectionLayoutCenter), collectionLayoutCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionViewLayout *)collectionLayoutCenter{
    return [self getCollecLayout:_cmd];
}

-(void)setCollectionLeft:(UICollectionView *)collectionLeft{
    objc_setAssociatedObject(self, @selector(collectionLeft), collectionLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)collectionLeft{
    return [self getCollectionView:_cmd];
}

-(void)setCollectionTop:(UICollectionView *)collectionTop{
    objc_setAssociatedObject(self, @selector(collectionTop), collectionTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)collectionTop{
    return [self getCollectionView:_cmd];
}

-(void)setCollectionRight:(UICollectionView *)collectionRight{
    objc_setAssociatedObject(self, @selector(collectionRight), collectionRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)collectionRight{
    return [self getCollectionView:_cmd];
}

-(void)setCollectionBottom:(UICollectionView *)collectionBottom{
    objc_setAssociatedObject(self, @selector(collectionBottom), collectionBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)collectionBottom{
    return [self getCollectionView:_cmd];
}

-(void)setCollectionCenter:(UICollectionView *)collectionCenter{
    objc_setAssociatedObject(self, @selector(collectionCenter), collectionCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UICollectionView *)collectionCenter{
    return [self getCollectionView:_cmd];
}

-(void)setTextViewLeft:(UITextView *)textViewLeft{
    objc_setAssociatedObject(self, @selector(textViewLeft), textViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)textViewLeft{
    return (UITextView *)[self getView:_cmd];
}

-(void)setTextViewTop:(UITextView *)textViewTop{
    objc_setAssociatedObject(self, @selector(textViewTop), textViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)textViewTop{
    return (UITextView *)[self getView:_cmd];
}

-(void)setTextViewRight:(UITextView *)textViewRight{
    objc_setAssociatedObject(self, @selector(textViewRight), textViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)textViewRight{
    return (UITextView *)[self getView:_cmd];
}

-(void)setTextViewBottom:(UITextView *)textViewBottom{
    objc_setAssociatedObject(self, @selector(textViewBottom), textViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)textViewBottom{
    return (UITextView *)[self getView:_cmd];
}

-(void)setTextViewCenter:(UITextView *)textViewCenter{
    objc_setAssociatedObject(self, @selector(textViewCenter), textViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITextView *)textViewCenter{
    return (UITextView *)[self getView:_cmd];
}

-(void)setScrollLeft:(UIScrollView *)scrollLeft{
    objc_setAssociatedObject(self, @selector(scrollLeft), scrollLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollLeft{
    return (UIScrollView *)[self getView:_cmd];
}

-(void)setScrollTop:(UIScrollView *)scrollTop{
    objc_setAssociatedObject(self, @selector(scrollTop), scrollTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollTop{
    return (UIScrollView *)[self getView:_cmd];
}

-(void)setScrollRight:(UIScrollView *)scrollRight{
    objc_setAssociatedObject(self, @selector(scrollRight), scrollRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollRight{
    return (UIScrollView *)[self getView:_cmd];
}

-(void)setScrollBottom:(UIScrollView *)scrollBottom{
    objc_setAssociatedObject(self, @selector(scrollBottom), scrollBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollBottom{
    return (UIScrollView *)[self getView:_cmd];
}

-(void)setScrollCenter:(UIScrollView *)scrollCenter{
    objc_setAssociatedObject(self, @selector(scrollCenter), scrollCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScrollView *)scrollCenter{
    return (UIScrollView *)[self getView:_cmd];
}
-(void)setDatePickerLeft:(UIDatePicker *)datePickerLeft{
    objc_setAssociatedObject(self, @selector(datePickerLeft), datePickerLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)datePickerLeft{
    return (UIDatePicker *)[self getView:_cmd];
}

-(void)setDatePickerTop:(UIDatePicker *)datePickerTop{
    objc_setAssociatedObject(self, @selector(datePickerTop), datePickerTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)datePickerTop{
    return (UIDatePicker *)[self getView:_cmd];
}

-(void)setDatePickerRight:(UIDatePicker *)datePickerRight{
    objc_setAssociatedObject(self, @selector(datePickerRight), datePickerRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)datePickerRight{
    return (UIDatePicker *)[self getView:_cmd];
}

-(void)setDatePickerBottom:(UIDatePicker *)datePickerBottom{
    objc_setAssociatedObject(self, @selector(datePickerBottom), datePickerBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)datePickerBottom{
    return (UIDatePicker *)[self getView:_cmd];
}

-(void)setDatePickerCenter:(UIDatePicker *)datePickerCenter{
    objc_setAssociatedObject(self, @selector(datePickerCenter), datePickerCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIDatePicker *)datePickerCenter{
    return (UIDatePicker *)[self getView:_cmd];
}

-(void)setPickerViewLeft:(UIPickerView *)pickerViewLeft{
    objc_setAssociatedObject(self, @selector(pickerViewLeft), pickerViewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)pickerViewLeft{
    return (UIPickerView *)[self getView:_cmd];
}

-(void)setPickerViewTop:(UIPickerView *)pickerViewTop{
    objc_setAssociatedObject(self, @selector(pickerViewTop), pickerViewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)pickerViewTop{
    return (UIPickerView *)[self getView:_cmd];
}

-(void)setPickerViewRight:(UIPickerView *)pickerViewRight{
    objc_setAssociatedObject(self, @selector(pickerViewRight), pickerViewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)pickerViewRight{
    return (UIPickerView *)[self getView:_cmd];
}

-(void)setPickerViewBottom:(UIPickerView *)pickerViewBottom{
    objc_setAssociatedObject(self, @selector(pickerViewBottom), pickerViewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)pickerViewBottom{
    return (UIPickerView *)[self getView:_cmd];
}

-(void)setPickerViewCenter:(UIPickerView *)pickerViewCenter{
    objc_setAssociatedObject(self, @selector(pickerViewCenter), pickerViewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPickerView *)pickerViewCenter{
    return (UIPickerView *)[self getView:_cmd];
}

-(void)setWkWebLeft:(WKWebView *)wkWebLeft{
    objc_setAssociatedObject(self, @selector(wkWebLeft), wkWebLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)wkWebLeft{
    return (WKWebView *)[self getView:_cmd];
}

-(void)setWkWebTop:(WKWebView *)wkWebTop{
    objc_setAssociatedObject(self, @selector(wkWebTop), wkWebTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)wkWebTop{
    return (WKWebView *)[self getView:_cmd];
}

-(void)setWkWebRight:(WKWebView *)wkWebRight{
    objc_setAssociatedObject(self, @selector(wkWebRight), wkWebRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)wkWebRight{
    return (WKWebView *)[self getView:_cmd];
}

-(void)setWkWebBottom:(WKWebView *)wkWebBottom{
    objc_setAssociatedObject(self, @selector(wkWebBottom), wkWebBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)wkWebBottom{
    return (WKWebView *)[self getView:_cmd];
}

-(void)setWkWebCenter:(WKWebView *)wkWebCenter{
    objc_setAssociatedObject(self, @selector(wkWebCenter), wkWebCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(WKWebView *)wkWebCenter{
    return (WKWebView *)[self getView:_cmd];
}

-(void)setViewLeft:(UIView *)viewLeft{
    objc_setAssociatedObject(self, @selector(viewLeft), viewLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)viewLeft{
    return (UIView *)[self getView:_cmd];
}

-(void)setViewTop:(UIView *)viewTop{
    objc_setAssociatedObject(self, @selector(viewTop), viewTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)viewTop{
    return (UIView *)[self getView:_cmd];
}

-(void)setViewRight:(UIView *)viewRight{
    objc_setAssociatedObject(self, @selector(viewRight), viewRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)viewRight{
    return (UIView *)[self getView:_cmd];
}

-(void)setViewBottom:(UIView *)viewBottom{
    objc_setAssociatedObject(self, @selector(viewBottom), viewBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)viewBottom{
    return (UIView *)[self getView:_cmd];
}

-(void)setViewCenter:(UIView *)viewCenter{
    objc_setAssociatedObject(self, @selector(viewCenter), viewCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIView *)viewCenter{
    return (UIView *)[self getView:_cmd];
}

-(void)setToolbarLeft:(UIToolbar *)toolbarLeft{
    objc_setAssociatedObject(self, @selector(toolbarLeft), toolbarLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)toolbarLeft{
    return (UIToolbar *)[self getView:_cmd];
}

-(void)setToolbarTop:(UIToolbar *)toolbarTop{
    objc_setAssociatedObject(self, @selector(toolbarTop), toolbarTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)toolbarTop{
    return (UIToolbar *)[self getView:_cmd];
}

-(void)setToolbarRight:(UIToolbar *)toolbarRight{
    objc_setAssociatedObject(self, @selector(toolbarRight), toolbarRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)toolbarRight{
    return (UIToolbar *)[self getView:_cmd];
}

-(void)setToolbarBottom:(UIToolbar *)toolbarBottom{
    objc_setAssociatedObject(self, @selector(toolbarBottom), toolbarBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)toolbarBottom{
    return (UIToolbar *)[self getView:_cmd];
}

-(void)setToolbarCenter:(UIToolbar *)toolbarCenter{
    objc_setAssociatedObject(self, @selector(toolbarCenter), toolbarCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIToolbar *)toolbarCenter{
    return (UIToolbar *)[self getView:_cmd];
}

-(void)setSearchBarLeft:(UISearchBar *)searchBarLeft{
    objc_setAssociatedObject(self, @selector(searchBarLeft), searchBarLeft, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)searchBarLeft{
    return (UISearchBar *)[self getView:_cmd];
}

-(void)setSearchBarTop:(UISearchBar *)searchBarTop{
    objc_setAssociatedObject(self, @selector(searchBarTop), searchBarTop, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)searchBarTop{
    return (UISearchBar *)[self getView:_cmd];
}

-(void)setSearchBarRight:(UISearchBar *)searchBarRight{
    objc_setAssociatedObject(self, @selector(searchBarRight), searchBarRight, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)searchBarRight{
    return (UISearchBar *)[self getView:_cmd];
}

-(void)setSearchBarBottom:(UISearchBar *)searchBarBottom{
    objc_setAssociatedObject(self, @selector(searchBarBottom), searchBarBottom, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)searchBarBottom{
    return (UISearchBar *)[self getView:_cmd];
}

-(void)setSearchBarCenter:(UISearchBar *)searchBarCenter{
    objc_setAssociatedObject(self, @selector(searchBarCenter), searchBarCenter, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISearchBar *)searchBarCenter{
    return (UISearchBar *)[self getView:_cmd];
}

-(void)setTapGestureRecognizer:(UITapGestureRecognizer *)tapGestureRecognizer{
    objc_setAssociatedObject(self, @selector(tapGestureRecognizer), tapGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UITapGestureRecognizer *)tapGestureRecognizer{
    return (UITapGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setPinchGestureRecognizer:(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    objc_setAssociatedObject(self, @selector(pinchGestureRecognizer), pinchGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPinchGestureRecognizer *)pinchGestureRecognizer{
    return (UIPinchGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setRotationGestureRecognizer:(UIRotationGestureRecognizer *)rotationGestureRecognizer{
    objc_setAssociatedObject(self, @selector(rotationGestureRecognizer), rotationGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIRotationGestureRecognizer *)rotationGestureRecognizer{
    return (UIRotationGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setSwipeGestureRecognizer:(UISwipeGestureRecognizer *)swipeGestureRecognizer{
    objc_setAssociatedObject(self, @selector(swipeGestureRecognizer), swipeGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UISwipeGestureRecognizer *)swipeGestureRecognizer{
    return (UISwipeGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setPanGestureRecognizer:(UIPanGestureRecognizer *)panGestureRecognizer{
    objc_setAssociatedObject(self, @selector(panGestureRecognizer), panGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIPanGestureRecognizer *)panGestureRecognizer{
    return (UIPanGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setScreenEdgePanGestureRecognizer:(UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer{
    objc_setAssociatedObject(self, @selector(screenEdgePanGestureRecognizer), screenEdgePanGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UIScreenEdgePanGestureRecognizer *)screenEdgePanGestureRecognizer{
    return (UIScreenEdgePanGestureRecognizer *)[self getGestureRecognizer:_cmd];
}

-(void)setLongPressGestureRecognizer:(UILongPressGestureRecognizer *)longPressGestureRecognizer{
    objc_setAssociatedObject(self, @selector(longPressGestureRecognizer), longPressGestureRecognizer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(UILongPressGestureRecognizer *)longPressGestureRecognizer{
    return (UILongPressGestureRecognizer *)[self getGestureRecognizer:_cmd];
}
@end
