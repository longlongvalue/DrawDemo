//
//  ViewController.m
//  DrawDemo
//
//  Created by 淘卡淘 on 2017/2/22.
//  Copyright © 2017年 taokatao. All rights reserved.
//

#import "ViewController.h"
#import "DrawView.h"
#import "UIImage+Extends.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet DrawView *drawView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.drawView.lineWidth = 0.3;
}


- (IBAction)sliderValueChange:(UISlider *)sender
{
    self.drawView.lineWidth = sender.value;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clear {
    [self.drawView clear];
}


- (IBAction)back {
    [self.drawView back];
}
- (IBAction)saveToAlum:(UIButton *)sender {
    
    UIImage *image = [UIImage convtImageFromView:self.drawView];
    
//    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void *)self);
    
    UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), (__bridge void * _Nullable)(self));
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    
    NSLog(@"image = %@, error = %@, contextInfo = %@", image, error, contextInfo);
}

@end
