//
//  COMessageController.h
//  Correspondence
//
//  Created by Robert Retzbach on 14.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "COListController.h"
#import "COMessageViewCell.h"
#import "COMessage.h"


@interface COMessageController : COListController {

}

- (void)addReplyToMessage:(COMessage *)message;

@end
