//
//  UIImage+Extends.m
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import "UIImage+Extends.h"

@implementation UIImage (Extends)

+ (UIImage *)getImageFromView:(UIView *)view WithImageRect:(CGRect)rect
{
    CGFloat ScreenScale = [[UIScreen mainScreen] scale];
    
    rect = CGRectMake(rect.origin.x * ScreenScale, rect.origin.y * ScreenScale, rect.size.width * ScreenScale, rect.size.height * ScreenScale);
    
    UIImage *preImage = [UIImage convtImageFromView:view];
    
    CGImageRef subImageRef = CGImageCreateWithImageInRect(preImage.CGImage, rect);
    
    CGRect smallRect = CGRectMake(0, 0, CGImageGetWidth(subImageRef), CGImageGetHeight(subImageRef));
    
    UIGraphicsBeginImageContext(preImage.size);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextDrawImage(context, smallRect, subImageRef);
    
    UIImage *smallImage = [UIImage imageWithCGImage:subImageRef];
    
    UIGraphicsEndImageContext();
    
    return smallImage;
}

+ (UIImage *)convtImageFromView:(UIView *)view
{
    CGSize size = view.bounds.size;
    UIGraphicsBeginImageContextWithOptions(size, YES, [[UIScreen mainScreen] scale]);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    return  UIGraphicsGetImageFromCurrentImageContext();
}

@end
