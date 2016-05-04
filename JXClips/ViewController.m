//
//  ViewController.m
//  JXClips
//
//  Created by yuezuo on 16/5/4.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 获取图片
    UIImage * image = [UIImage imageNamed:@"APPLE7"];
    
    // 开启位图上下文
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 设置切割区域，正切图片
    // 创建图形路径
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, image.size.width, image.size.height)];
    // 把路径设置为裁剪区域
    [path addClip];
    
    // 绘制图片
    [image drawAtPoint:CGPointZero];
    
    // 从上下文中获取裁剪后的图片
    UIImage * iamgeNow = UIGraphicsGetImageFromCurrentImageContext();
    
    // 获取裁剪后的图片之后关闭上下文
    UIGraphicsEndImageContext();

    
    self.imageView.image = iamgeNow;
}

@end
