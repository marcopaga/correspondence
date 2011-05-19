//
//  COListView.m
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COListView.h"


@implementation COListView

- (void)awakeFromNib {
    [_delegate addObserver:self forKeyPath:@"content" options:0 context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (object == _delegate) {
        [self reloadData];
        [_delegate removeObserver:self forKeyPath:@"content"];
    }
}

- (void)reloadData {
    [super reloadData];
    [self setSelectedRow:0];
}

@end
