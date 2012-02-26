//
//  Comment.h
//  Pivotal Focus
//
//  Created by orta therox on 26/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ORMObject.h"


// Should be called Comment
// but Carbon has a frakin class called Comment.
// Lame.

@class Ticket;

@interface Note : ORMObject

@property (strong) NSString *authorString;
@property (strong) NSString *createdAt;
@property (strong) NSString *uid;
@property (strong) NSString *text;
@property (strong) Ticket *ticket;

@end
