//
//  TCSegmentedView.h
//  TCSegmentedView
//
//  Created by Sam on 9/6/17.
//  Copyright © 2017 Sam. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TCSegmentedView;
@protocol TCSegmentedViewDelegate <NSObject>

-(void)onChangeItemAtIdex:(TCSegmentedView*)view index:(NSUInteger)index;

@end
@interface TCSegmentedView : UIView

+(instancetype)segmentedWithActiveItems:(NSArray *)activeItems normalItems:(NSArray*)normalItems frame:(CGRect)frame;

@property(nonatomic, weak) id<TCSegmentedViewDelegate> delegate;

- (void)setNormalColor:(UIColor *)color font:(UIFont *)font;
- (void)setSelectedColor:(UIColor *)color font:(UIFont *)font;
- (void)setCurrentIndex:(NSInteger)currentIndex;

@property(nonatomic, assign) CGFloat magirn;
@property(nonatomic, strong) UIColor *backgroundNormalColor;
@property(nonatomic, strong) UIColor *backgroundActiveColor;
@property(nonatomic, strong) UIColor *dashLineColor;

@end

