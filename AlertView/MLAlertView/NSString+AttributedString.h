//
//  NSString+AttributedString.h
//  AlertView
//
//  Created by Admin on 2018/6/8.
//  Copyright © 2018年 mlb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (AttributedString)

/**
 *  设置段落样式
 *  @param lineSpeace 行距
 *  @param label      传入前先给label设置好
 *  @返回 富文本
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpeace andAlignment:(NSTextAlignment)alignment andLabel:(UILabel *)label;

/**
 *  计算富文本字体高度
 *  @param lineSpeace 行距
 *  @param label      传入前先给label设置好
 *  @param width      字体所占宽度
 *  @返回 富文本高度
 */
- (CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withLabel:(UILabel *)label andAlignment:(NSTextAlignment)alignment andWidth:(CGFloat)width;

@end
