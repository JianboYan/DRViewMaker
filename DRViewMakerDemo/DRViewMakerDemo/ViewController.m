//
//  ViewController.m
//  DRViewMakerDemo
//
//  Created by Ryan on 06/03/2017.
//  Copyright © 2017 Ryan. All rights reserved.
//

#import "ViewController.h"
#import "DRViewMaker.h"
#import "UIView+Maker.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    ///////  Maker /////////
    UIView *makerView =  UIView.maker.backgroundColor(UIColor.grayColor).frame(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height/2)).addTo(self.view);
    UILabel.maker.backgroundColor(UIColor.greenColor).text(@"hello maker chaining call, you can use this way to set view property easily, but the method is begin wirh uppcase, what do you think?").textAlign(NSTextAlignmentRight).lineBreakMode(NSLineBreakByClipping).frame(CGRectMake(0, 100, 300, 80)).numberOfLines(3).lineBreakMode(NSLineBreakByClipping).addTo(makerView);
    
    UIImageView.maker.image([UIImage imageNamed:@"zhiku"]).frame(CGRectMake(0, 200, 50, 50)).contentMode(UIViewContentModeScaleAspectFit).addTo(makerView);
    UIButton.maker.frame(CGRectMake(100, 200, 50, 30)).titleFont([UIFont systemFontOfSize:13]).titleStatePair(@[@"Click", @(UIControlStateNormal), @"Release", @(UIControlStateHighlighted)]).addTo(makerView);
    
    ///////  View /////////
    UIView *view = UIView.new.Frame(CGRectMake(0, makerView.frame.size.height, makerView.frame.size.width, makerView.frame.size.height)).BackgroundColor(UIColor.greenColor).AddTo(self.view);
    UILabel.new.Frame(CGRectMake(100, 0, 300, 90)).Text(@"hello view chaining call, you can use this way to set view property easily, but the method is begin wirh uppcase, what do you think?").NumberOfLines(0).TextAlign(NSTextAlignmentRight).TextColor(UIColor.blueColor).AddTo(view);
    UIImageView.new.Image([UIImage imageNamed:@"zhiku"]).ContentMode(UIViewContentModeScaleAspectFill).Frame(CGRectMake(200, 100, 100, 100)).AddTo(view);
    UIButton.new.Frame(CGRectMake(100, 200, 50, 30)).TitleFont([UIFont systemFontOfSize:13]).TitleStatePair(@[@"Click", @(UIControlStateNormal), @"Release", @(UIControlStateHighlighted)]).AddTo(view);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
