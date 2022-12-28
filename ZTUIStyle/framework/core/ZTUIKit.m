//
//  ZTUIKit.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/11/24.
//

#import "ZTUIKit.h"
#import "ZTUitls.h"

@implementation ZTUIKit


/// 创建圆角
/// @param uiRectCorner UIRectCorner 指定圆角方向（左上，右上，，，全部），可以组合使用
/// @param cornerRadii 圆角大小
- (ZTUIKit*)cornerWithUIRectCorner:(UIRectCorner)uiRectCorner withCornerRadii:(CGSize)cornerRadii{
    if(!_cornerModel){
        _cornerModel = [[CornerModel alloc]init];
    }
    
    _cornerModel.corner = uiRectCorner;
    _cornerModel.cornerRadii = cornerRadii;
    return self;
}


/// 创建边框
/// @param borderWidth 边框宽度
/// @param borderColor 边框颜色
/// @param lineDashPhase 虚线起始位置
/// @param lineDashPattern 虚线模型NSNumber数组：奇数位数值表示实线长度，偶数位数值表示空白长度
/// @param borderGradientModel 边框渐变（默认只需要属性：[ gradientColors , direction ] ）
- (ZTUIKit*)borderWithBorderWidth:(CGFloat)borderWidth withBorderColor:(UIColor*)borderColor withLineDashPhase:(CGFloat)lineDashPhase withLineDashPattern:(NSArray<NSNumber *> *)lineDashPattern withBorderGradientModel:(GradientModel *)borderGradientModel{
    
    if(!_borderModel){
        _borderModel = [[BorderModel alloc]init];
    }
    
    _borderModel.borderWidth = borderWidth;
    _borderModel.borderColor = borderColor;
    _borderModel.lineDashPhase = lineDashPhase;
    _borderModel.lineDashPattern = lineDashPattern;
    _borderModel.borderGradient = borderGradientModel;
    return self;
}

/// 创建阴影
/// @param shadowColor 阴影颜色
/// @param shadowOffset 阴影偏移
/// @param shadowRadius 阴影圆角
/// @param shadowOpacity 阴影透明度
- (ZTUIKit*)shadowWithShadowColor:(UIColor*)shadowColor withShadowOffset:(CGSize)shadowOffset withShadowRadius:(CGFloat)shadowRadius withShadowOpacity:(float)shadowOpacity {
    if(!_shadowModel){
        _shadowModel = [[ShadowModel alloc]init];
    }
    
    _shadowModel.shadowColor = shadowColor;
    _shadowModel.shadowOffset = shadowOffset;
    _shadowModel.shadowRadius = shadowRadius;
    _shadowModel.shadowOpacity = shadowOpacity;
    return self;
}

/// 创建背景渐变
/// @param gradientColors 渐变颜色数组@[UIColor,UIColor]
/// @param direction 渐变方向
/// @param gradientLocations 渐变位置数组
- (ZTUIKit*) gradientWithGradientColors:(NSMutableArray<UIColor*>*)gradientColors withDirection:(GradientDirection)direction withGradientLocations:(nullable NSArray*)gradientLocations {
    
    if(!_gradientModel){
        _gradientModel = [[GradientModel alloc]init];
    }
    
    _gradientModel.gradientColors = gradientColors;
    _gradientModel.direction = direction;
    _gradientModel.gradientLocations = gradientLocations;
    return self;
}


-(void)buildWithView:(UIView*)view{
    
    //共用设置
    CGRect frame = view.bounds;
    BOOL isKindOfLabel = [view isKindOfClass:[UILabel class]];
    
    //圆角
    if(_cornerModel){
        
        //圆角layer
        if(!_cornerLayer) _cornerLayer = [CAShapeLayer layer];
        _cornerLayer.frame = frame;
        [_cornerLayer removeAllAnimations];
        
        //贝塞尔曲线：制定不同方向圆角大小的路径
        UIBezierPath *cornerPath = [UIBezierPath bezierPathWithRoundedRect:_cornerLayer.frame byRoundingCorners:_cornerModel.corner cornerRadii:_cornerModel.cornerRadii];
        
        //设置圆角属性：圆角路径
        _cornerLayer.path = cornerPath.CGPath;
    }
    
    
    //边框
    if(_borderModel){
        
        //构建边框layer
        if(!_borderLayer) _borderLayer = [CAShapeLayer layer];
        _borderLayer.frame = frame;
        [_borderLayer removeAllAnimations];
        
        _borderLayer.lineWidth = _borderModel.borderWidth;//变框大小
        _borderLayer.fillColor = _borderModel.fillColor.CGColor;//背景颜色
        _borderLayer.strokeColor = _borderModel.borderColor.CGColor;//边框颜色
        //必须设置
        if(_cornerLayer){
            _borderLayer.path = _cornerLayer.path;
        }else{
            _borderLayer.path = [UIBezierPath bezierPathWithRect:_borderLayer.frame].CGPath;
        }
        
        //虚线边框
        if(_borderModel.lineDashPattern){
            _borderLayer.lineDashPhase = _borderModel.lineDashPhase;//虚线型模版的起始位置
            _borderLayer.lineDashPattern = _borderModel.lineDashPattern;//奇数位数值表示实线长度，偶数位数值表示空白长度
        }
        
        //边框渐变
        if(_borderModel.borderGradient){
            if(!_borderGradientLayer) _borderGradientLayer = [CAGradientLayer layer];
            _borderGradientLayer.frame = frame;
            [_borderGradientLayer removeAllAnimations];
            _borderGradientLayer.colors = _borderModel.borderGradient.gradientColors;
            [_borderModel.borderGradient computePoint: YES];//计算渐变坐标点
            _borderGradientLayer.startPoint = _borderModel.borderGradient.startPoint;
            _borderGradientLayer.endPoint = _borderModel.borderGradient.endPoint;
            //基于边框
            _borderGradientLayer.mask = _borderLayer;
        }
        
    }
    
    //背景（渐变）
    if(_gradientModel){
        
        //构建渐变背景layer
        if(!_gradientLayer) _gradientLayer = [CAGradientLayer layer];
        _gradientLayer.frame = frame;
        [_gradientLayer removeAllAnimations];
        
        _gradientLayer.colors = _gradientModel.gradientColors;
        _gradientLayer.locations = _gradientModel.gradientLocations;
        [_gradientModel computePoint: !isKindOfLabel];//计算渐变坐标点
        _gradientLayer.startPoint = _gradientModel.startPoint;
        _gradientLayer.endPoint = _gradientModel.endPoint;
    }
    
    //阴影
    if(_shadowModel){
        
        //构建阴影layer
        if(!_shadowLayer) _shadowLayer = [CAShapeLayer layer];
        _shadowLayer.frame = view.frame;
        [_shadowLayer removeAllAnimations];
        
        _shadowLayer.shadowColor = _shadowModel.shadowColor.CGColor;
        _shadowLayer.shadowOffset = _shadowModel.shadowOffset;
        _shadowLayer.shadowRadius = _shadowModel.shadowRadius;
        _shadowLayer.shadowOpacity = _shadowModel.shadowOpacity;
        _shadowLayer.masksToBounds = NO;
        if(_cornerLayer){
            _shadowLayer.path = _cornerLayer.path;
        }else{
            _shadowLayer.path = [UIBezierPath bezierPathWithRect:_shadowLayer.frame].CGPath;
        }
        
    }
      

    //1.圆角处理
    if(_cornerLayer){
        view.layer.mask = _cornerLayer;
    }
    
    //2.阴影处理
    if(_shadowLayer){
        //通过 superlayer 来添加 Sublayer，平级无效
        [view.layer.superlayer insertSublayer:_shadowLayer below:view.layer];
    }

    
    //3.渐变背景处理
    if(_gradientLayer){
        if(isKindOfLabel){
            //通过背景色实现
            view.layer.backgroundColor = [ZTUitls makeColorFromImageWithLayer:_gradientLayer].CGColor;
        }else{
            //Z轴层级需要小于边框
            [view.layer insertSublayer:_gradientLayer atIndex:1];
        }
    }
    
    //4.边框处理：在 Z 轴需要在最上层
    if(_borderLayer){
        if(_borderGradientLayer){//带渐变的边框
            [view.layer insertSublayer:_borderGradientLayer atIndex:2];
        }else{
            [view.layer insertSublayer:_borderLayer atIndex:2];
        }
    }
    
}



@end
