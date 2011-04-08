//
//  COManagedViewCell.h
//  Correspondence
//
//  Created by Robert Retzbach on 08.04.11.
//  Copyright 2011 The Correspondence Team. All rights reserved.
//
//  Based on:
//  TitleViewCell.h
//  PXListView
//
//  Created by Alex Rozanski on 29/05/2010.
//  Copyright 2010 Alex Rozanski. http://perspx.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PXListViewCell.h"

/**
 *  Representation of a single entry of a PXListView. Each list view entry uses an object
 *  controller bound to an NSManagedObject entity. All ui items are bound to the objectController in their xib file.
 */
@interface COManagedViewCell : PXListViewCell {
  NSObjectController *objectController;
}

@property (nonatomic, retain) IBOutlet NSObjectController *objectController;

@end
