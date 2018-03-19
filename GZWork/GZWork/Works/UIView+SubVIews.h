//
//  UIView+SubVIews.h
//  GZWork
//
//  Created by Tim on 2018/3/19.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface UIView (SubVIews)

@property(nonatomic,strong) UILabel *labelLeft;
@property(nonatomic,strong) UILabel *labelTop;
@property(nonatomic,strong) UILabel *labelRight;
@property(nonatomic,strong) UILabel *labelBottom;
@property(nonatomic,strong) UILabel *labelCenter;

@property(nonatomic,strong) UIButton *buttonLeft;
@property(nonatomic,strong) UIButton *buttonTop;
@property(nonatomic,strong) UIButton *buttonRight;
@property(nonatomic,strong) UIButton *buttonBottom;
@property(nonatomic,strong) UIButton *buttonCenter;

@property(nonatomic,strong) UIControl *controlLeft;
@property(nonatomic,strong) UIControl *controlTop;
@property(nonatomic,strong) UIControl *controlRight;
@property(nonatomic,strong) UIControl *controlBottom;
@property(nonatomic,strong) UIControl *controlCenter;

@property(nonatomic,strong) UISegmentedControl *segmentedLeft;
@property(nonatomic,strong) UISegmentedControl *segmentedTop;
@property(nonatomic,strong) UISegmentedControl *segmentedRight;
@property(nonatomic,strong) UISegmentedControl *segmentedBottom;
@property(nonatomic,strong) UISegmentedControl *segmentedCenter;

@property(nonatomic,strong) UITextField *textFieldLeft;
@property(nonatomic,strong) UITextField *textFieldTop;
@property(nonatomic,strong) UITextField *textFieldRight;
@property(nonatomic,strong) UITextField *textFieldBottom;
@property(nonatomic,strong) UITextField *textFieldCenter;

@property(nonatomic,strong) UISlider *sliderLeft;
@property(nonatomic,strong) UISlider *sliderTop;
@property(nonatomic,strong) UISlider *sliderRight;
@property(nonatomic,strong) UISlider *sliderBottom;
@property(nonatomic,strong) UISlider *sliderCenter;

@property(nonatomic,strong) UISwitch *switchLeft;
@property(nonatomic,strong) UISlider *switchTop;
@property(nonatomic,strong) UISlider *switchRight;
@property(nonatomic,strong) UISlider *switchBottom;
@property(nonatomic,strong) UISlider *switchCenter;

@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorLeft;
@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorTop;
@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorRight;
@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorBottom;
@property(nonatomic,strong) UIActivityIndicatorView *activityIndicatorCenter;

@property(nonatomic,strong) UIProgressView *progressLeft;
@property(nonatomic,strong) UIProgressView *progressTop;
@property(nonatomic,strong) UIProgressView *progressRight;
@property(nonatomic,strong) UIProgressView *progressBottom;
@property(nonatomic,strong) UIProgressView *progressCenter;

@property(nonatomic,strong) UIPageControl *pageControlLeft;
@property(nonatomic,strong) UIPageControl *pageControlTop;
@property(nonatomic,strong) UIPageControl *pageControlRight;
@property(nonatomic,strong) UIPageControl *pageControlBottom;
@property(nonatomic,strong) UIPageControl *pageControlCenter;

@property(nonatomic,strong) UIStepper *stepperLeft;
@property(nonatomic,strong) UIStepper *stepperTop;
@property(nonatomic,strong) UIStepper *stepperRight;
@property(nonatomic,strong) UIStepper *stepperBottom;
@property(nonatomic,strong) UIStepper *stepperCenter;

@property(nonatomic,strong) UITableView *tableLeft;
@property(nonatomic,strong) UITableView *tableTop;
@property(nonatomic,strong) UITableView *tableRight;
@property(nonatomic,strong) UITableView *tableBottom;
@property(nonatomic,strong) UITableView *tableCenter;

@property(nonatomic,strong) UIImageView *imageViewLeft;
@property(nonatomic,strong) UIImageView *imageViewTop;
@property(nonatomic,strong) UIImageView *imageViewRight;
@property(nonatomic,strong) UIImageView *imageViewBottom;
@property(nonatomic,strong) UIImageView *imageViewCenter;

@property(nonatomic,strong) UICollectionViewLayout *collectionLayoutLeft;
@property(nonatomic,strong) UICollectionViewLayout *collectionLayoutTop;
@property(nonatomic,strong) UICollectionViewLayout *collectionLayoutRight;
@property(nonatomic,strong) UICollectionViewLayout *collectionLayoutBottom;
@property(nonatomic,strong) UICollectionViewLayout *collectionLayoutCenter;

@property(nonatomic,strong) UICollectionView *collectionLeft;
@property(nonatomic,strong) UICollectionView *collectionTop;
@property(nonatomic,strong) UICollectionView *collectionRight;
@property(nonatomic,strong) UICollectionView *collectionBottom;
@property(nonatomic,strong) UICollectionView *collectionCenter;

@property(nonatomic,strong) UITextView *textViewLeft;
@property(nonatomic,strong) UITextView *textViewTop;
@property(nonatomic,strong) UITextView *textViewRight;
@property(nonatomic,strong) UITextView *textViewBottom;
@property(nonatomic,strong) UITextView *textViewCenter;

@property(nonatomic,strong) UIScrollView *scrollLeft;
@property(nonatomic,strong) UIScrollView *scrollTop;
@property(nonatomic,strong) UIScrollView *scrollRight;
@property(nonatomic,strong) UIScrollView *scrollBottom;
@property(nonatomic,strong) UIScrollView *scrollCenter;

@property(nonatomic,strong) UIDatePicker *datePickerLeft;
@property(nonatomic,strong) UIDatePicker *datePickerTop;
@property(nonatomic,strong) UIDatePicker *datePickerRight;
@property(nonatomic,strong) UIDatePicker *datePickerBottom;
@property(nonatomic,strong) UIDatePicker *datePickerCenter;

@property(nonatomic,strong) UIPickerView *pickerViewLeft;
@property(nonatomic,strong) UIPickerView *pickerViewTop;
@property(nonatomic,strong) UIPickerView *pickerViewRight;
@property(nonatomic,strong) UIPickerView *pickerViewBottom;
@property(nonatomic,strong) UIPickerView *pickerViewCenter;

@property(nonatomic,strong) WKWebView *wkWebLeft;
@property(nonatomic,strong) WKWebView *wkWebTop;
@property(nonatomic,strong) WKWebView *wkWebRight;
@property(nonatomic,strong) WKWebView *wkWebBottom;
@property(nonatomic,strong) WKWebView *wkWebCenter;

@property(nonatomic,strong) UIView *viewLeft;
@property(nonatomic,strong) UIView *viewTop;
@property(nonatomic,strong) UIView *viewRight;
@property(nonatomic,strong) UIView *viewBottom;
@property(nonatomic,strong) UIView *viewCenter;

@property(nonatomic,strong) UIToolbar *toolbarLeft;
@property(nonatomic,strong) UIToolbar *toolbarTop;
@property(nonatomic,strong) UIToolbar *toolbarRight;
@property(nonatomic,strong) UIToolbar *toolbarBottom;
@property(nonatomic,strong) UIToolbar *toolbarCenter;

@property(nonatomic,strong) UISearchBar *searchBarLeft;
@property(nonatomic,strong) UISearchBar *searchBarTop;
@property(nonatomic,strong) UISearchBar *searchBarRight;
@property(nonatomic,strong) UISearchBar *searchBarBottom;
@property(nonatomic,strong) UISearchBar *searchBarCenter;

@property(nonatomic,strong) UITapGestureRecognizer              *tapGestureRecognizer;
@property(nonatomic,strong) UIPinchGestureRecognizer            *pinchGestureRecognizer;
@property(nonatomic,strong) UIRotationGestureRecognizer         *rotationGestureRecognizer;
@property(nonatomic,strong) UISwipeGestureRecognizer            *swipeGestureRecognizer;
@property(nonatomic,strong) UIPanGestureRecognizer              *panGestureRecognizer;
@property(nonatomic,strong) UIScreenEdgePanGestureRecognizer    *screenEdgePanGestureRecognizer;
@property(nonatomic,strong) UILongPressGestureRecognizer        *longPressGestureRecognizer;


@end
