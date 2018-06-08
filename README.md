# AlertView
这个一个与系统UIAlertController相似的中间弹出的alertView，写这个是为了方便修改字体颜色、字体大小、间距等，现在的美工很膨胀，什么款都能搞出来！~~~

# 使用方法

1.创建

    MLAlertView *alert = [[MLAlertView alloc] initWithTitle:nil andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"知道了"] andSelectBlock:^(NSInteger index) {

        NSLog(@"index->%ld",index);

    }];

2.设置需要的属性

    //横线和竖线的颜色
    alert.lineViewColor = [UIColor colorWithRed:220/255.0 green:220/255.0 blue:220/255.0 alpha:1];

    //副标题或描述的字体颜色
    alert.messageLabelColor = [UIColor redColor];

    //按钮item的颜色数组 按顺序取 实际最多只有3个按钮 如果颜色数组只有两个颜色，则最后一个颜色按钮是默认色，如果颜色数组颜色多了，只取前3个值
    NSArray *colorArr = @[[UIColor greenColor]];
    alert.itemTitleColorArr = colorArr;

    //副标题或描述的颜色
    alert.messageLabelColor = [UIColor grayColor];

    alert.buttonFont = [UIFont systemFontOfSize:18 weight:550];

    alert.transverseLineHidden = YES;

    //设置副标题某段文字的颜色 如果设置了副标题颜色messageLabelColor，必须放在前面，否则此处设置无效，会被messageLabelColor覆盖，没有设置副标题则此处设置无效
    [alert messageLabelTextColorWith:NSMakeRange(15, 6) andColor:[UIColor orangeColor]];
    
3.调用下面之一的show方法就可以弹出来了

    if (self.tabBarController.view) {
    
        [alert showWithView:self.tabBarController.view];
        
    }else if (self.navigationController.view) {
    
        [alert showWithView:self.navigationController.view];
    
    }else{
    
        [alert showWithView:self.view];
    
    }
    
    
