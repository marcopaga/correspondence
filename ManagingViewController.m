//
//  ManagingViewController.m
//  Correspondence
//
//  Created by Robert Retzbach on 27.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "ManagingViewController.h"


@implementation ManagingViewController
@synthesize managedObjectContext;
@synthesize arrayController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    
    return self;
}

- (void)dealloc
{
    [managedObjectContext dealloc];
    [arrayController dealloc];//unsure if needed
    [super dealloc];
}

@end
