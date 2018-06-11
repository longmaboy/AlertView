# AlertView
这个一个与系统UIAlertController相似的中间弹出的alertView，写这个是为了方便修改字体颜色、字体大小、间距等，现在的美工很膨胀，什么款都能搞出来！~~~

# 先看效果图

![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert1.png)
![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert2.png)
![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert3.png)
![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert4.png)
![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert5.png)
![Image text](https://github.com/longmaboy/Financial/blob/master/Image/alert6.png)

# 使用方法 将轮子文件夹MLAlertView拖到自己项目导入#import "MLAlertView.h"即可

1.创建

    MLAlertView *alert = [[MLAlertView alloc] initWithTitle:@"提交成功" andMessage:@"上海港货物吞吐量和集装箱吞吐量均居世界第一" andMessageAlignment:NSTextAlignmentCenter andItem:@[@"知道了"] andSelectBlock:^(NSInteger index) {

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
    
# .h文件一览

    #import <UIKit/UIKit.h>

    @interface MLAlertView : UIView

    /**
    *  view创建方法
    *  @param title     大标题
    *  @param message   副标题或描述
    *  @param textAlignment   副标题或描述 的字体位置 如果没有设置副标题，则设置无效
    *  @param itemArr   按钮item数组 不设置则弹出view无法消失，按钮最多3个，多设置取前3
    */
    - (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message andMessageAlignment:(NSTextAlignment)textAlignment andItem:(NSArray<NSString *> *)itemArr andSelectBlock:(void(^)(NSInteger index))selectBlock;

    /**
    *  view显示方法
    *  @param view 传入俯父视图view
    */
    - (void)showWithView:(UIView *)view;


    /** 大标题title的字体大小 */
    @property (nonatomic, strong) UIFont * titleLabelFont;

    /** 大标题title的字体颜色 */
    @property (nonatomic, strong) UIColor * titleLabelColor;

    /** 副标题或描述message的字体颜色 */
    @property (nonatomic, strong) UIColor * messageLabelColor;

    /** 按钮item的字体大小 */
    @property (nonatomic, strong) UIFont * buttonFont;

    /** 横线和竖线的颜色 */
    @property (nonatomic, strong) UIColor * lineViewColor;

    /** 是否隐藏横线 默认为NO不隐藏 要隐藏设为YES*/
    @property (nonatomic, assign) BOOL transverseLineHidden;

    /** 总共最多3个item 按顺序把颜色放数组里面就行了，没item设置无效，多设置按顺序取 */
    @property (nonatomic, strong) NSArray<UIColor *> * itemTitleColorArr;

    /** 设置副标题某段文字的颜色 如果设置了副标题颜色messageLabelColor，必须放在前面，否则此处设置无效，会被messageLabelColor覆盖，如果没有副标题则此处设置无效 */
    - (void)messageLabelTextColorWith:(NSRange)range andColor:(UIColor *)color;


    @end

# .m里面的基本属性设置，可根据自己UI修改

    /*********基本配置 可根据自身UI风格适当修改**********/
    /** 属性赋值配置不可删除 删除之后可能因为取不到值就蹦了 */
    - (void)defaultValueMethod
    {
        //自身背景色
        self.backgroundColor = [UIColor whiteColor];

        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;

        //自身弹出alertView的宽度 屏幕宽*（0.5~0.9之间最佳）
        viewWith = [UIScreen mainScreen].bounds.size.width*0.8;

        //title距离顶部的距离 可适当修改
        viewTop = 30;

        //副标题或描述距离左右的距离 可适当修改
        viewLeftRight = 20;

        //副标题或描述的字体大小
        messageLabelFont = 16;

        //副标题或描述多行情况下上下两行间的行距 可适当修改
        messageLineSpace = 4;

        //副标题或描述与横线之间的距离 大于0 适当调
        msgAndLineViewSpace = 20;

        //titleLabel最顶上大标题占的高度 可适当修改
        titleHeight = 22;

        //底部按钮item占的高度 可适当修改
        btnHeight = 50;

        //自身背景灰色的alpha 0~1 可适当修改 越大越灰
        bgViewAlpha = 0.8;

    }


