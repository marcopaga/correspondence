//
//  Receiver.h
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface COReceiver : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet* topics;

- (NSArray*) createAddressStrings;

@end
