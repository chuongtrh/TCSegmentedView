//
//  ViewController.m
//  TCSegmentedView
//
//  Created by Sam on 9/6/17.
//  Copyright © 2017 Sam. All rights reserved.
//

#import "ViewController.h"
#import "TCSegmentedView.h"

#define AS_FONT_SF_TEXT_REGULAR(s)  [UIFont fontWithName:@"HelveticaNeue-Regular" size:s]
#define AS_FONT_SF_TEXT_MEDIUM(s)   [UIFont fontWithName:@"HelveticaNeue-Medium" size:s]
#define AS_FONT_SF_TEXT_BOLD(s)     [UIFont fontWithName:@"HelveticaNeue-Bold" size:s]


@interface ViewController ()<TCSegmentedViewDelegate>

@property(nonatomic, strong) TCSegmentedView *segmentedView1;
@property(nonatomic, strong) TCSegmentedView *segmentedView2;
@property(nonatomic, strong) TCSegmentedView *segmentedView3;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.segmentedView1];
    [self.view addSubview:self.segmentedView2];
    [self.view addSubview:self.segmentedView3];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helper
-(TCSegmentedView *)segmentedView1
{
    if (!_segmentedView1) {
        _segmentedView1 = [TCSegmentedView segmentedWithActiveItems:@[@"01. Segment 1",@"02. Segment 2", @"03. Segment 3", @"04. Segment 4"] normalItems:@[@"01",@"02",@"03", @"04"] frame:CGRectMake(16, 60, self.view.frame.size.width - 32, 30)];
        [_segmentedView1 setBackgroundColor:[UIColor clearColor]];
        [_segmentedView1 setNormalColor:[UIColor whiteColor] font:AS_FONT_SF_TEXT_MEDIUM(14)];
        [_segmentedView1 setSelectedColor:[UIColor whiteColor] font:AS_FONT_SF_TEXT_MEDIUM(14)];
        
        _segmentedView1.delegate = self;
    }
    return _segmentedView1;
}

-(TCSegmentedView *)segmentedView2
{
    if (!_segmentedView2) {
        _segmentedView2 = [TCSegmentedView segmentedWithActiveItems:@[@"01. Address",@"02. Basic Info", @"03. Photos"] normalItems:@[@"1",@"2",@"3"] frame:CGRectMake((self.view.frame.size.width - 240)/2, 160, 240, 30)];
        [_segmentedView2 setBackgroundColor:[UIColor clearColor]];
        [_segmentedView2 setNormalColor:[UIColor whiteColor] font:AS_FONT_SF_TEXT_REGULAR(12)];
        [_segmentedView2 setSelectedColor:[UIColor whiteColor] font:AS_FONT_SF_TEXT_BOLD(14)];
        _segmentedView2.backgroundNormalColor = [UIColor brownColor];
        _segmentedView2.backgroundActiveColor = [UIColor redColor];
        _segmentedView2.dashLineColor = [UIColor blueColor];
        
        _segmentedView2.delegate = self;
    }
    return _segmentedView2;
}

-(TCSegmentedView *)segmentedView3
{
    if (!_segmentedView3) {
        _segmentedView3 = [TCSegmentedView segmentedWithActiveItems:@[@"Step 01",@"Step 02", @"Step 03"] normalItems:@[@"😀",@"😂😂",@"😍😍😍"] frame:CGRectMake((self.view.frame.size.width - 240)/2, 260, 240, 36)];
        [_segmentedView3 setBackgroundColor:[UIColor clearColor]];
        [_segmentedView3 setNormalColor:[UIColor blackColor] font:AS_FONT_SF_TEXT_MEDIUM(12)];
        [_segmentedView3 setSelectedColor:[UIColor whiteColor] font:AS_FONT_SF_TEXT_BOLD(14)];
        _segmentedView3.backgroundNormalColor = [UIColor lightGrayColor];
        _segmentedView3.backgroundActiveColor = [UIColor blueColor];
        _segmentedView3.dashLineColor = [UIColor blackColor];
        _segmentedView3.magirn = 8;
        _segmentedView3.delegate = self;
    }
    return _segmentedView3;
}

#pragma mark - TCSegmentedViewDelegate
-(void)onChangeItemAtIdex:(TCSegmentedView*)view index:(NSUInteger)index
{
    NSLog(@"Current index:%tu",index);
}


@end
