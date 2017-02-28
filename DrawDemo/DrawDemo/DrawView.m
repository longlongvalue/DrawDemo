//
//  DrawView.m
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import "DrawView.h"
#import "lineModel.h"

@interface DrawView ()

@property (nonatomic, strong) NSMutableArray *linesArrayM;


@end

@implementation DrawView

- (NSMutableArray *)linesArrayM
{
    if (!_linesArrayM) {
        _linesArrayM = [NSMutableArray arrayWithCapacity:0];
    }
    return _linesArrayM;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapRound);
    
    CGContextSetStrokeColorWithColor(context, [UIColor blackColor].CGColor);
    
    
    
    for (lineModel *line in self.linesArrayM)
    {
        
        float lineWidth = 20 * line.lineWidth;
        
        CGContextSetLineWidth(context, lineWidth);
        
        for (int i = 0; i < line.linePointArrayM.count; i++) {
            
            CGPoint nextPoint = [[line.linePointArrayM objectAtIndex:i] CGPointValue];
            
            if (i==0) {
                CGContextMoveToPoint(context, nextPoint.x, nextPoint.y);
            }else{
                CGContextAddLineToPoint(context, nextPoint.x, nextPoint.y);
            }
            
        }
        
        CGContextStrokePath(context);
        
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint startPoint = [touch locationInView:self];
    lineModel *line = [[lineModel alloc] init];
    
    NSMutableArray *linePointArrayM = [NSMutableArray arrayWithCapacity:0];
    [linePointArrayM addObject:[NSValue valueWithCGPoint:startPoint]];
    
    line.linePointArrayM = linePointArrayM;
    line.lineWidth = self.lineWidth;
    line.lineColor = self.lineColor;
    
    [_linesArrayM addObject:line];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint nextPoint = [touch locationInView:self];
    lineModel *line = [self.linesArrayM lastObject];
    [line.linePointArrayM addObject:[NSValue valueWithCGPoint:nextPoint]];
    [self.linesArrayM replaceObjectAtIndex:[self.linesArrayM count] - 1 withObject:line];
    
    [self setNeedsDisplay];
}


- (void)back
{
    
    [self.linesArrayM removeLastObject];
    
    [self setNeedsDisplay];
}

- (void)clear
{
    [self.linesArrayM removeAllObjects];
    
    [self setNeedsDisplay];
}


@end
