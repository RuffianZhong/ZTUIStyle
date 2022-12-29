//
//  DemoBaseController.m
//  iOSApp
//
//  Created by 钟达烽 on 2022/12/19.
//

#import "DemoBaseController.h"

@interface DemoBaseController ()

@end

@implementation DemoBaseController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (UILabel*)makeLabel:(UIColor*)bgColor text:(NSString*)text{
    UILabel *view = [[UILabel alloc] init];
    view.backgroundColor = bgColor;
    view.text = text;
    view.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:view];
    return view;
}

@end
