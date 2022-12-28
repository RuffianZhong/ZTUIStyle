//
//  DemoBaseController.h
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DemoBaseController : UIViewController

@property(nonatomic,strong) UIScrollView *scrollView;

- (UILabel*)makeLabel:(UIColor*)bgColor text:(NSString*)text;
    
@end

NS_ASSUME_NONNULL_END
