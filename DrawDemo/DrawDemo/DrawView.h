//
//  DrawView.h
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DrawView : UIView

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor *lineColor;

- (void)back;
- (void)clear;

@end
