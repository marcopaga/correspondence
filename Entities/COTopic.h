//
//  COTopic.h
//  Correspondence
//
//  Created by Marco Paga on 31.05.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class COMessage, COReceiver;

@interface COTopic : NSManagedObject {
@private
}
@property (nonatomic, retain) NSDate * lastModified;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) COReceiver * person;
@property (nonatomic, retain) NSManagedObject * tags;
@property (nonatomic, retain) NSSet* messages;
@property (nonatomic, retain) NSManagedObject * context;

@end
