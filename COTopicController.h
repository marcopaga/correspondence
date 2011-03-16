//
//  COTopicController.h
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXListView.h"
#import "TopicViewCell.h"

@interface COTopicController : NSArrayController<PXListViewDelegate> {

    IBOutlet PXListView	*listView;
    IBOutlet PXListView	*childView;
    
}

@end
