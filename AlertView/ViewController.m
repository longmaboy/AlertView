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
@property (nonatomic, strong) NSArray * titleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"MLAlertView";
    
    _titleArr = @[@"title+item", @"message+item", @"message+item+hidden-line", @"all", @"title+mesage+item1", @"mesage+item1", @"系统的alert"];
    
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
        
        _tableView.separatorInset = UIEdgeInsetsMake(0, 50, 0, 50);
        
    }
    return _tableView;
}

#pragma mark - delegateMethod

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"style->%@",self.titleArr[indexPath.row]];
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.row == 0) {//title+item
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:@"提交成功" andMessage:nil andMessageAlignment:NSTextAlignmentLeft andItem:@[@"取消",@"确定"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        alert.titleLabelFont = [UIFont systemFontOfSize:20 weight:550];
        
        [alert showWithView:self.navigationController.view];
        
    }else if (indexPath.row == 1) {//message+item
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:nil andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一，设有中国大陆首个自贸区中国（上海）自由贸易试验区。上海市与安徽、江苏、浙江共同构成了长江三角洲城市群，是世界六大城市群之一。" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"取消",@"确定"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        NSArray *colorArr = @[[UIColor greenColor],[UIColor greenColor]];
        alert.itemTitleColorArr = colorArr;
        
        alert.lineViewColor = [UIColor greenColor];
        
        [self alertShow:alert];
        
    }else if (indexPath.row == 2) {//message+item
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:nil andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一，设有中国大陆首个自贸区中国（上海）自由贸易试验区。上海市与安徽、江苏、浙江共同构成了长江三角洲城市群，是世界六大城市群之一。" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"取消",@"确定"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        NSArray *colorArr = @[[UIColor greenColor],[UIColor greenColor]];
        alert.itemTitleColorArr = colorArr;
        
        alert.lineViewColor = [UIColor greenColor];
        
        alert.transverseLineHidden = YES;
        
        [self alertShow:alert];
        
    }
    else if (indexPath.row == 3) {//all
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:@"提交成功" andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一，设有中国大陆首个自贸区中国（上海）自由贸易试验区。上海市与安徽、江苏、浙江共同构成了长江三角洲城市群，是世界六大城市群之一。" andMessageAlignment:NSTextAlignmentLeft andItem:@[@"取消",@"确定",@"知道了"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        //横线和竖线的颜色
        alert.lineViewColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        //副标题或描述的字体颜色
        alert.messageLabelColor = [UIColor redColor];
        
        //按钮item的颜色数组 按顺序取 实际最多只有3个按钮 如果颜色数组只有两个颜色，则最后一个颜色按钮是默认色，如果颜色数组颜色多了，只取前3个值
        NSArray *colorArr = @[[UIColor blueColor],[UIColor cyanColor],[UIColor purpleColor],[UIColor redColor]];
        alert.itemTitleColorArr = colorArr;
        
        //是否隐藏横线 竖线不隐藏 并且变短
//        alert.transverseLineHidden = YES;
        
        //按钮item的字体
        alert.buttonFont = [UIFont systemFontOfSize:15 weight:600];
        
        //副标题或描述的颜色
        alert.messageLabelColor = [UIColor purpleColor];
        
        //大标题的颜色
        alert.titleLabelColor = [UIColor redColor];
        
        [self alertShow:alert];
        
    }else if (indexPath.row == 4) {//title+mesage+item1
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:@"提交成功" andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"知道了"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        //横线和竖线的颜色
        alert.lineViewColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:0.8];
        
        //副标题或描述的字体颜色
        alert.messageLabelColor = [UIColor redColor];
        
        //按钮item的颜色数组 按顺序取 实际最多只有3个按钮 如果颜色数组只有两个颜色，则最后一个颜色按钮是默认色，如果颜色数组颜色多了，只取前3个值
        NSArray *colorArr = @[[UIColor greenColor]];
        alert.itemTitleColorArr = colorArr;
        
        //副标题或描述的颜色
        alert.messageLabelColor = [UIColor grayColor];
        
        [self alertShow:alert];
        
    }else if (indexPath.row == 5) {//mesage+item1
        
        MLAlertView *alert = [[MLAlertView alloc] initWithTitle:nil andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"知道了"] andSelectBlock:^(NSInteger index) {
            
            NSLog(@"index->%ld",index);
            
        }];
        
        //横线和竖线的颜色
        alert.lineViewColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];
        
        //副标题或描述的字体颜色
        alert.messageLabelColor = [UIColor redColor];
        
        //按钮item的颜色数组 按顺序取 实际最多只有3个按钮 如果颜色数组只有两个颜色，则最后一个颜色按钮是默认色，如果颜色数组颜色多了，只取前3个值
        NSArray *colorArr = @[[UIColor greenColor]];
        alert.itemTitleColorArr = colorArr;
        
        //副标题或描述的颜色
        alert.messageLabelColor = [UIColor grayColor];
        
        [self alertShow:alert];
        
    }else if (indexPath.row == 6) {//system alert
        
        [self systemAlert];
    }
}

//这里只是举例 只用选其一就行
//有tabBarController优先使用self.tabBarController.view
//其次navigationController
//最后才选self.view
- (void)alertShow:(MLAlertView *)alert
{
    if (self.tabBarController.view) {
        [alert showWithView:self.tabBarController.view];
    }else if (self.navigationController.view) {
        [alert showWithView:self.navigationController.view];
    }else{
        [alert showWithView:self.view];
    }
}

- (void)alertAction
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
