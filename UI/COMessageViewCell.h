//
//  MessageViewCell.h
//  Correspondence
//
//  Created by Robert Retzbach on 08.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "COManagedViewCell.h"
#import "COMessage.h"
#import "COMessageController.h"
#import "PXListView.h"

@interface COMessageViewCell : COManagedViewCell {
}

- (IBAction)addReplyMessage:(id)sender;

@end
