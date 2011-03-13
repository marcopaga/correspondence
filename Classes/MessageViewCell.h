//
//  MessageViewCell.h
//  PXListView
//
//  Created by Alex Rozanski on 29/05/2010.
//  Copyright 2010 Alex Rozanski. http://perspx.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>

#import "PXListViewCell.h"
#import "COMessage.h"

@interface MessageViewCell : PXListViewCell
{
	NSTextField *titleLabel;
    NSImageView *directionImage;
    NSButton *fromMeBox;
    NSObjectController *messageController;
}

@property (nonatomic, retain) IBOutlet NSTextField *titleLabel;
@property (nonatomic, retain) IBOutlet NSImageView *directionImage;
@property (nonatomic, retain) IBOutlet NSButton *fromMeBox;
@property (nonatomic, retain) IBOutlet NSObjectController *messageController;

@end
