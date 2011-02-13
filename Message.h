//
//  Message.h
//  Correspondance
//
//  Created by Marco Paga on 13.02.11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Message : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSNumber * fromMe;
@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSManagedObject * topic;

@end
