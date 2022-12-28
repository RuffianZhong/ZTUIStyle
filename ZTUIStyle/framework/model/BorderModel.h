//
//  BorderModel.h
//  iOSApp
//  边框实体类：设置边框属性
//  Created by 钟达烽 on 2022/11/24.
//

#import <Foundation/Foundation.h>
#import "GradientModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BorderModel : NSObject

//边框大小
@property(nonatomic,assign) CGFloat borderWidth;

//边框颜色
@property(nonatomic,strong) UIColor* borderColor;

//边框填充颜色(默认透明)
@property(nonatomic,strong) UIColor* fillColor;

//虚线型模版的起始位置
@property(nonatomic,assign) CGFloat lineDashPhase;

//虚线模型NSNumber数组：奇数位数值表示实线长度，偶数位数值表示空白长度
@property(nonatomic,strong) NSArray<NSNumber *> *lineDashPattern;

//边框渐变
@property(nonatomic,strong) GradientModel *borderGradient;

@end

NS_ASSUME_NONNULL_END
