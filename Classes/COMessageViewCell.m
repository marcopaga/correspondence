//
//  MessageViewCell.m
//  Correspondence
//
//  Created by Robert Retzbach on 08.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COMessageViewCell.h"

@implementation COMessageViewCell

- (IBAction)addReplyMessage:(id)sender
{
    COMessage *message = [objectController content];
    
    COMessageController *controller = [_listView delegate];
    [controller addReplyToMessage:message];
}

@end
