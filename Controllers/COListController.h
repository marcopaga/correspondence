//
//  COListController.h
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXListView.h"
#import "COManagedViewCell.h"

/**
 *  This NSArrayController controls a list of list view entries for a single PXListView.
 *  Each list view entry is represented by a xib refrenced by nibName.
 */

@interface COListController : NSArrayController <PXListViewDelegate> {

    IBOutlet PXListView *listView;
    NSString *nibName;

}

@property(nonatomic, retain) NSString *nibName;
- (NSSortDescriptor *)getDefaultSortDescriptor;

@end
