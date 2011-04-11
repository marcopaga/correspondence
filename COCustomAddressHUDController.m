//
//  COCustomAddressWindowController.m
//  Correspondence
//
//  Created by Marco Paga on 20.03.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//

#import "COCustomAddressHUDController.h"


@implementation COCustomAddressHUDController

@synthesize entity;

- (id)initWith: (NSString*) objectId
{
    self = [super initWithWindowNibName: NIB_CUSTOM_ADDRESS];
    if (self) {
        entity = [self loadEntityFor: objectId];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)windowDidLoad
{
    [super windowDidLoad];
}

- (IBAction)okButton:(id)sender {
    [entity setValue:@"test" forKey:@"street"];
    [[COSharedContext sharedObjectContext] save:nil];
}

-(NSManagedObject*)loadEntityFor:(NSString *)objectId{
    /*
    NSManagedObjectContext *moc = [COSharedContext sharedObjectContext];
    
    NSFetchRequest *fetchRequest = [[[NSFetchRequest alloc] init] autorelease];
    [fetchRequest setEntity: [NSEntityDescription entityForName:ENTITY_PERSON
                                         inManagedObjectContext: moc]];
    [fetchRequest setPredicate: [NSPredicate predicateWithFormat:@"objectID = %@",objectId]];
    
    NSArray* result =  [[COSharedContext sharedObjectContext] executeFetchRequest:fetchRequest error:nil];
    assert([result count] == 1);
    return [result objectAtIndex:0];
     */
    NSLog(@"Load by id: %@", objectId);
    return [[COSharedContext sharedObjectContext] objectWithID:objectId];
}

@end
