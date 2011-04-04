//
//  MessageViewCell.h
//  PXListView
//
//  Created by Alex Rozanski on 29/05/2010.
//  Copyright 2010 Alex Rozanski. http://perspx.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "PXListViewCell.h"

@interface TopicViewCell : PXListViewCell
{
	NSTextField *titleLabel;
    NSObjectController *topicController;
}

@property (nonatomic, retain) IBOutlet NSTextField *titleLabel;
@property (nonatomic, retain) IBOutlet NSObjectController *topicController;

@end
