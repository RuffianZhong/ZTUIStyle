//
//  UIView+ZTUIStyle.h
//  ZTUIStyle
//
//  Created by 钟达烽 on 2022/12/27.
//

#import <UIKit/UIKit.h>
#import "Enum.h"
#import <objc/message.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (ZTUIStyle)


#pragma mark - 圆角
/// 创建圆角
/// @param uiRectCorner UIRectCorner 指定圆角方向（左上，右上，，，全部），可以组合使用
/// @param cornerRadii 圆角大小
- (void)zt_cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadiiSize:(CGSize)cornerRadii;

- (void)zt_cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadii:(float)cornerRadii;

- (void)zt_cornerWithCornerRadii:(float)cornerRadii;

#pragma mark - 边框
/// 创建边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
/// @param lineDashPhase 虚线起始位置
/// @param lineDashPattern 虚线模型NSNumber数组：奇数位数值表示实线长度，偶数位数值表示空白长度
/// @param gradientColors 边框渐变颜色
/// @param gradientDirection 边框渐变方向
- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withBorderGradientColors:(nullable NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(nullable NSArray<NSNumber *> *)lineDashPattern;

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern;

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor;

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderGradientColors:(NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection;

- (void)zt_borderWithBorderWidth:(CGFloat)borderWidth withBorderGradientColors:(NSMutableArray<UIColor*>*)gradientColors withBorderGradientDirection:(GradientDirection) gradientDirection withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern;

#pragma mark - 阴影
/// 创建阴影
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowRadius 阴影圆角
/// @param shadowOpacity 阴影透明度
- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity withShadowOffset:(CGSize)shadowOffset;

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity;

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius;

- (void)zt_shadowWithShadowColor:(UIColor*)shadowColor withShadowRadius:(CGFloat)shadowRadius withShadowOffset:(CGSize)shadowOffset;

#pragma mark - 背景/渐变背景
/// 创建背景渐变
/// @param gradientColors 渐变颜色数组 @[ UIColor , UIColor ]
/// @param direction 渐变方向
/// @param gradientLocations 渐变位置数组
- (void) zt_gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction withGradientLocations:(nullable NSArray*)gradientLocations;

- (void) zt_gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction;


@end

NS_ASSUME_NONNULL_END
