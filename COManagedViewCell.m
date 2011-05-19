//
//  COManagedViewCell.m
//  Correspondence
//
//  Created by Robert Retzbach on 08.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//
//  Based on:
//  TitleViewCell.m
//  PXListView
//
//  Created by Alex Rozanski on 29/05/2010.
//  Copyright 2010 Alex Rozanski. http://perspx.com. All rights reserved.
//

#import "COManagedViewCell.h"


@implementation COManagedViewCell

@synthesize objectController;

- (void)drawRect:(NSRect)dirtyRect {
    if ([self isSelected]) {
        [[NSColor selectedControlColor] set];
    }
    else {
        [[NSColor whiteColor] set];
    }

    // Draw the border and background
    NSBezierPath *roundedRect = [NSBezierPath bezierPathWithRoundedRect:[self bounds] xRadius:6.0 yRadius:6.0];
    [roundedRect fill];
}

@end
