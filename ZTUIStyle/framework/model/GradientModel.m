//
//  GradientModel.m
//  iOSApp
//  
//  Created by 钟达烽 on 2022/11/24.
//

#import "GradientModel.h"

@implementation GradientModel

- (instancetype)init{
    self = [super init];
    if(!self) return nil;
    _startPoint = CGPointMake(0, 0);
    _endPoint = CGPointMake(1, 0);
    return self;
}

- (NSArray *)gradientLocations{
    if(!_gradientLocations){
        _gradientLocations = @[@0,@1];
    }
    return _gradientLocations;
}

/// 计算渐变起点/终点
/// @param normal 默认原点：默认原点影响垂直方向的值
- (void)computePoint:(BOOL)normal{
    switch (_direction) {
        case GradientDirectionRight2Left:
            _startPoint = CGPointMake(1, 0);
            _endPoint = CGPointMake(0, 0);
            break;
        case GradientDirectionTop2Bottom:
            _startPoint = normal ? CGPointMake(0, 0) : CGPointMake(0, 1);
            _endPoint = normal ? CGPointMake(0, 1): CGPointMake(0, 0);
            break;
        case GradientDirectionBottom2Top:
            _startPoint = normal ? CGPointMake(0, 1) : CGPointMake(0, 0);
            _endPoint = normal ? CGPointMake(0, 0) : CGPointMake(0, 1);
            break;
        case GradientDirectionLeftTop2RightBottom:
            _startPoint = normal ? CGPointMake(0, 0) : CGPointMake(0, 1);
            _endPoint = normal ? CGPointMake(1, 1): CGPointMake(1, 0);
            break;
        case GradientDirectionLeftBottom2RightTop:
            _startPoint = normal ? CGPointMake(0, 1): CGPointMake(0, 0);
            _endPoint = normal ? CGPointMake(1, 0) : CGPointMake(1, 1);
            break;
        case GradientDirectionRightTop2LeftBottom:
            _startPoint = normal ? CGPointMake(1, 0) : CGPointMake(1, 1);
            _endPoint = normal ? CGPointMake(0, 1) : CGPointMake(0, 0);
            break;
        case GradientDirectionRightBottom2LeftTop:
            _startPoint = normal ? CGPointMake(1, 1) : CGPointMake(1, 0);
            _endPoint = normal ? CGPointMake(0, 0) : CGPointMake(0, 1);
            break;
        case GradientDirectionLeft2Right:
        default:
            _startPoint = CGPointMake(0, 0);
            _endPoint = CGPointMake(1, 0);
            break;
    }
}

- (void)setGradientColors:(NSMutableArray*)gradientColors{
    if(gradientColors){
        
        NSMutableArray *array = [[NSMutableArray alloc]init];
        
        //数量不够，手动复制2份
        if(gradientColors.count < 2){
            [gradientColors addObjectsFromArray:gradientColors];
        }
        
        //处理数据类型
        for (int i = 0; i < gradientColors.count; i++) {
            UIColor *color = [gradientColors objectAtIndex:i];
            [array addObject:(__bridge id)[color CGColor]];
        }
        
        _gradientColors = array;
    }
}

@end
