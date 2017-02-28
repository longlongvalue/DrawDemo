//
//  lineModel.h
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface lineModel : NSObject

@property (nonatomic, strong) NSMutableArray    *linePointArrayM;

@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, strong) UIColor *lineColor;

@end
