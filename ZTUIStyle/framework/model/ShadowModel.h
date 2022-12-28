//
//  ShadowModel.h
//  iOSApp
//  阴影实体类：设置阴影属性
//  Created by 钟达烽 on 2022/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ShadowModel : NSObject

//阴影颜色
@property(nonatomic,strong) UIColor* shadowColor;

//阴影透明度
@property(nonatomic,assign) float shadowOpacity;

//阴影偏移
@property(nonatomic,assign) CGSize shadowOffset;

//阴影半径
@property(nonatomic,assign) CGFloat shadowRadius;
@end

NS_ASSUME_NONNULL_END
