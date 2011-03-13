//
//  COListController.h
//  Correspondence
//
//  Created by Robert Retzbach on 16.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXListView.h"

@interface COListController : NSArrayController<PXListViewDelegate> {

    IBOutlet PXListView	*listView;
    
}

@end
