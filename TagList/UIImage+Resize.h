//
//  UIImage+Resize.h
//  TagList
//
//  Created by Chen on 15/10/19.
//  Copyright © 2015年 Weidong Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Resize)

/**
 *  拉伸一张图片，默认从左边0.5，顶部0.5的位置开始拉伸
 *
 *  @param name 需要拉伸的图片名
 */
+ (UIImage *)resizedImageWithName:(NSString *)name;

/**
 *  拉伸一张图片
 *
 *  @param name 需要拉伸的图片名
 *  @param left 从左边某个位置拉伸
 *  @param top  从顶部某个位置拉伸
 */
+ (UIImage *)resizedImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
