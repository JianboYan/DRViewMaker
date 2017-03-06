//
//  UIView+Maker.m
//  LLDBDemo
//
//  Created by Ryan on 05/03/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//

#import "UIView+Maker.h"

@implementation UIView (Maker)
@dynamic Frame;
@dynamic ContentMode;
@dynamic BackgroundColor;
@dynamic AddTo;

- (DRVFrameBlock)Frame
{
    return ^(CGRect rect){
        self.frame = rect;
        return self;
    };
}

- (DRVContentModeBlock)ContentMode
{
    return ^(UIViewContentMode mode){
        self.contentMode = mode;
        return self;
    };
}

- (DRVBackgroundColorBlock)BackgroundColor
{
    return ^(UIColor *color){
        self.backgroundColor = color;
        return self;
    };
}

- (DRVAddToBlock)AddTo
{
    return ^(UIView *view){
        [view addSubview:self];
        return self;
    };
}
@end


@implementation UILabel (Maker)

@dynamic Text;
@dynamic TextAlign;
@dynamic TextColor;
@dynamic AttributedText;
@dynamic Font;
@dynamic LineBreakMode;
@dynamic NumberOfLines;

- (DRVLabelTextBlock)Text
{
    return ^(NSString *text){
        self.text = text;
        return self;
    };
}
- (DRVLabelTextColorBlock)TextColor
{
    return ^(UIColor *color){
        self.textColor = color;
        return self;
    };
}

- (DRVLabelTextAlignBlock)TextAlign
{
    return ^(NSTextAlignment align){
        self.textAlignment = align;
        return self;
    };
}

- (DRVLabelAttributedTextBlock)AttributedText
{
    return ^(NSAttributedString *aStr){
        self.attributedText = aStr;
        return self;
    };
}

- (DRVLabelFontBlock)Font
{
    return ^(UIFont *font){
        self.font = font;
        return self;
    };
}

- (DRVLabelLineBreakModeBlock)LineBreakMode
{
    return ^(NSLineBreakMode mode){
        self.lineBreakMode = mode;
        return self;
    };
}

- (DRVLabelNumberOfLinesBlock)NumberOfLines
{
    return ^(NSInteger lines){
        self.numberOfLines = lines;
        return self;
    };
}

@end


@implementation UIImageView (Maker)

@dynamic Image;
@dynamic HighlightedImage;

- (DRVImageBlock)Image
{
    return ^(UIImage *image){
        self.image = image;
        return self;
    };
}

- (DRVHighlightedImageBlock)HighlightedImage
{
    return ^(UIImage *image){
        self.highlightedImage = image;
        return self;
    };
}
@end

#pragma mark - Button


@implementation UIButton (Maker)
@dynamic Title;
@dynamic TitleEdge;
@dynamic TitleFont;
@dynamic TitleStatePair;
@dynamic Image;
@dynamic ImageEdge;
@dynamic ImageStatePair;

- (DRVTitleBlock)Title
{
    return ^(NSString *title, UIControlState state){
        [self setTitle:title forState:state];
        return self;
    };
}

- (DRVButtonImageBlock)Image
{
    return ^(UIImage *image, UIControlState state){
        [self setImage:image forState:state];
        return self;
    };
}

- (DRVTitleEdgeInsetsBlock)TitleEdge
{
    return ^(UIEdgeInsets edge){
        self.titleEdgeInsets = edge;
        return self;
    };
}
- (DRVImageEdgeInsetsBlock)ImageEdge
{
    return ^(UIEdgeInsets edge){
        self.imageEdgeInsets = edge;
        return self;
    };
}
- (DRVTitleFontBlock)TitleFont
{
    return ^(UIFont *font){
        self.titleLabel.font = font;
        return self;
    };
}
- (DRVTitleStatePairBlock)TitleStatePair
{
    return ^(NSArray *pair){

        __block NSString *nextTitle;
        __block UIControlState nextState = 0;
        
        [pair enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx & 0x01){
                nextState = [obj integerValue];
                [self setTitle:nextTitle forState:nextState];
            }else{
                nextTitle = obj;
            }
        }];
        
        return self;
    };

}

- (DRVTitleStatePairBlock)ImageStatePair
{
    return ^(NSArray *pair){
        
        __block NSString *nextImage;
        __block UIControlState nextState = 0;
        
        [pair enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx & 0x01){
                nextState = [obj integerValue];
                [self setTitle:nextImage forState:nextState];
            }else{
                nextImage = obj;
            }
        }];
        return self;
    };

}

@end

@implementation UITableView (Maker)

@dynamic DataSource;
@dynamic Delegate;
@dynamic DataSourceDelegate;
@dynamic TableFooterView;
@dynamic TableHeaderView;
@dynamic SeparatorStyle;
@dynamic SeparatorInset;
@dynamic SeparatorColor;


- (DRVTableDataSourceBlock)DataSource
{
    return ^(id<UITableViewDataSource> d){
        self.dataSource = d;
        return self;
    };
}

- (DRVTableDelegateBlock)Delegate
{
    return ^(id<UITableViewDelegate> d){
        self.delegate = d;
        return self;
    };
}

-(DRVTableDataSourceDelegateBlock)DataSourceDelegate
{
    return ^(id<UITableViewDataSource, UITableViewDelegate> d){
        self.dataSource = d;
        self.delegate = d;
        return self;
    };
}

- (DRVTableHeaderBlock)TableHeaderView
{
    return ^(UIView *view){
        self.tableHeaderView = view;
        return self;
    };
}

- (DRVTableFooterBlock)TableFooterView
{
    return ^(UIView *view){
        self.tableFooterView = view;
        return self;
    };
}

- (DRVTableSeparatorColorBlock)SeparatorColor
{
    return ^(UIColor *color){
        self.separatorColor = color;
        return self;
    };
}

- (DRVTableSeparatorInsetBlock)SeparatorInset
{
    return ^(UIEdgeInsets inset){
        self.separatorInset = inset;
        return self;
    };
}

- (DRVTableSeparatorStyleBlock)SeparatorStyle
{
    return ^(UITableViewCellSeparatorStyle style){
        self.separatorStyle = style;
        return self;
    };
}

@end
