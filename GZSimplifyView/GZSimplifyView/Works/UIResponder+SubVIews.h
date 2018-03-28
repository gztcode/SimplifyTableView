//
//  UIResponder+SubVIews.h
//  GZWork
//
//  Created by Tim on 2018/3/19.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

/**
 最简化加载各种View视图
 */
@interface UIResponder (SubVIews)

@property(nonatomic,strong) UILabel *gz_LabelLeft;
@property(nonatomic,strong) UILabel *gz_LabelTop;
@property(nonatomic,strong) UILabel *gz_LabelRight;
@property(nonatomic,strong) UILabel *gz_LabelBottom;
@property(nonatomic,strong) UILabel *gz_LabelCenter;

@property(nonatomic,strong) UIButton *gz_ButtonLeft;
@property(nonatomic,strong) UIButton *gz_ButtonTop;
@property(nonatomic,strong) UIButton *gz_ButtonRight;
@property(nonatomic,strong) UIButton *gz_ButtonBottom;
@property(nonatomic,strong) UIButton *gz_ButtonCenter;

@property(nonatomic,strong) UIControl *gz_ControlLeft;
@property(nonatomic,strong) UIControl *gz_ControlTop;
@property(nonatomic,strong) UIControl *gz_ControlRight;
@property(nonatomic,strong) UIControl *gz_ControlBottom;
@property(nonatomic,strong) UIControl *gz_ControlCenter;

@property(nonatomic,strong) UISegmentedControl *gz_SegmentedLeft;
@property(nonatomic,strong) UISegmentedControl *gz_SegmentedTop;
@property(nonatomic,strong) UISegmentedControl *gz_SegmentedRight;
@property(nonatomic,strong) UISegmentedControl *gz_SegmentedBottom;
@property(nonatomic,strong) UISegmentedControl *gz_SegmentedCenter;

@property(nonatomic,strong) UITextField *gz_TextFieldLeft;
@property(nonatomic,strong) UITextField *gz_TextFieldTop;
@property(nonatomic,strong) UITextField *gz_TextFieldRight;
@property(nonatomic,strong) UITextField *gz_TextFieldBottom;
@property(nonatomic,strong) UITextField *gz_TextFieldCenter;

@property(nonatomic,strong) UISlider *gz_SliderLeft;
@property(nonatomic,strong) UISlider *gz_SliderTop;
@property(nonatomic,strong) UISlider *gz_SliderRight;
@property(nonatomic,strong) UISlider *gz_SliderBottom;
@property(nonatomic,strong) UISlider *gz_SliderCenter;

@property(nonatomic,strong) UISwitch *gz_SwitchLeft;
@property(nonatomic,strong) UISwitch *gz_SwitchTop;
@property(nonatomic,strong) UISwitch *gz_SwitchRight;
@property(nonatomic,strong) UISwitch *gz_SwitchBottom;
@property(nonatomic,strong) UISwitch *gz_SwitchCenter;

@property(nonatomic,strong) UIActivityIndicatorView *gz_ActivityIndicatorLeft;
@property(nonatomic,strong) UIActivityIndicatorView *gz_ActivityIndicatorTop;
@property(nonatomic,strong) UIActivityIndicatorView *gz_ActivityIndicatorRight;
@property(nonatomic,strong) UIActivityIndicatorView *gz_ActivityIndicatorBottom;
@property(nonatomic,strong) UIActivityIndicatorView *gz_ActivityIndicatorCenter;

@property(nonatomic,strong) UIProgressView *gz_ProgressLeft;
@property(nonatomic,strong) UIProgressView *gz_ProgressTop;
@property(nonatomic,strong) UIProgressView *gz_ProgressRight;
@property(nonatomic,strong) UIProgressView *gz_ProgressBottom;
@property(nonatomic,strong) UIProgressView *gz_ProgressCenter;

@property(nonatomic,strong) UIPageControl *gz_PageControlLeft;
@property(nonatomic,strong) UIPageControl *gz_PageControlTop;
@property(nonatomic,strong) UIPageControl *gz_PageControlRight;
@property(nonatomic,strong) UIPageControl *gz_PageControlBottom;
@property(nonatomic,strong) UIPageControl *gz_PageControlCenter;

@property(nonatomic,strong) UIStepper *gz_StepperLeft;
@property(nonatomic,strong) UIStepper *gz_StepperTop;
@property(nonatomic,strong) UIStepper *gz_StepperRight;
@property(nonatomic,strong) UIStepper *gz_StepperBottom;
@property(nonatomic,strong) UIStepper *gz_StepperCenter;

@property(nonatomic,strong) UITableView *gz_TableViewLeft;
@property(nonatomic,strong) UITableView *gz_TableViewTop;
@property(nonatomic,strong) UITableView *gz_TableViewRight;
@property(nonatomic,strong) UITableView *gz_TableViewBottom;
@property(nonatomic,strong) UITableView *gz_TableViewCenter;

@property(nonatomic,strong) UIImageView *gz_ImageViewLeft;
@property(nonatomic,strong) UIImageView *gz_ImageViewTop;
@property(nonatomic,strong) UIImageView *gz_ImageViewRight;
@property(nonatomic,strong) UIImageView *gz_ImageViewBottom;
@property(nonatomic,strong) UIImageView *gz_ImageViewCenter;

@property(nonatomic,strong) UICollectionViewLayout *gz_CollectionLayoutLeft;
@property(nonatomic,strong) UICollectionViewLayout *gz_CollectionLayoutTop;
@property(nonatomic,strong) UICollectionViewLayout *gz_CollectionLayoutRight;
@property(nonatomic,strong) UICollectionViewLayout *gz_CollectionLayoutBottom;
@property(nonatomic,strong) UICollectionViewLayout *gz_CollectionLayoutCenter;

@property(nonatomic,strong) UICollectionView *gz_CollectionLeft;
@property(nonatomic,strong) UICollectionView *gz_CollectionTop;
@property(nonatomic,strong) UICollectionView *gz_CollectionRight;
@property(nonatomic,strong) UICollectionView *gz_CollectionBottom;
@property(nonatomic,strong) UICollectionView *gz_CollectionCenter;

@property(nonatomic,strong) UITextView *gz_TextViewLeft;
@property(nonatomic,strong) UITextView *gz_TextViewTop;
@property(nonatomic,strong) UITextView *gz_TextViewRight;
@property(nonatomic,strong) UITextView *gz_TextViewBottom;
@property(nonatomic,strong) UITextView *gz_TextViewCenter;

@property(nonatomic,strong) UIScrollView *gz_ScrollLeft;
@property(nonatomic,strong) UIScrollView *gz_ScrollTop;
@property(nonatomic,strong) UIScrollView *gz_ScrollRight;
@property(nonatomic,strong) UIScrollView *gz_ScrollBottom;
@property(nonatomic,strong) UIScrollView *gz_ScrollCenter;

@property(nonatomic,strong) UIDatePicker *gz_DatePickerLeft;
@property(nonatomic,strong) UIDatePicker *gz_DatePickerTop;
@property(nonatomic,strong) UIDatePicker *gz_DatePickerRight;
@property(nonatomic,strong) UIDatePicker *gz_DatePickerBottom;
@property(nonatomic,strong) UIDatePicker *gz_DatePickerCenter;

@property(nonatomic,strong) UIPickerView *gz_PickerViewLeft;
@property(nonatomic,strong) UIPickerView *gz_PickerViewTop;
@property(nonatomic,strong) UIPickerView *gz_PickerViewRight;
@property(nonatomic,strong) UIPickerView *gz_PickerViewBottom;
@property(nonatomic,strong) UIPickerView *gz_PickerViewCenter;

@property(nonatomic,strong) WKWebView *gz_WkWebLeft;
@property(nonatomic,strong) WKWebView *gz_WkWebTop;
@property(nonatomic,strong) WKWebView *gz_WkWebRight;
@property(nonatomic,strong) WKWebView *gz_WkWebBottom;
@property(nonatomic,strong) WKWebView *gz_WkWebCenter;

@property(nonatomic,strong) UIView *gz_ViewLeft;
@property(nonatomic,strong) UIView *gz_ViewTop;
@property(nonatomic,strong) UIView *gz_ViewRight;
@property(nonatomic,strong) UIView *gz_ViewBottom;
@property(nonatomic,strong) UIView *gz_ViewCenter;

@property(nonatomic,strong) UIToolbar *gz_ToolbarLeft;
@property(nonatomic,strong) UIToolbar *gz_ToolbarTop;
@property(nonatomic,strong) UIToolbar *gz_ToolbarRight;
@property(nonatomic,strong) UIToolbar *gz_ToolbarBottom;
@property(nonatomic,strong) UIToolbar *gz_ToolbarCenter;

@property(nonatomic,strong) UISearchBar *gz_SearchBarLeft;
@property(nonatomic,strong) UISearchBar *gz_SearchBarTop;
@property(nonatomic,strong) UISearchBar *gz_SearchBarRight;
@property(nonatomic,strong) UISearchBar *gz_SearchBarBottom;
@property(nonatomic,strong) UISearchBar *gz_SearchBarCenter;

@property(nonatomic,strong) UITapGestureRecognizer              *gz_TapGestureRecognizer;
@property(nonatomic,strong) UIPinchGestureRecognizer            *gz_PinchGestureRecognizer;
@property(nonatomic,strong) UIRotationGestureRecognizer         *gz_RotationGestureRecognizer;
@property(nonatomic,strong) UISwipeGestureRecognizer            *gz_SwipeGestureRecognizer;
@property(nonatomic,strong) UIPanGestureRecognizer              *gz_PanGestureRecognizer;
@property(nonatomic,strong) UIScreenEdgePanGestureRecognizer    *gz_ScreenEdgePanGestureRecognizer;
@property(nonatomic,strong) UILongPressGestureRecognizer        *gz_LongPressGestureRecognizer;


@end
