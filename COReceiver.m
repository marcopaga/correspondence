//
//  Receiver.m
//  Correspondence
//
//  Created by Marco Paga on 14.04.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "COReceiver.h"


@implementation COReceiver
@dynamic name;
@dynamic topics;

- (NSArray*) createAddressStrings
{
    return [NSArray arrayWithObject: [self valueForKey:@"name"]];
}

- (void)addTopicsObject:(NSManagedObject *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"topics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"topics"] addObject:value];
    [self didChangeValueForKey:@"topics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeTopicsObject:(NSManagedObject *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"topics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"topics"] removeObject:value];
    [self didChangeValueForKey:@"topics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addTopics:(NSSet *)value {    
    [self willChangeValueForKey:@"topics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"topics"] unionSet:value];
    [self didChangeValueForKey:@"topics" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeTopics:(NSSet *)value {
    [self willChangeValueForKey:@"topics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"topics"] minusSet:value];
    [self didChangeValueForKey:@"topics" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}


@end
