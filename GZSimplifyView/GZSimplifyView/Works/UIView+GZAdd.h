//
//  UIView+Add.h
//  GZSimplifyView
//
//  Created by Tim on 2018/4/28.
//  Copyright © 2018年 tim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (GZAdd)
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGFloat centerX;     ///< Shortcut for center.x
@property (nonatomic) CGFloat centerY;     ///< Shortcut for center.y
@property (nonatomic) CGPoint origin;      ///< Shortcut for frame.origin.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
///找到当前的控制器
- (UIViewController *)viewController;
///移除所有的子视图
- (void)removeAllSubviews;
///获取到当前View底部的位置
- (CGFloat)getViewBottom;

@end
