//
//  ZTUIKit.h
//  iOSApp
//
//  Created by 钟达烽 on 2022/11/24.
//

#import <Foundation/Foundation.h>
#import "BorderModel.h"
#import "CornerModel.h"
#import "GradientModel.h"
#import "ShadowModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZTUIKit : NSObject

//特性 Style Model
@property(nonatomic,strong) BorderModel* borderModel;
@property(nonatomic,strong) CornerModel* cornerModel;
@property(nonatomic,strong) GradientModel* gradientModel;
@property(nonatomic,strong) ShadowModel* shadowModel;

//特性 Style Layer
@property(nonatomic,strong) CAShapeLayer *borderLayer;
@property(nonatomic,strong) CAGradientLayer *borderGradientLayer;
@property(nonatomic,strong) CAShapeLayer *cornerLayer;
@property(nonatomic,strong) CAShapeLayer *shadowLayer;
@property(nonatomic,strong) CAGradientLayer *gradientLayer;


/// 创建圆角
/// @param uiRectCorner UIRectCorner 指定圆角方向（左上，右上，，，全部），可以组合使用
/// @param cornerRadii 圆角大小
- (ZTUIKit*)cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadii:(CGSize)cornerRadii;


/// 创建边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
/// @param lineDashPhase 虚线起始位置
/// @param lineDashPattern 虚线模型NSNumber数组：奇数位数值表示实线长度，偶数位数值表示空白长度
/// @param borderGradientModel 边框渐变（默认只需要属性：[ gradientColors , direction ] ）
- (ZTUIKit*)borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern withBorderGradientModel:(GradientModel *)borderGradientModel;


/// 创建阴影
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowRadius 阴影圆角
/// @param shadowOpacity 阴影透明度
- (ZTUIKit*)shadowWithShadowColor:(UIColor*)shadowColor withShadowOffset:(CGSize)shadowOffset withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity;


/// 创建背景渐变
/// @param gradientColors 渐变颜色数组@[UIColor,UIColor]
/// @param direction 渐变方向
/// @param gradientLocations 渐变位置数组
- (ZTUIKit*) gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction withGradientLocations:(nullable NSArray*)gradientLocations;


///构建样式
- (void)buildWithView:(UIView*)view;

@end

NS_ASSUME_NONNULL_END
