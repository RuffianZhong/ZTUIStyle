//
//  CornerModel.h
//  iOSApp
//  圆角实体类：设置圆角属性
//  Created by 钟达烽 on 2022/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CornerModel : NSObject

//圆角方向（左上，右上，，，全部），可以组合使用
@property(nonatomic,assign) UIRectCorner corner;

//圆角大小
@property(nonatomic,assign) CGSize cornerRadii;

@end

NS_ASSUME_NONNULL_END
