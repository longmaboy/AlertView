//
//  ViewController.m
//  AlertView
//
//  Created by Admin on 2018/6/6.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import "ViewController.h"
#import "MLAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 80, 40)];
    [btn setTitle:@"按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
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
