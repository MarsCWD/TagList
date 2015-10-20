//
//  WDTagListView.h
//  TagList
//
//  Created by Chen on 15/10/19.
//  Copyright © 2015年 Weidong Chen. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^tagClickBlock)(NSUInteger tag);

@interface WDTagListView : UIView

/**
 *  tag整体距离顶部的间距,默认为20px
 */
@property (nonatomic, assign) CGFloat tagPadding;

/**
 *  tag整体距离左边的间距,默认为20px
 */
@property (nonatomic, assign) CGFloat tagMargin;

/**
 *  相邻行间距,默认为10px
 */
@property (nonatomic, assign) CGFloat lineSpace;

/**
 *  左右相邻tag之间的间距,默认为10px
 */
@property (nonatomic, assign) CGFloat tagSpace;

/**
 *  tag的高度,默认为40px
 */
@property (nonatomic, assign) CGFloat tagHeight;

/**
 *  tag文字左端距离边框左端的间距,默认为10px
 */
@property (nonatomic, assign) CGFloat leftPadding;

/**
 *  tag字体大小,默认为普通字体,字号16
 */
@property (nonatomic, strong) UIFont *tagFont;

/**
 *  tag字体颜色,默认为black
 */
@property (nonatomic, strong) UIColor *tagColor;

/**
 *  tag为normal状态下的背景图名称
 */
@property (nonatomic, copy) NSString *normalImageName;

/**
 *  tag被选中状态下的背景图名称
 */
@property (nonatomic, copy) NSString *selectImageName;


/**
 *  布局tagList
 *
 *  @param tagArray 存储tagName的数组
 *  @param tagClick 点击tag的回调
 */
- (void)viewWithListArray:(NSArray *)tagArray tagClick:(tagClickBlock)tagClick;

@end
