//
//  PeopleViewController.m
//  Correspondence
//
//  Created by Robert Retzbach on 28.02.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PeopleViewController.h"


@implementation PeopleViewController : ManagingViewController

- (id)init
{
    if (![super initWithNibName:@"PeopleView" bundle:nil]) {
        return nil;
    }
    if (self) {
        // Initialization code here.
        [self setTitle:@"People"];
    }
    
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

@end
