//
//  DemoGradientController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import "DemoGradientController.h"
#import "UIView+ZTUIStyle.h" //导入样式分类

@interface DemoGradientController ()
@property(nonatomic,strong) UILabel *viewGradient_1;
@property(nonatomic,strong) UILabel *viewGradient_2;
@property(nonatomic,strong) UILabel *viewGradient_3;
@property(nonatomic,strong) UILabel *viewGradient_4;

@end

@implementation DemoGradientController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGradient];
}

- (void)initGradient{

    self.navigationItem.title = @"渐变样式";
    _viewGradient_1 = [self makeLabel:nil text:@"左->右 渐变"];
    _viewGradient_2 = [self makeLabel:nil text:@"上->下 渐变"];
    _viewGradient_3 = [self makeLabel:nil text:@"左下->右上 渐变"];
    _viewGradient_4 = [self makeLabel:nil text:@"右下->左上 渐变"];
    
    [_viewGradient_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(self.scrollView.mas_left).offset(20);
        make.top.mas_equalTo(self.scrollView.mas_top).offset(10);
    }];
    [_viewGradient_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(_viewGradient_1.mas_right).offset(10);
        make.top.mas_equalTo(self.scrollView.mas_top).offset(10);
    }];
    [_viewGradient_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(self.scrollView.mas_left).offset(20);
        make.top.mas_equalTo(_viewGradient_1.mas_bottom).offset(10);
    }];
    [_viewGradient_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(_viewGradient_3.mas_right).offset(10);
        make.top.mas_equalTo(_viewGradient_1.mas_bottom).offset(10);
    }];
    
    //设置圆角（非必需）
    [_viewGradient_1 zt_cornerWithCornerRadii:20];
    [_viewGradient_2 zt_cornerWithCornerRadii:20];
    [_viewGradient_3 zt_cornerWithCornerRadii:20];
    [_viewGradient_4 zt_cornerWithCornerRadii:20];
    
    //主题代码：设置渐变样式
    NSArray<UIColor *> * colors = @[[UIColor purpleColor],[UIColor yellowColor]];
    [_viewGradient_1 zt_gradientWithGradientColors:colors withDirection:GradientDirectionLeft2Right];
    [_viewGradient_2 zt_gradientWithGradientColors:colors withDirection:GradientDirectionTop2Bottom];
    [_viewGradient_3 zt_gradientWithGradientColors:colors withDirection:GradientDirectionLeftBottom2RightTop];
    [_viewGradient_4 zt_gradientWithGradientColors:colors withDirection:GradientDirectionRightBottom2LeftTop];

}
@end
