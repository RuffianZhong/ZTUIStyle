//
//  GradientModel.h
//  iOSApp
//  背景渐变实体类：设置背景渐变属性
//  Created by 钟达烽 on 2022/11/24.
//

#import <Foundation/Foundation.h>
#import "Enum.h"

NS_ASSUME_NONNULL_BEGIN

@interface GradientModel : NSObject

//渐变颜色数组
@property(nonatomic,strong) NSMutableArray* gradientColors;

//渐变方向
@property(nonatomic,assign) GradientDirection direction;

@property(nonatomic,strong) NSArray* gradientLocations;

@property(nonatomic,assign) CGPoint startPoint;

@property(nonatomic,assign) CGPoint endPoint;


- (void)computePoint:(BOOL)normal;
@end

NS_ASSUME_NONNULL_END
