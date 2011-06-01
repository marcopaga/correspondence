//
//  COOwner.h
//  Correspondence
//
//  Created by Marco Paga on 01.06.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol COOwner <NSObject>

- (void) registerDependentController:(id)controller;

- (void) unregisterDependentController:(id)controller;

@end
