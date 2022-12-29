//
//  DemoShadowController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import "DemoShadowController.h"
#import "UIView+ZTUIStyle.h" //导入样式分类

@interface DemoShadowController ()

@property(nonatomic,strong) UILabel *viewShadow_1;
@property(nonatomic,strong) UILabel *viewShadow_2;
@property(nonatomic,strong) UILabel *viewShadow_3;

@end

@implementation DemoShadowController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initShadow];
}


- (void)initShadow{
    
    self.navigationItem.title = @"阴影样式";
    _viewShadow_1 = [self makeLabel:[UIColor blueColor] text:@"阴影常规"];
    _viewShadow_2 = [self makeLabel:[UIColor blueColor] text:@"阴影透明度"];
    _viewShadow_3 = [self makeLabel:[UIColor blueColor] text:@"阴影偏移(右下)"];
    
    [_viewShadow_1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(self.view.mas_top).offset(30);
    }];
    [_viewShadow_2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(150);
        make.left.mas_equalTo(_viewShadow_1.mas_right).offset(30);
        make.top.mas_equalTo(self.view.mas_top).offset(30);
    }];
    [_viewShadow_3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(330);
        make.left.mas_equalTo(self.view.mas_left).offset(20);
        make.top.mas_equalTo(_viewShadow_1.mas_bottom).offset(30);
    }];
    
    //设置圆角（非必需）
    [_viewShadow_1 zt_cornerWithCornerRadii:20];
    [_viewShadow_2 zt_cornerWithCornerRadii:20];
    [_viewShadow_3 zt_cornerWithCornerRadii:20];
    
        
    //主题代码：设置边框样式
    UIColor *shadowColor = [UIColor orangeColor];
    CGFloat shadowRadius = 10.0f;
    
    [_viewShadow_1 zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius];
    [_viewShadow_2 zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius withShadowOpacity:0.5f];
    [_viewShadow_3 zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius withShadowOffset:CGSizeMake(5, 5)];
    
}

@end
