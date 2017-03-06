//
//  DRViewMaker.h
//  LLDBDemo
//
//  Created by Ryan on 05/03/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//


@import UIKit;

@class DRViewMaker;
@class DRLabelMaker;
@class DRImageViewMaker;
@class DRButtonMaker;
@class DRTableMaker;

//////////// Tool /////////////
@interface UIView (maker)
+ (DRViewMaker *)maker;
- (DRViewMaker *)maker;
@end

@interface UILabel (maker)
+ (DRLabelMaker *)maker;
- (DRLabelMaker *)maker;
@end

@interface UIImageView (maker)
+ (DRImageViewMaker *)maker;
- (DRImageViewMaker *)maker;
@end

@interface UIButton (maker)
+ (DRButtonMaker *)maker;
- (DRButtonMaker *)maker;
@end

@interface UITableView (maker)
+ (DRTableMaker *)maker;
- (DRTableMaker *)maker;
@end

/******** View ********/

typedef __kindof DRViewMaker*(^DRFrameBlock)(CGRect rect);
typedef __kindof DRViewMaker*(^DRBackgroundColorBlock)(UIColor *color);
typedef __kindof DRViewMaker*(^DRContentModeBlock)(UIViewContentMode mode);
typedef __kindof UIView *(^DRAddToBlock)(__kindof UIView *view);  // addTo 是终结

@protocol DRBasicProperyProtocol <NSObject>
@property (nonatomic, strong, readonly) UIView *view;
@property (nonatomic, copy,   readonly) DRFrameBlock frame;
@property (nonatomic, copy,   readonly) DRBackgroundColorBlock backgroundColor;
@property (nonatomic, copy,   readonly) DRContentModeBlock contentMode;

@end


@interface DRViewMaker : NSObject <DRBasicProperyProtocol>

@property (nonatomic, copy, readonly) DRAddToBlock addTo;

@end

/******** Label ********/

typedef DRLabelMaker*(^DRLabelFrameBlock)(CGRect rect);
typedef DRLabelMaker*(^DRLabelBackgroundColorBlock)(UIColor *color);
typedef DRLabelMaker*(^DRLabelContentModeBlock)(UIViewContentMode mode);
typedef DRLabelMaker*(^DRFontBlock)(UIFont *font);
typedef DRLabelMaker*(^DRTextBlock)(NSString *text);
typedef DRLabelMaker*(^DRTextColorBlock)(UIColor *color);
typedef DRLabelMaker*(^DRTextAlignBlock)(NSTextAlignment align);
typedef DRLabelMaker*(^DRAttributedTextBlock)(NSAttributedString *aStr);
typedef DRLabelMaker*(^DRLineBreakModeBlock)(NSLineBreakMode mode);
typedef DRLabelMaker*(^DRNumberOfLinesBlock)(NSInteger lines);

@interface DRLabelMaker : DRViewMaker

@property (nonatomic, copy, readonly) DRLabelFrameBlock frame;
@property (nonatomic, copy, readonly) DRLabelBackgroundColorBlock backgroundColor;
@property (nonatomic, copy, readonly) DRFontBlock font;
@property (nonatomic, copy, readonly) DRTextBlock text;
@property (nonatomic, copy, readonly) DRTextColorBlock textColor;
@property (nonatomic, copy, readonly) DRTextAlignBlock textAlign;
@property (nonatomic, copy, readonly) DRAttributedTextBlock attributedText;
@property (nonatomic, copy, readonly) DRLineBreakModeBlock lineBreakMode;
@property (nonatomic, copy, readonly) DRNumberOfLinesBlock numberOfLines;

@end

/******** Image ********/
typedef DRImageViewMaker*(^DRImageFrameBlock)(CGRect rect);
typedef DRImageViewMaker*(^DRImageBackgroundColorBlock)(UIColor *color);
typedef DRImageViewMaker*(^DRImageContentModeBlock)(UIViewContentMode mode);
typedef DRImageViewMaker*(^DRImageBlock)(UIImage *image);
typedef DRImageViewMaker*(^DRHighlightedImageBlock)(UIImage *image);


@interface DRImageViewMaker : DRViewMaker
@property (nonatomic, copy, readonly) DRImageFrameBlock frame;
@property (nonatomic, copy, readonly) DRImageBackgroundColorBlock backgroundColor;
@property (nonatomic, copy, readonly) DRImageContentModeBlock contentMode;

@property (nonatomic, copy, readonly) DRImageBlock image;
@property (nonatomic, copy, readonly) DRHighlightedImageBlock highlightedImage;

@end

/******** Button ********/

typedef DRButtonMaker*(^DRButtonFrameBlock)(CGRect rect);
typedef DRButtonMaker*(^DRButtonBackgroundColorBlock)(UIColor *color);

typedef DRButtonMaker*(^DRTitleBlock)(NSString *title, UIControlState state);
typedef DRButtonMaker*(^DRButtonImageBlock)(UIImage *image, UIControlState state);
typedef DRButtonMaker*(^DRTitleEdgeInsetsBlock)(UIEdgeInsets edge);
typedef DRButtonMaker*(^DRImageEdgeInsetsBlock)(UIEdgeInsets edge);
typedef DRButtonMaker*(^DRTitleFontBlock)(UIFont *font);
typedef DRButtonMaker*(^DRTitleStatePairBlock)(NSArray *pair);
typedef DRButtonMaker*(^DRImageStatePairBlock)(NSArray *pair);

@interface DRButtonMaker : DRViewMaker
@property (nonatomic, copy, readonly) DRButtonFrameBlock frame;
@property (nonatomic, copy, readonly) DRButtonBackgroundColorBlock backgroundColor;
@property (nonatomic, copy, readonly) DRTitleBlock title;
@property (nonatomic, copy, readonly) DRButtonImageBlock image;
@property (nonatomic, copy, readonly) DRTitleEdgeInsetsBlock titleEdge;
@property (nonatomic, copy, readonly) DRImageEdgeInsetsBlock imageEdge;
@property (nonatomic, copy, readonly) DRTitleFontBlock titleFont;
@property (nonatomic, copy, readonly) DRTitleStatePairBlock titleStatePair;
@property (nonatomic, copy, readonly) DRImageStatePairBlock imageStatePair;

@end

/******** TableView ********/

typedef DRTableMaker*(^DRTableFrameBlock)(CGRect rect);
typedef DRTableMaker*(^DRTableBackgroundColorBlock)(UIColor *color);

typedef DRTableMaker*(^DRTableDataSourceBlock)(id<UITableViewDataSource> d);
typedef DRTableMaker*(^DRTableDelegateBlock)(id<UITableViewDelegate> d);
typedef DRTableMaker*(^DRTableDataSourceDelegateBlock)(id<UITableViewDelegate, UITableViewDataSource> d);


typedef DRTableMaker*(^DRTableHeaderBlock)(UIView *header);
typedef DRTableMaker*(^DRTableFooterBlock)(UIView *footer);

typedef DRTableMaker*(^DRTableSeparatorStyleBlock)(UITableViewCellSeparatorStyle style);
typedef DRTableMaker*(^DRTableSeparatorColorBlock)(UIColor *color);
typedef DRTableMaker*(^DRTableSeparatorInsetBlock)(UIEdgeInsets edge);

@interface DRTableMaker : DRViewMaker

@property (nonatomic, copy, readonly) DRTableFrameBlock frame;
@property (nonatomic, copy, readonly) DRTableBackgroundColorBlock backgroundColor;

@property (nonatomic, copy, readonly) DRTableDataSourceBlock dataSource;
@property (nonatomic, copy, readonly) DRTableDelegateBlock delegate;
@property (nonatomic, copy, readonly) DRTableDataSourceDelegateBlock dataSourceDelegate;

@property (nonatomic, copy, readonly) DRTableHeaderBlock tableHeaderView;
@property (nonatomic, copy, readonly) DRTableFooterBlock tableFooterView;

@property (nonatomic, copy, readonly) DRTableSeparatorStyleBlock separatorStyle;
@property (nonatomic, copy, readonly) DRTableSeparatorColorBlock separatorColor;
@property (nonatomic, copy, readonly) DRTableSeparatorInsetBlock separatorInset;

@end

