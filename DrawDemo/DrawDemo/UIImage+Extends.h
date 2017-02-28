//
//  UIImage+Extends.h
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extends)

+ (UIImage *)getImageFromView:(UIView *)view WithImageRect:(CGRect)rect;
+ (UIImage *)convtImageFromView:(UIView *)view;

@end
