# TCSegmentedView
Easy to create &amp; custom segmented view

![Example](https://github.com/tranchuong/TCSegmentedView/blob/master/TCSegmentedView/demo/demo.gif)

## Usage Examples
An Objective-C example project demonstrating customization options is included in the TCSegmentedView directory.

### Objective-C

```objc
// Import the class and create an TCSegmentedView instance
#import "TCSegmentedView.h"

// Add segmentedView to view

    [self.view addSubview:self.segmentedView1];
    [self.view addSubview:self.segmentedView2];
    [self.view addSubview:self.segmentedView3];

// Init segmentedView
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

```

#### License
This project is released under the Apache 2.0 License.
