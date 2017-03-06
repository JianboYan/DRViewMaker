//
// UIView+Maker.h
// LLDBDemo
//
// Created by Ryan on 05/03/2017.
// Copyright © 2017 Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef __kindof UIView*(^DRVFrameBlock)(CGRect rect);
typedef __kindof UIView*(^DRVBackgroundColorBlock)(UIColor *color);
typedef __kindof UIView*(^DRVContentModeBlock)(UIViewContentMode mode);
typedef __kindof UIView*(^DRVAddToBlock)(__kindof UIView *view);

@interface UIView (Maker)

@property (nonatomic, copy, readonly) DRVFrameBlock Frame;
@property (nonatomic, copy, readonly) DRVBackgroundColorBlock BackgroundColor;
@property (nonatomic, copy, readonly) DRVContentModeBlock ContentMode;
@property (nonatomic, copy, readonly) DRVAddToBlock AddTo;

@end



typedef UILabel*(^DRVLabelFrameBlock)(CGRect rect);
typedef UILabel*(^DRVLabelBackgroundColorBlock)(UIColor *color);
typedef UILabel*(^DRVLabelFontBlock)(UIFont *font);
typedef UILabel*(^DRVLabelTextBlock)(NSString *text);
typedef UILabel*(^DRVLabelTextColorBlock)(UIColor *color);
typedef UILabel*(^DRVLabelTextAlignBlock)(NSTextAlignment align);
typedef UILabel*(^DRVLabelAttributedTextBlock)(NSAttributedString *aStr);
typedef UILabel*(^DRVLabelLineBreakModeBlock)(NSLineBreakMode mode);
typedef UILabel*(^DRVLabelNumberOfLinesBlock)(NSInteger lines);


@interface UILabel (Maker)

@property (nonatomic, copy, readonly) DRVLabelFrameBlock Frame;
@property (nonatomic, copy, readonly) DRVLabelBackgroundColorBlock BackgroundColor;

@property (nonatomic, copy, readonly) DRVLabelFontBlock Font;
@property (nonatomic, copy, readonly) DRVLabelTextBlock Text;
@property (nonatomic, copy, readonly) DRVLabelTextColorBlock TextColor;
@property (nonatomic, copy, readonly) DRVLabelTextAlignBlock TextAlign;
@property (nonatomic, copy, readonly) DRVLabelAttributedTextBlock AttributedText;
@property (nonatomic, copy, readonly) DRVLabelLineBreakModeBlock LineBreakMode;
@property (nonatomic, copy, readonly) DRVLabelNumberOfLinesBlock NumberOfLines;

@end


/******** Image ********/
typedef UIImageView*(^DRVImageFrameBlock)(CGRect rect);
typedef UIImageView*(^DRVImageBackgroundColorBlock)(UIColor *color);
typedef UIImageView*(^DRVImageContentModeBlock)(UIViewContentMode mode);
typedef UIImageView*(^DRVImageBlock)(UIImage *image);
typedef UIImageView*(^DRVHighlightedImageBlock)(UIImage *image);


@interface UIImageView (Maker)

@property (nonatomic, copy, readonly) DRVImageFrameBlock Frame;
@property (nonatomic, copy, readonly) DRVImageBackgroundColorBlock BackgroundColor;
@property (nonatomic, copy, readonly) DRVImageContentModeBlock ContentMode;
@property (nonatomic, copy, readonly) DRVImageBlock Image;
@property (nonatomic, copy, readonly) DRVHighlightedImageBlock HighlightedImage;

@end

/******** Button ********/

typedef UIButton*(^DRVButtonFrameBlock)(CGRect rect);
typedef UIButton*(^DRVButtonBackgroundColorBlock)(UIColor *color);

typedef UIButton*(^DRVTitleBlock)(NSString *title, UIControlState state);
typedef UIButton*(^DRVButtonImageBlock)(UIImage *image, UIControlState state);
typedef UIButton*(^DRVTitleEdgeInsetsBlock)(UIEdgeInsets edge);
typedef UIButton*(^DRVImageEdgeInsetsBlock)(UIEdgeInsets edge);
typedef UIButton*(^DRVTitleFontBlock)(UIFont *font);
typedef UIButton*(^DRVTitleStatePairBlock)(NSArray *pair);
typedef UIButton*(^DRVImageStatePairBlock)(NSArray *pair);

@interface UIButton (Maker)
@property (nonatomic, copy, readonly) DRVButtonFrameBlock Frame;
@property (nonatomic, copy, readonly) DRVButtonBackgroundColorBlock BackgroundColor;
@property (nonatomic, copy, readonly) DRVTitleBlock Title;
@property (nonatomic, copy, readonly) DRVButtonImageBlock Image;
@property (nonatomic, copy, readonly) DRVTitleEdgeInsetsBlock TitleEdge;
@property (nonatomic, copy, readonly) DRVImageEdgeInsetsBlock ImageEdge;
@property (nonatomic, copy, readonly) DRVTitleFontBlock TitleFont;
@property (nonatomic, copy, readonly) DRVTitleStatePairBlock TitleStatePair;
@property (nonatomic, copy, readonly) DRVImageStatePairBlock ImageStatePair;

@end


typedef UITableView*(^DRVTableFrameBlock)(CGRect rect);
typedef UITableView*(^DRVTableBackgroundColorBlock)(UIColor *color);

typedef UITableView*(^DRVTableDataSourceBlock)(id<UITableViewDataSource> d);
typedef UITableView*(^DRVTableDelegateBlock)(id<UITableViewDelegate> d);
typedef UITableView*(^DRVTableDataSourceDelegateBlock)(id<UITableViewDelegate, UITableViewDataSource> d);


typedef UITableView*(^DRVTableHeaderBlock)(UIView *header);
typedef UITableView*(^DRVTableFooterBlock)(UIView *footer);

typedef UITableView*(^DRVTableSeparatorStyleBlock)(UITableViewCellSeparatorStyle style);
typedef UITableView*(^DRVTableSeparatorColorBlock)(UIColor *color);
typedef UITableView*(^DRVTableSeparatorInsetBlock)(UIEdgeInsets edge);



@interface UITableView (Maker)

@property (nonatomic, copy, readonly) DRVTableFrameBlock Frame;
@property (nonatomic, copy, readonly) DRVTableBackgroundColorBlock BackgroundColor;

@property (nonatomic, copy, readonly) DRVTableDataSourceBlock DataSource;
@property (nonatomic, copy, readonly) DRVTableDelegateBlock Delegate;
@property (nonatomic, copy, readonly) DRVTableDataSourceDelegateBlock DataSourceDelegate;

@property (nonatomic, copy, readonly) DRVTableHeaderBlock TableHeaderView;
@property (nonatomic, copy, readonly) DRVTableFooterBlock TableFooterView;

@property (nonatomic, copy, readonly) DRVTableSeparatorStyleBlock SeparatorStyle;
@property (nonatomic, copy, readonly) DRVTableSeparatorColorBlock SeparatorColor;
@property (nonatomic, copy, readonly) DRVTableSeparatorInsetBlock SeparatorInset;

@end



