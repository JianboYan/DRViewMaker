//
//  DRViewMaker.m
//  LLDBDemo
//
//  Created by Ryan on 05/03/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//

#import "DRViewMaker.h"


@implementation UIView (maker)

+ (DRViewMaker *)maker
{
    return [DRViewMaker new];
}

@end

@implementation UILabel (maker)

+ (DRLabelMaker *)maker
{
    return [DRLabelMaker new];
}

@end

@implementation UIImageView (maker)

+ (DRImageViewMaker *)maker
{
    return [DRImageViewMaker new];
}

@end

@implementation UIButton (maker)

+ (DRButtonMaker *)maker
{
    return [DRButtonMaker new];
}

@end

@implementation UITableView (maker)

+ (DRTableMaker *)maker
{
    return [DRTableMaker new];
}

@end

@interface DRViewMaker()
@end

@implementation DRViewMaker
@synthesize view = _view;
@dynamic frame;
@dynamic contentMode;
@dynamic backgroundColor;
@dynamic addTo;

- (instancetype)init
{
    if (self = [super init]){
        _view = [UIView new];
    }
    
    return self;
}

-(DRAddToBlock)addTo
{
    __weak __typeof(self) wself = self;

    return ^(UIView *view){
        __strong __typeof(wself) sself = wself;
        [view addSubview: sself.view];
        return sself.view;
    };
}
- (DRContentModeBlock)contentMode
{
    __weak __typeof(self) wself = self;

    return ^(UIViewContentMode mode){
        __strong __typeof(wself) sself = wself;
        sself.view.contentMode = mode;
        return sself;
    };

}

-(DRBackgroundColorBlock) backgroundColor{
    __weak __typeof(self) wself = self;
    return ^(UIColor *color){
        __strong __typeof(wself) sself = wself;
        sself.view.backgroundColor = color;
        return sself;
    };
}

- (DRFrameBlock)frame{
    __weak __typeof(self) wself = self;
    return ^(CGRect rect){
        __strong __typeof(wself) sself = wself;
        sself.view.frame = rect;
        return sself;
    };
}
@end

@interface DRLabelMaker()
@property (nonatomic, strong) UILabel *view;
@end

@implementation DRLabelMaker
@dynamic view;
@dynamic frame;
@dynamic backgroundColor;
@dynamic text;
@dynamic textAlign;
@dynamic textColor;
@dynamic font;
@dynamic attributedText;
@dynamic lineBreakMode;
@dynamic numberOfLines;


 -(DRTextBlock)text
{
    __weak __typeof(self) wself = self;
    return ^(NSString *text){
        __strong __typeof(wself) sself = wself;
        sself.view.text = text;
        return sself;
    };
}

- (DRTextColorBlock)textColor
{
    __weak __typeof(self) wself = self;
    
    return ^(UIColor *color){
        __strong __typeof(wself) sself = wself;
        sself.view.textColor = color;
        return sself;
    };
}

- (DRTextAlignBlock)textAlign{
    __weak __typeof(self) wself = self;

    return ^(NSTextAlignment align){
        __strong __typeof(wself) sself = wself;
        sself.view.textAlignment = align;
        return sself;
    };
}

-(DRFontBlock)font
{
    __weak __typeof(self) wself = self;
    
    return ^(UIFont *font){
        __strong __typeof(wself) sself = wself;
        sself.view.font = font;
        return sself;
    };
}

-(DRAttributedTextBlock)attributedText
{
    __weak __typeof(self) wself = self;
    
    return ^(NSAttributedString *aStr){
        __strong __typeof(wself) sself = wself;
        sself.view.attributedText = aStr;
        return sself;
    };
}

-(DRLineBreakModeBlock)lineBreakMode
{
    __weak __typeof(self) wself = self;
    
    return ^(NSLineBreakMode mode){
        __strong __typeof(wself) sself = wself;
        sself.view.lineBreakMode = mode;
        return sself;
    };
}

- (DRNumberOfLinesBlock)numberOfLines
{
    __weak __typeof(self) wself = self;
    
    return ^(NSInteger lines){
        __strong __typeof(wself) sself = wself;
        sself.view.numberOfLines = lines;
        return sself;
    };
}

- (instancetype)init
{
    if (self = [super init]){
        self.view = [UILabel new];
    }
    
    return self;
}
@end



@interface DRImageViewMaker()

@property (nonatomic, strong) UIImageView *view;
@end

@implementation DRImageViewMaker
@dynamic view;
@dynamic frame;
@dynamic backgroundColor;
@dynamic contentMode;
@dynamic image;
@dynamic highlightedImage;

-(DRImageBlock)image
{
    __weak __typeof(self) wself = self;
    return ^(UIImage *image){
        __strong __typeof(wself) sself = wself;
        sself.view.image = image;
        return sself;
    };
}

-(DRHighlightedImageBlock)highlightedImage
{
    __weak __typeof(self) wself = self;
    return ^(UIImage *image){
        __strong __typeof(wself) sself = wself;
        sself.view.highlightedImage = image;
        return sself;
    };
}

- (instancetype)init
{
    if (self = [super init]){
        self.view = [UIImageView new];
    }
    
    return self;
}
@end

#pragma mark - Button

@interface DRButtonMaker()

@property (nonatomic, strong) UIButton *view;
@end

@implementation DRButtonMaker
@dynamic view;
@dynamic frame;
@dynamic backgroundColor;
@dynamic title;
@dynamic titleEdge;
@dynamic titleFont;
@dynamic titleStatePair;
@dynamic image;
@dynamic imageEdge;
@dynamic imageStatePair;

- (DRTitleBlock)title
{
    __weak __typeof(self) wself = self;
    
    return ^(NSString *title, UIControlState state){
        __strong __typeof(wself) sself = wself;
        [sself.view setTitle:title forState:state];
        return sself;
    };
}
- (DRButtonImageBlock)image
{
    __weak __typeof(self) wself = self;
    
    return ^(UIImage *image, UIControlState state){
        __strong __typeof(wself) sself = wself;
        if (CGRectEqualToRect(sself.view.imageView.frame, CGRectZero)){
            sself.view.imageView.frame = sself.view.bounds;
        }
        [sself.view setImage:image forState:state];
        return sself;
    };
}

-(DRTitleEdgeInsetsBlock)titleEdge
{
    __weak __typeof(self) wself = self;
    
    return ^(UIEdgeInsets edge){
        __strong __typeof(wself) sself = wself;
        sself.view.titleEdgeInsets = edge;
        return sself;
    };
}

-(DRImageEdgeInsetsBlock)imageEdge
{
    __weak __typeof(self) wself = self;
    
    return ^(UIEdgeInsets edge){
        __strong __typeof(wself) sself = wself;
        sself.view.imageEdgeInsets = edge;
        return sself;
    };
}

-(DRTitleFontBlock)titleFont{
    __weak __typeof(self) wself = self;
    
    return ^(UIFont *font){
        __strong __typeof(wself) sself = wself;
        sself.view.titleLabel.font = font;
        return sself;
    };
}

- (DRTitleStatePairBlock)titleStatePair
{
    __weak __typeof(self) wself = self;
    
    return ^(NSArray *pair){
        
        __strong __typeof(wself) sself = wself;
        
        __block NSString *nextTitle;
        __block UIControlState nextState = 0;
        
        [pair enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx & 0x01){
                nextState = [obj integerValue];
                [sself.view setTitle:nextTitle forState:nextState];
            }else{
                nextTitle = obj;
            }
        }];
        
        
        return sself;
    };
}

- (DRImageStatePairBlock)imageStatePair
{
    __weak __typeof(self) wself = self;
    
    return ^(NSArray *pair){
        __strong __typeof(wself) sself = wself;
        __block NSString *nextImage;
        __block UIControlState nextState = 0;
        
        [pair enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (idx & 0x01){
                nextState = [obj integerValue];
                [sself.view setTitle:nextImage forState:nextState];
            }else{
                nextImage = obj;
            }
        }];
        return sself;
    };
}


- (instancetype)init
{
    if (self = [super init]){
        self.view = [UIButton buttonWithType:UIButtonTypeSystem];
    }
    
    return self;
}
@end


#pragma mark - TableView

@interface DRTableMaker()

@property (nonatomic, strong) UITableView *view;
@end

@implementation DRTableMaker
@dynamic view;
@dynamic frame;
@dynamic backgroundColor;
@dynamic dataSource;
@dynamic delegate;
@dynamic dataSourceDelegate;
@dynamic tableFooterView;
@dynamic tableHeaderView;
@dynamic separatorStyle;
@dynamic separatorInset;
@dynamic separatorColor;

- (DRTableDataSourceBlock)dataSource
{
    __weak __typeof(self) wself = self;
    
    return ^(id<UITableViewDataSource> d){
        __strong __typeof(wself) sself = wself;
        sself.view.dataSource = d;
        return sself;
    };
}

- (DRTableDelegateBlock)delegate
{
    __weak __typeof(self) wself = self;
    
    return ^(id<UITableViewDelegate>d){
        __strong __typeof(wself) sself = wself;
        
        sself.view.delegate = d;
        return sself;
    };
}
- (DRTableDataSourceDelegateBlock)dataSourceDelegate
{
    __weak __typeof(self) wself = self;
    
    return ^(id<UITableViewDataSource, UITableViewDelegate> d){
        __strong __typeof(wself) sself = wself;
        sself.view.dataSource = d;
        sself.view.delegate   = d;
        return sself;
    };
}
-(DRTableHeaderBlock)tableHeaderView
{
    __weak __typeof(self) wself = self;
    
    return ^(UIView *view){
        __strong __typeof(wself) sself = wself;
        sself.view.tableHeaderView = view;
        return sself;
    };
}

-(DRTableFooterBlock)tableFooterView
{
    __weak __typeof(self) wself = self;
    
    return ^(UIView *view){
        __strong __typeof(wself) sself = wself;
        sself.view.tableFooterView = view;
        return sself;
    };
}

-(DRTableSeparatorColorBlock)separatorColor
{
    __weak __typeof(self) wself = self;
    
    return ^(UIColor *color){
        
        __strong __typeof(wself) sself = wself;
        
        sself.view.separatorColor = color;
        
        return sself;
    };
}

- (DRTableSeparatorInsetBlock)separatorInset
{
    __weak __typeof(self) wself = self;
    
    return ^(UIEdgeInsets inset){
        __strong __typeof(wself) sself = wself;
        
        sself.view.separatorInset = inset;
        
        return sself;
    };
}

- (DRTableSeparatorStyleBlock)separatorStyle
{
    __weak __typeof(self) wself = self;
    
    return ^(UITableViewCellSeparatorStyle style){
        __strong __typeof(wself) sself = wself;
        
        sself.view.separatorStyle = style;
        
        return sself;
    };
}


- (instancetype)init
{
    if (self = [super init]){
        self.view = [UITableView new];
    }
    
    return self;
}
@end
