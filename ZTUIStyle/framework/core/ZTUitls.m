//
//  ZTUitls.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/20.
//

#import "ZTUitls.h"

@implementation ZTUitls

+ (UIColor*)makeColorFromImageWithLayer:(CAGradientLayer*) layer{
    
    CGSize size = CGSizeMake(layer.frame.size.width + 0.f , layer.frame.size.height + 0.f);
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);

    [layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return [UIColor colorWithPatternImage:image];
}

@end
