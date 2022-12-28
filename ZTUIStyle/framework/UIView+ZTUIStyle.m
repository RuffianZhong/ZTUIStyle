//
//  UIView+ZTUIStyle.m
//  ZTUIStyle
//
//  Created by 钟达烽 on 2022/12/27.
//

#import "UIView+ZTUIStyle.h"
#import "ZTUIKit.h"


@implementation UIView (ZTUIStyle)


#pragma mark - 设置KVO监听 UIView 属性变化

//监控 UIView 的属性
NSString *ZTUIstyle_key_frame = @"frame";
NSString *ZTUIstyle_key_bounds = @"bounds";
NSString *ZTUIstyle_key_center = @"center";

/// KVO 监听 UIView 属性变化
- (void)addZTUIstyleObserver{
    [self addObserver:self forKeyPath:ZTUIstyle_key_frame options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:ZTUIstyle_key_bounds options:NSKeyValueObservingOptionNew context:NULL];
    [self addObserver:self forKeyPath:ZTUIstyle_key_center options:NSKeyValueObservingOptionNew context:NULL];
}

/// KVO 移除监听 UIView 属性变化
- (void)removeZTUIstyleObserver{
    [self removeObserver:self forKeyPath:ZTUIstyle_key_frame];
    [self removeObserver:self forKeyPath:ZTUIstyle_key_bounds];
    [self removeObserver:self forKeyPath:ZTUIstyle_key_center];
}

/// KVO响应属性变化
/// @param keyPath 属性名称
/// @param object 属性变化的对象
/// @param change 变化规则
/// @param context 额外参数
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //是否为目标监听属性
    BOOL isTagget = [keyPath isEqualToString:ZTUIstyle_key_frame]||[keyPath isEqualToString:ZTUIstyle_key_bounds]||[keyPath isEqualToString:ZTUIstyle_key_center];
    if(isTagget){
        //更新受到 rect 影响的 UI样式
        [[self ZTUIKit] buildWithView:self];
    }
}

#pragma mark - 圆角

/// 创建圆角
/// @param uiRectCorner UIRectCorner 指定圆角方向（左上，右上，，，全部），可以组合使用
/// @param cornerRadii 圆角大小
- (void)zt_cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadiiSize:(CGSize)cornerRadii{
    
    [[[self ZTUIKit] cornerWithUIRectCorner:uiRectCorner withCornerRadii:cornerRadii] buildWithView:self];
}

- (void)zt_cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadii:(float)cornerRadii{
    
    CGSize size = CGSizeMake(cornerRadii, cornerRadii);
    [self zt_cornerWithUIRectCorner:uiRectCorner withCornerRadiiSize:size];
}

- (void)zt_cornerWithCornerRadii:(float)cornerRadii{
    
    CGSize size = CGSizeMake(cornerRadii, cornerRadii);
    [self zt_cornerWithUIRectCorner:UIRectCornerAllCorners withCornerRadiiSize:size];
}

#pragma mark - 边框
/// 创建边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
/// @param lineDashPhase 虚线起始位置
/// @param lineDashPattern 虚线模型NSNumber数组：奇数位数值表示实线长度，偶数位数值表示空白长度
/// @param gradientColors 边框渐变颜色
/// @param gradientDirection 边框渐变方向
- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withBorderGradientColors:(nullable NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(nullable NSArray<NSNumber *> *)lineDashPattern{
    
    GradientModel* borderGradientModel = nil;
    if(gradientColors){
        borderGradientModel = [[GradientModel alloc]init];
        borderGradientModel.direction = gradientDirection;
        borderGradientModel.gradientColors = gradientColors;
    }
    
    if(!borderColor){
        borderColor = [UIColor whiteColor];
    }
    
    [[[self ZTUIKit] borderWithBorderWidth:borderWidth withBorderColor:borderColor withLineDashPhase:lineDashPhase withLineDashPattern:lineDashPattern withBorderGradientModel:borderGradientModel] buildWithView:self];
}

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern {
    
    NSMutableArray<UIColor*>* gradientColors = nil;
    GradientDirection direction = GradientDirectionLeft2Right;
    
    [self zt_borderWithBorderWidth:borderWidth withBorderColor:borderColor withBorderGradientColors:gradientColors withBorderGradientDirection:direction withLineDashPhase:lineDashPhase withLineDashPattern:lineDashPattern ];
}

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor {
    
    CGFloat lineDashPhase = 0.f;
    NSArray<NSNumber *> * lineDashPattern = nil;
    [self zt_borderWithBorderWidth:borderWidth withBorderColor:borderColor withLineDashPhase:lineDashPhase withLineDashPattern:lineDashPattern];
}

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderGradientColors:(NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection{
    
    CGFloat lineDashPhase = 0.f;
    NSArray<NSNumber *> * lineDashPattern = nil;
    [self zt_borderWithBorderWidth:borderWidth withBorderGradientColors:gradientColors withBorderGradientDirection:gradientDirection withLineDashPhase:lineDashPhase withLineDashPattern:lineDashPattern];
}

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderGradientColors:(NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern{
    
    UIColor *borderColor = nil;
    [self zt_borderWithBorderWidth:borderWidth withBorderColor:borderColor withBorderGradientColors:gradientColors withBorderGradientDirection:gradientDirection withLineDashPhase:lineDashPhase withLineDashPattern:lineDashPattern];
}



#pragma mark - 阴影

/// 创建阴影
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowRadius 阴影圆角
/// @param shadowOpacity 阴影透明度
- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity withShadowOffset:(CGSize)shadowOffset{
    
    [[[self ZTUIKit] shadowWithShadowColor:shadowColor withShadowOffset:shadowOffset withShadowRadius:shadowRadius withShadowOpacity:shadowOpacity] buildWithView:self];
}

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity{
    
    CGSize shadowOffset = CGSizeMake(0, 0);//[X,Y]都无偏移
    [self zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius withShadowOpacity:shadowOpacity withShadowOffset:shadowOffset ];
}

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius{
    
    float shadowOpacity = 1.0f;//不透明
    [self zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius withShadowOpacity:shadowOpacity];
}

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOffset:(CGSize)shadowOffset{
    
    float shadowOpacity = 1.0f;//不透明
    [self zt_shadowWithShadowColor:shadowColor withShadowRadius:shadowRadius withShadowOpacity:shadowOpacity withShadowOffset:shadowOffset];
}

#pragma mark - 背景/渐变背景

/// 创建背景渐变
/// @param gradientColors 渐变颜色数组@[UIColor,UIColor]
/// @param direction 渐变方向
/// @param gradientLocations 渐变位置数组
- (void) zt_gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction withGradientLocations:(nullable NSArray*)gradientLocations{
    
    [[[self ZTUIKit] gradientWithGradientColors:gradientColors withDirection:direction withGradientLocations:gradientLocations] buildWithView:self];
}

- (void) zt_gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction{
    [self zt_gradientWithGradientColors:gradientColors withDirection:direction withGradientLocations:nil];
}


#pragma mark - ZTUIKit
static const char *ZTUIKit_key_AssociatedObject  = "ZTUIKit_key_AssociatedObject";

- (ZTUIKit*)getZTUIKit
{
    return objc_getAssociatedObject(self, ZTUIKit_key_AssociatedObject);
}

- (void)setZTUIKit:(ZTUIKit*)ztUIKit
{
    objc_setAssociatedObject(self, ZTUIKit_key_AssociatedObject, ztUIKit, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - 创建/获取资源
- (ZTUIKit*)ZTUIKit
{
    if(![self getZTUIKit]){
        [self addZTUIstyleObserver];
        [self setZTUIKit: [[ZTUIKit alloc] init]];
    }
    return [self getZTUIKit];
}

#pragma mark - 释放资源
- (void)releaseZTUIstyleResources{
    if([self getZTUIKit]){
        [self removeZTUIstyleObserver];
        objc_removeAssociatedObjects(self);
    }
}

- (void)dealloc{
    [self releaseZTUIstyleResources];
}

@end
