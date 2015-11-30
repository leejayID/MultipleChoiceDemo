//
//  ViewController.m
//  MultipleChoiceDemo
//
//  Created by LeeJay on 15/10/21.
//  Copyright © 2015年 以撒网. All rights reserved.
//

#import "ViewController.h"
#import "MyTableViewCell.h"
#import "MyModel.h"

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


@interface ViewController () <UITableViewDataSource,UITableViewDelegate,SelectReloadDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *dataSouce;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *arr = @[@"照片",
                     @"姓名",
                     @"性别",
                     @"证件",
                     @"出生年月",
                     @"手机",
                     @"微信",
                     @"QQ",
                     @"邮箱",
                     @"行业",
                     @"职位",
                     @"企业名称",
                     @"目前薪资",
                     @"学历",
                     @"工作年限",
                     @"婚姻状况",
                     @"现居住地",
                     @"工作经历",
                     @"照片",
                     @"姓名",
                     @"性别",
                     @"证件",
                     @"出生年月",
                     @"手机",
                     @"微信",
                     @"QQ",
                     @"邮箱",
                     @"行业",
                     @"职位",
                     @"企业名称",
                     @"目前薪资",
                     @"学历",
                     @"工作年限",
                     @"婚姻状况",
                     @"现居住地",
                     @"工作经历"];
    
    for (NSString *name in arr) {
        MyModel *model = [[MyModel alloc]init];
        model.name = name;
        model.isCheck = NO;//默认全部不选中
        
        [self.dataSouce addObject:model];
    }
    
    [self tableView];
}

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
        [_tableView registerClass:[MyTableViewCell class] forCellReuseIdentifier:@"MyTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}
- (NSMutableArray *)dataSouce
{
    if(!_dataSouce){
        _dataSouce = [NSMutableArray array];
    }
    return _dataSouce;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSouce.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableViewCell" forIndexPath:indexPath];
    cell.model = self.dataSouce[indexPath.row];
    cell.indexPath = indexPath;
    cell.delegate = self;
    if(!cell.selectBtn){
        [cell selectBtn];
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)cellForSelect:(BOOL)isSelect atIndexPath:(NSIndexPath *)indexPath
{
    MyModel *model = self.dataSouce[indexPath.row];
    model.isCheck = isSelect;
    [self.dataSouce replaceObjectAtIndex:indexPath.row withObject:model];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
