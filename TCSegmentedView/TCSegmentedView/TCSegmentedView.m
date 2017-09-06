//
//  TCSegmentedView.m
//  TCSegmentedView
//
//  Created by Sam on 9/6/17.
//  Copyright © 2017 Sam. All rights reserved.
//

#import "TCSegmentedView.h"

@interface TCSegmentedView()

@property(nonatomic, strong) NSMutableArray *buttons;

@property(nonatomic, strong) NSArray *normalItems;
@property(nonatomic, strong) NSArray *activeItems;


@property(nonatomic, strong) UIFont *normalFont;
@property(nonatomic, strong) UIFont *activeFont;

@property(nonatomic, strong) UIColor *normalColor;
@property(nonatomic, strong) UIColor *activeColor;


@property(nonatomic, assign) NSInteger currentIndex;
@property(nonatomic, strong) CAShapeLayer *dashLine;
@end

@implementation TCSegmentedView


+(instancetype)segmentedWithActiveItems:(NSArray *)activeItems normalItems:(NSArray*)normalItems frame:(CGRect)frame
{
    assert([activeItems count] == [normalItems count]);
    
    TCSegmentedView *segmented = [[TCSegmentedView alloc] initWithFrame:frame];
    segmented.normalItems = normalItems;
    segmented.activeItems = activeItems;
    [segmented setupUI];
    
    return segmented;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.normalFont = [UIFont systemFontOfSize:13];
        self.activeFont = [UIFont systemFontOfSize:13];
        self.normalColor = [UIColor blackColor];
        self.activeColor = [UIColor whiteColor];
    }
    return self;
}

-(void)didMoveToSuperview
{
    [super didMoveToSuperview];
    
    if (self.superview) {
        [self setNeedsDisplay];
    }
}
#pragma mark - Helper
-(void)setupUI
{
    //Setup default
    _magirn = 4;
    _backgroundActiveColor = [UIColor darkGrayColor];
    _backgroundNormalColor = [UIColor lightGrayColor];
    _dashLineColor = [UIColor blackColor];
    
    //Init array button
    self.buttons = [NSMutableArray new];
    CGFloat itemWith = self.frame.size.width/[self.normalItems count];
    
    for (int i = 0 ; i < [self.normalItems count]; i++) {
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(i*itemWith, 0, itemWith, self.frame.size.height)];
        [button setTitle:self.normalItems[i] forState:UIControlStateNormal];
        [button setTitle:self.activeItems[i] forState:UIControlStateSelected];
        button.layer.cornerRadius = self.frame.size.height/2;
        button.layer.masksToBounds = YES;
        [button addTarget:self action:@selector(onItemChange:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.buttons addObject:button];
        [self addSubview:button];
    }
    
    //Add dash line
    [self addDashedBorder:self.dashLineColor];
    
    [self updateUI];
}
-(void)addDashedBorder:(UIColor*)strokeColor {
    [self layoutIfNeeded];
    
    self.dashLine = [CAShapeLayer layer];
    UIBezierPath *linePath = [UIBezierPath bezierPath];
    
    [self.dashLine setStrokeColor:strokeColor.CGColor];
    [self.dashLine setLineWidth:1.0f];
    [self.dashLine setLineJoin:kCALineJoinRound];
    [self.dashLine setLineDashPattern:@[@2,@2]];
    self.dashLine.fillColor = nil;
    self.dashLine.opacity = 1.0;
    
    UIButton *firstSegment = [self.buttons firstObject];
    UIButton *lastSegment = [self.buttons lastObject];
    
    [linePath moveToPoint: firstSegment.center];
    [linePath addLineToPoint:lastSegment.center];
    
    self.dashLine.path = linePath.CGPath;
    
    [self.layer insertSublayer:self.dashLine atIndex:0];
}


-(void)updateUI
{
    UIButton *button;
    CGFloat itemWith = self.frame.size.width/[self.normalItems count];
    
    for (int i = 0; i < [self.buttons count] ; i++) {
        button = self.buttons[i];
        
        [button setSelected:i == self.currentIndex];
        [button setTitleColor:self.normalColor forState:UIControlStateNormal];
        [button setTitleColor:self.activeColor forState:UIControlStateSelected];
        [button.titleLabel setFont:button.isSelected?self.activeFont:self.normalFont];
        [button setBackgroundColor:button.isSelected?self.backgroundActiveColor:self.backgroundNormalColor];
        
        [UIView animateWithDuration:0.12*(i+1) delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            CGRect rect = button.frame;


            if (i == self.currentIndex) {

                CGSize textSize = [self.activeItems[i] sizeWithAttributes:@{NSFontAttributeName:self.activeFont}];
                
                rect.origin.x = i*itemWith;
                rect.size.width = textSize.width + self.magirn*2;
            }else{
                if (self.currentIndex < i) {
                    rect.origin.x = i*itemWith+itemWith/2;
                }else{
                    rect.origin.x = i*itemWith;
                }
                rect.size.width = itemWith/2 + self.magirn*2;
            }
            button.frame = rect;
        } completion:nil];
    }
}

#pragma mark - Properties
- (void)setNormalColor:(UIColor *)color font:(UIFont *)font {
    _normalFont = font;
    _normalColor = color;
    [self updateUI];
}

- (void)setSelectedColor:(UIColor *)color font:(UIFont *)font {
    _activeFont = font;
    _activeColor = color;
    [self updateUI];
}
-(void)setCurrentIndex:(NSInteger)currentIndex
{
    _currentIndex = currentIndex;
    [self updateUI];
}
-(void)setBackgroundActiveColor:(UIColor *)backgroundActiveColor
{
    _backgroundActiveColor = backgroundActiveColor;
    [self updateUI];
}
-(void)setBackgroundNormalColor:(UIColor *)backgroundNormalColor
{
    _backgroundNormalColor = backgroundNormalColor;
    [self updateUI];
}
-(void)setDashLineColor:(UIColor *)dashLineColor
{
    [self.dashLine setStrokeColor:dashLineColor.CGColor];
}
-(void)setMagirn:(CGFloat)magirn
{
    _magirn = magirn;
    [self updateUI];
}
#pragma mark - Actions
-(void)onItemChange:(UIButton*)button
{
    self.currentIndex = [self.buttons indexOfObject:button];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onChangeItemAtIdex:index:)]) {
        [self.delegate onChangeItemAtIdex:self index:self.currentIndex];
    }
    
}
@end
