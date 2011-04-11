//
//  COSharedContext.h
//  Correspondence
//
//  Created by Marco Paga on 06.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface COSharedContext : NSObject {
}

+(NSManagedObjectContext*)sharedObjectContext;

@end
