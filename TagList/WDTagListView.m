//
//  WDTagListView.m
//  TagList
//
//  Created by Chen on 15/10/19.
//  Copyright © 2015年 Weidong Chen. All rights reserved.
//

#import "WDTagListView.h"
#import "UIImage+Resize.h"

#define ScreenWidth      [[UIScreen mainScreen] bounds].size.width

@interface WDTagListView ()

@property (nonatomic, copy) tagClickBlock tagClickBlock;
@property (nonatomic, assign) CGFloat previousTagRight;
@property (nonatomic, assign) CGFloat previousLineBottom;

@end

@implementation WDTagListView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initData];
    }
    return self;
}

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, ScreenWidth, 100)];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData {
    _tagPadding = 10;
    _tagMargin = 10;
    _lineSpace = 5;
    _tagSpace = 5;
    _tagHeight = 20;
    _leftPadding = 5;
    _tagFont = [UIFont systemFontOfSize:16];
    _tagColor = [UIColor blackColor];
}

- (void)viewWithListArray:(NSArray *)tagArray tagClick:(tagClickBlock)tagClick {

    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self tagListViewHeight:tagArray]);

    self.tagClickBlock = tagClick;

    _previousTagRight = _tagMargin;
    _previousLineBottom = _tagPadding;

    [tagArray enumerateObjectsUsingBlock:^(NSString *tagName, NSUInteger index, BOOL *stop) {

        CGRect tagNameRect = [tagName boundingRectWithSize:CGSizeMake(MAXFLOAT, _tagHeight)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:_tagFont}
                                                   context:nil];
        CGFloat viewWidth = self.frame.size.width;
        NSAssert(tagNameRect.size.width + _leftPadding * 2 <= viewWidth, @"不正常的tag");

        UIButton *eachTag = [[UIButton alloc] init];

        //calculate the tag frame
        CGFloat tagX = (_previousTagRight + _tagSpace + _leftPadding * 2 + tagNameRect.size.width + _tagPadding > viewWidth) ? _tagMargin : _previousTagRight;
        CGFloat tagY = (_previousTagRight + _tagSpace + _leftPadding * 2 + tagNameRect.size.width + _tagPadding > viewWidth) ? (_previousLineBottom + _lineSpace + _tagHeight) : _previousLineBottom;
        CGFloat tagWidth = tagNameRect.size.width + _leftPadding * 2;
        CGFloat tagHeight = _tagHeight;

        eachTag.frame = CGRectMake(tagX, tagY, tagWidth, tagHeight);
        [eachTag setTitle:tagName forState:UIControlStateNormal];
        [eachTag setTitleColor:_tagColor forState:UIControlStateNormal];
        if (_normalImageName) {
            [eachTag setBackgroundImage:[UIImage resizedImageWithName:_normalImageName] forState:UIControlStateNormal];
        }
        if (_selectImageName) {
            [eachTag setBackgroundImage:[UIImage resizedImageWithName:_selectImageName] forState:UIControlStateHighlighted];
        }
        [eachTag addTarget:self action:@selector(tagClick:) forControlEvents:UIControlEventTouchUpInside];
        eachTag.titleLabel.font = _tagFont;
        eachTag.layer.masksToBounds = YES;
        eachTag.tag = index;
        [self addSubview:eachTag];

        _previousLineBottom = (_previousTagRight + _tagSpace + _leftPadding * 2 + tagNameRect.size.width + _tagPadding > viewWidth) ? (_previousLineBottom + _tagHeight + _lineSpace) : _previousLineBottom;
        _previousTagRight = tagX + tagWidth + _tagSpace;

        if (!_normalImageName && !_selectImageName) {
            eachTag.backgroundColor = [UIColor cyanColor];
            eachTag.layer.cornerRadius = 8;
        }

    }];

}

- (void)tagClick:(UIButton *)sender {
    if (self.tagClickBlock) {
        self.tagClickBlock(sender.tag);
    }
}

- (CGFloat)tagListViewHeight:(NSArray *)tagNameArray {

    _previousTagRight = _tagMargin;
    _previousLineBottom = _tagPadding;

    [tagNameArray enumerateObjectsUsingBlock:^(NSString *tagName, NSUInteger index, BOOL *stop) {

        CGRect tagNameRect = [tagName boundingRectWithSize:CGSizeMake(MAXFLOAT, _tagHeight)
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:_tagFont}
                                                   context:nil];
        CGFloat viewWidth = self.frame.size.width;
        NSAssert(tagNameRect.size.width + _leftPadding * 2 <= viewWidth, @"不正常的tag");

        CGFloat tagX = (_previousTagRight + _tagSpace + _leftPadding * 2 + tagNameRect.size.width + _tagPadding > viewWidth) ? _tagMargin : _previousTagRight;
        CGFloat tagWidth = tagNameRect.size.width + _leftPadding * 2;

        _previousLineBottom = (_previousTagRight + _tagSpace + _leftPadding * 2 + tagNameRect.size.width + _tagPadding > viewWidth) ? (_previousLineBottom + _tagHeight + _lineSpace) : _previousLineBottom;
        _previousTagRight = tagX + tagWidth + _tagSpace;

    }];

    return _previousLineBottom + _tagHeight + _tagPadding;
}

@end
