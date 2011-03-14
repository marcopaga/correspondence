//
//  COMessageController.h
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXListView.h"
#import "MessageViewCell.h"


@interface COMessageController : NSArrayController<PXListViewDelegate> {
    
    // Message
    IBOutlet PXListView	*listView;
    
}

@end
