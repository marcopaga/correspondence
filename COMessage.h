//
//  Message.h
//  Correspondence
//
//  Created by Marco Paga on 13.02.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface COMessage : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSNumber * fromMe;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSManagedObject * topic;

@end
