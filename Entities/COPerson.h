//
//  Person.h
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "COReceiver.h"


@interface COPerson : COReceiver {
@private
}
@property (nonatomic, retain) NSString * email;
@property (nonatomic, retain) NSString * postalCode;
@property (nonatomic, retain) NSString * street;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * imageFilename;
@property (nonatomic, retain) NSString * phoneNumber;

@end
