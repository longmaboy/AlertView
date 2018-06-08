//
//  ViewController.m
//  AlertView
//
//  Created by Admin on 2018/6/6.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "ViewController.h"
#import "MLAlertView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [self.tableView reloadData];
    
    
}

#pragma mark - creatUI lazy

- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        _tableView.tableFooterView = [UIView new];
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 20, 0, 20);
        
    }
    return _tableView;
}

#pragma mark - delegateMethod

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"style->%ld",indexPath.row];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {
        
        
    }else if (indexPath.row == 1) {
        
        
    }
}


- (void)btnAction:(UIButton *)btn
{
    MLAlertView *alert = [[MLAlertView alloc] initWithTitle:@"提交成功" andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一，设有中国大陆首个自贸区中国（上海）自由贸易试验区。上海市与安徽、江苏、浙江共同构成了长江三角洲城市群，是世界六大城市群之一。" andMessageAlignment:NSTextAlignmentLeft andItem:@[@"取消",@"确定"] andSelectBlock:^(NSInteger index) {
        
        NSLog(@"index->%ld",index);
        
    }];


    alert.lineViewColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
    
    alert.messageLabelColor = [UIColor redColor];
    
//
//    NSArray *colorArr = @[[UIColor blueColor],[UIColor cyanColor],[UIColor purpleColor],[UIColor redColor]];
//    alert.itemTitleColorArr = colorArr;
//
//    alert.transverseLineHidden = NO;
//
    alert.transverseLineHidden = YES;
//
//    alert.buttonFont = [UIFont systemFontOfSize:12 weight:600];
//
//    alert.messageLabelColor = [UIColor yellowColor];
//
//    alert.titleLabelColor = [UIColor redColor];

    [alert showWithView:self.view];
}

- (void)systemAlert
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确认打卡" message:@"使用此消息会" preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
