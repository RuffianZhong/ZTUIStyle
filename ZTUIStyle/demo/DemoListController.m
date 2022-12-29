//
//  DemoListController.m
//  ZTUIStyle
//
//  Created by 钟达烽 on 2022/12/28.
//

#import "DemoListController.h"
#import "DemoGradientController.h"
#import "DemoBorderController.h"
#import "DemoCornerController.h"
#import "DemoShadowController.h"
#import "DemoMixedController.h"

@interface DemoListController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation DemoListController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
    [self initData];
}

-(void)initViews{
    _tableView=[[UITableView alloc]init];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(self.view);
    }];
    _tableView.delegate=self;
    _tableView.dataSource=self;
}

-(void)initData{
    
    _dataArray = [NSMutableArray array];
    [_dataArray addObject:@"圆角样式"];
    [_dataArray addObject:@"边框样式"];
    [_dataArray addObject:@"阴影样式"];
    [_dataArray addObject:@"渐变样式"];
    [_dataArray addObject:@"混合样式"];
    
    [_tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DemoBaseController *vc = nil;
    switch (indexPath.row) {
        case 0:
            vc = [[DemoCornerController alloc]init];
            break;
        case 1:
            vc = [[DemoBorderController alloc]init];
            break;
        case 2:
            vc = [[DemoShadowController alloc]init];
            break;
        case 3:
            vc = [[DemoGradientController alloc]init];
            break;
        case 4:
            vc = [[DemoMixedController alloc]init];
            break;
        default:
            break;
    }
        
    [self.navigationController pushViewController:vc animated:NO];
}


@end
