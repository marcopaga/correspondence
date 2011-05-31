//
//  COTopic.m
//  Correspondence
//
//  Created by Marco Paga on 31.05.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "COTopic.h"
#import "COMessage.h"
#import "COReceiver.h"


@implementation COTopic
@dynamic lastModified;
@dynamic name;
@dynamic person;
@dynamic tags;
@dynamic messages;
@dynamic context;


- (void)addMessagesObject:(COMessage *)value {    
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"messages" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"messages"] addObject:value];
    [self didChangeValueForKey:@"messages" withSetMutation:NSKeyValueUnionSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)removeMessagesObject:(COMessage *)value {
    NSSet *changedObjects = [[NSSet alloc] initWithObjects:&value count:1];
    [self willChangeValueForKey:@"messages" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [[self primitiveValueForKey:@"messages"] removeObject:value];
    [self didChangeValueForKey:@"messages" withSetMutation:NSKeyValueMinusSetMutation usingObjects:changedObjects];
    [changedObjects release];
}

- (void)addMessages:(NSSet *)value {    
    [self willChangeValueForKey:@"messages" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"messages"] unionSet:value];
    [self didChangeValueForKey:@"messages" withSetMutation:NSKeyValueUnionSetMutation usingObjects:value];
}

- (void)removeMessages:(NSSet *)value {
    [self willChangeValueForKey:@"messages" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
    [[self primitiveValueForKey:@"messages"] minusSet:value];
    [self didChangeValueForKey:@"messages" withSetMutation:NSKeyValueMinusSetMutation usingObjects:value];
}



@end
