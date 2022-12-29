//
//  DemoCornerController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import "DemoCornerController.h"
#import "UIView+ZTUIStyle.h" //导入样式分类

@interface DemoCornerController ()
@property(nonatomic,strong) UILabel *viewCorner_1;
@property(nonatomic,strong) UILabel *viewCorner_2;
@property(nonatomic,strong) UILabel *viewCorner_3;
@property(nonatomic,strong) UILabel *viewCorner_4;
@property(nonatomic,strong) UILabel *viewCorner_5;
@property(nonatomic,strong) UILabel *viewCorner_6;
@property(nonatomic,strong) UILabel *viewCorner_7;
@property(nonatomic,strong) UILabel *viewCorner_8;
@end

@implementation DemoCornerController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initCorner];
}

- (void)initCorner{
    self.navigationItem.title = @"圆角样式";
    _viewCorner_1 = [self makeLabel:[UIColor blueColor] text:@"左上圆角"];
    _viewCorner_2 = [self makeLabel:[UIColor blueColor] text:@"右上圆角"];
    _viewCorner_3 = [self makeLabel:[UIColor blueColor] text:@"左下圆角"];
    _viewCorner_4 = [self makeLabel:[UIColor blueColor] text:@"右下圆角"];
    _viewCorner_5 = [self makeLabel:[UIColor blueColor] text:@"上面圆角"];
    _viewCorner_6 = [self makeLabel:[UIColor blueColor] text:@"下面圆角"];
    _viewCorner_7 = [self makeLabel:[UIColor blueColor] text:@"圆角 >= 1/2 宽/高"];
    _viewCorner_8 = [self makeLabel:[UIColor blueColor] text:@"四周圆角"];


    [_viewCorner_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
    }];
    [_viewCorner_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(_viewCorner_1.mas_right).offset(10);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
    }];
    [_viewCorner_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(_viewCorner_1.mas_bottom).offset(10);
    }];
    [_viewCorner_4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(_viewCorner_3.mas_right).offset(10);
        make.top.mas_equalTo(_viewCorner_1.mas_bottom).offset(10);
    }];
    [_viewCorner_5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(_viewCorner_2.mas_right).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(10);
    }];
    [_viewCorner_6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(100);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(_viewCorner_4.mas_right).offset(20);
        make.top.mas_equalTo(_viewCorner_5.mas_bottom).offset(10);
    }];
    [_viewCorner_7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
        make.width.mas_equalTo(200);
        make.left.mas_equalTo(_viewCorner_8.mas_right).offset(20);
        make.top.mas_equalTo(_viewCorner_3.mas_bottom).offset(10);
    }];
    [_viewCorner_8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(200);
        make.width.mas_equalTo(100);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(_viewCorner_3.mas_bottom).offset(10);
    }];
    

    
    //主题代码：设置圆角
    [_viewCorner_1 zt_cornerWithUIRectCorner:UIRectCornerTopLeft withCornerRadii:20];

    [_viewCorner_2 zt_cornerWithUIRectCorner:UIRectCornerTopRight withCornerRadii:20];

    [_viewCorner_3 zt_cornerWithUIRectCorner:UIRectCornerBottomLeft withCornerRadii:20];

    [_viewCorner_4 zt_cornerWithUIRectCorner:UIRectCornerBottomRight withCornerRadii:20];

    [_viewCorner_5 zt_cornerWithUIRectCorner:UIRectCornerTopLeft|UIRectCornerTopRight withCornerRadii:20];

    [_viewCorner_6 zt_cornerWithUIRectCorner:UIRectCornerBottomLeft|UIRectCornerBottomRight withCornerRadii:20];

    [_viewCorner_7 zt_cornerWithUIRectCorner:UIRectCornerAllCorners withCornerRadii:100];

    [_viewCorner_8 zt_cornerWithUIRectCorner:UIRectCornerAllCorners withCornerRadii:20];
  
}

@end
