//
//  Enum.h
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/15.
//

#ifndef Enum_h
#define Enum_h

/*渐变方向**/
typedef NS_ENUM(NSUInteger, GradientDirection) {
    GradientDirectionLeft2Right  = 0,
    GradientDirectionRight2Left,
    GradientDirectionTop2Bottom,
    GradientDirectionBottom2Top,
    GradientDirectionLeftTop2RightBottom,
    GradientDirectionLeftBottom2RightTop,
    GradientDirectionRightTop2LeftBottom,
    GradientDirectionRightBottom2LeftTop
};


#endif /* Enum_h */
