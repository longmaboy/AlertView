//
//  NSString+MString.h
//
//
//  Created by Mac on 2017/9/6.
//  Copyright © 2017年 MLB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (MString)
/**
 *  设置段落样式
 *  @param lineSpeace 行距
 *  @param label      传入前先给label设置好
 *  @返回 富文本
 */
- (NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpeace  andLabel:(UILabel *)label;

/**
 *  计算富文本字体高度
 *  @param lineSpeace 行距
 *  @param label      传入前先给label设置好
 *  @param width      字体所占宽度
 *  @返回 富文本高度
 */
- (CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withLabel:(UILabel *)label andWidth:(CGFloat)width;

@end
