//
//  MLAlertView.h
//  AlertView
//
//  Created by Admin on 2018/6/6.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLAlertView : UIView

- (instancetype)initWithTitle:(NSString *)title andMessage:(NSString *)message andMessageAlignment:(NSTextAlignment)textAlignment andItem:(NSArray<NSString *> *)itemArr andSelectBlock:(void(^)(NSInteger index))selectBlock;


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


@end
