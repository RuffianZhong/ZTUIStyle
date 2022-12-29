//
//  DemoBorderController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import "DemoBorderController.h"
#import "UIView+ZTUIStyle.h" //导入样式分类

@interface DemoBorderController ()
@property(nonatomic,strong) UILabel *viewBorder_1;
@property(nonatomic,strong) UILabel *viewBorder_2;
@property(nonatomic,strong) UILabel *viewBorder_3;
@property(nonatomic,strong) UILabel *viewBorder_4;
@end

@implementation DemoBorderController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initBorder];
}

- (void)initBorder{
    
    self.navigationItem.title = @"边框样式";
    _viewBorder_1 = [self makeLabel:[UIColor blueColor] text:@"圆角实线边框"];
    _viewBorder_2 = [self makeLabel:[UIColor blueColor] text:@"圆角虚线边框"];
    _viewBorder_3 = [self makeLabel:[UIColor blueColor] text:@"圆角实线渐变"];
    _viewBorder_4 = [self makeLabel:[UIColor blueColor] text:@"圆角虚线渐变"];
    
    [_viewBorder_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
    }];
    [_viewBorder_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(_viewBorder_1.mas_right).offset(10);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
    }];
    [_viewBorder_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(_viewBorder_1.mas_bottom).offset(10);
    }];
    [_viewBorder_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(_viewBorder_3.mas_right).offset(10);
        make.top.mas_equalTo(_viewBorder_1.mas_bottom).offset(10);
    }];
    
    //设置圆角（非必需）
    [_viewBorder_1 zt_cornerWithCornerRadii:20];
    [_viewBorder_2 zt_cornerWithCornerRadii:20];
    [_viewBorder_3 zt_cornerWithCornerRadii:20];
    [_viewBorder_4 zt_cornerWithCornerRadii:20];

    
    //主题代码：设置边框
    CGFloat borderWidth = 4.0f;
    NSArray<NSNumber *> *dashPattern = @[@20,@4];
    UIColor *borderColor = [UIColor greenColor];
    NSArray<UIColor *> * colors = @[[UIColor greenColor],[UIColor redColor]];
    
    [_viewBorder_1 zt_borderWithBorderWidth:borderWidth withBorderColor:borderColor];

    [_viewBorder_2 zt_borderWithBorderWidth:borderWidth withBorderColor:borderColor withLineDashPhase:4.0f withLineDashPattern:dashPattern];

    [_viewBorder_3 zt_borderWithBorderWidth:borderWidth withBorderGradientColors:colors withBorderGradientDirection:GradientDirectionLeft2Right];

    [_viewBorder_4 zt_borderWithBorderWidth:borderWidth withBorderGradientColors:colors withBorderGradientDirection:GradientDirectionLeft2Right withLineDashPhase:4.0f  withLineDashPattern:dashPattern];
}


@end
