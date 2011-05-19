//
//  Message.m
//  Correspondence
//
//  Created by Marco Paga on 13.02.11.
//  Copyright (c) 2011 The Correspondence Team. All rights reserved.
//

#import "COMessage.h"


@implementation COMessage
@dynamic notes;
@dynamic subjectLine;
@dynamic fromMe;
@dynamic date;
@dynamic topic;
@dynamic parent;

- (void)awakeFromInsert {
    [super awakeFromInsert];
    [self willChangeValueForKey:@"date"];
    NSDate *now = [NSDate date];
    [self setValue:now forKey:@"date"];
    [self didChangeValueForKey:@"date"];
}

#if 0
/*
 *
 * Property methods not providing customized implementations should be removed.  
 * Optimized versions will be provided dynamically by the framework at runtime.
 *
 *
*/

- (NSString *)notes {
    NSString * tmpValue;
    
    [self willAccessValueForKey:@"notes"];
    tmpValue = [self primitiveNotes];
    [self didAccessValueForKey:@"notes"];
    
    return tmpValue;
}

- (void)setNotes:(NSString *)value {
    [self willChangeValueForKey:@"notes"];
    [self setPrimitiveNotes:value];
    [self didChangeValueForKey:@"notes"];
}

- (BOOL)validateNotes:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSNumber *)fromMe {
    NSNumber * tmpValue;
    
    [self willAccessValueForKey:@"fromMe"];
    tmpValue = [self primitiveFromMe];
    [self didAccessValueForKey:@"fromMe"];
    
    return tmpValue;
}

- (void)setFromMe:(NSNumber *)value {
    [self willChangeValueForKey:@"fromMe"];
    [self setPrimitiveFromMe:value];
    [self didChangeValueForKey:@"fromMe"];
}

- (BOOL)validateFromMe:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSDate *)date {
    NSDate * tmpValue;
    
    [self willAccessValueForKey:@"date"];
    tmpValue = [self primitiveDate];
    [self didAccessValueForKey:@"date"];
    
    return tmpValue;
}

- (void)setDate:(NSDate *)value {
    [self willChangeValueForKey:@"date"];
    [self setPrimitiveDate:value];
    [self didChangeValueForKey:@"date"];
}

- (BOOL)validateDate:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSManagedObject *)topic {
    id tmpObject;
    
    [self willAccessValueForKey:@"topic"];
    tmpObject = [self primitiveTopic];
    [self didAccessValueForKey:@"topic"];
    
    return tmpObject;
}

- (void)setTopic:(NSManagedObject *)value {
    [self willChangeValueForKey:@"topic"];
    [self setPrimitiveTopic:value];
    [self didChangeValueForKey:@"topic"];
}

- (BOOL)validateTopic:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

- (NSManagedObject *)parent {
    id tmpObject;
    
    [self willAccessValueForKey:@"parent"];
    tmpObject = [self primitiveTopic];
    [self didAccessValueForKey:@"parent"];
    
    return tmpObject;
}

- (void)setParent:(NSManagedObject *)value {
    [self willChangeValueForKey:@"parent"];
    [self setPrimitiveTopic:value];
    [self didChangeValueForKey:@"parent"];
}

- (BOOL)validateParent:(id *)valueRef error:(NSError **)outError {
    // Insert custom validation logic here.
    return YES;
}

#endif

@end
