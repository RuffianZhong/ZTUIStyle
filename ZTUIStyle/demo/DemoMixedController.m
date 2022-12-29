//
//  DemoMixedController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/27.
//

#import "DemoMixedController.h"
#import "UIView+ZTUIStyle.h" //导入样式分类


@interface DemoMixedController ()
@property(nonatomic,strong) UILabel *viewMixed;
@end

@implementation DemoMixedController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initMixed];
}

- (void)initMixed{

    self.navigationItem.title = @"混合样式";
    _viewMixed = [self makeLabel:nil text:@"圆角/边框/渐变/阴影"];
    
    [_viewMixed mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(300);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(30);
    }];
    
    
    
    NSArray<UIColor *> * colors = @[[UIColor purpleColor],[UIColor yellowColor]];
    NSArray<UIColor *> * colors2 = @[[UIColor orangeColor],[UIColor yellowColor]];

    //设置圆角
    [_viewMixed zt_cornerWithCornerRadii:20];
    
    //设置边框
    NSArray<NSNumber *> *dashPattern = @[@20,@4];
    [_viewMixed zt_borderWithBorderWidth:4.0f withBorderGradientColors:colors2 withBorderGradientDirection:GradientDirectionRight2Left withLineDashPhase:4.0f  withLineDashPattern:dashPattern];
    
    //设置渐变
    [_viewMixed zt_gradientWithGradientColors:colors withDirection:GradientDirectionLeft2Right];
  
    //设置阴影
    [_viewMixed zt_shadowWithShadowColor:[UIColor orangeColor] withShadowRadius:10.0f withShadowOffset:CGSizeMake(5, 5)];

}

@end
