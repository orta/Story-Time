//
//  Ticket.h
//  Tickifier
//
//  Created by orta therox on 16/09/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//



#import "ORMObject.h"

@class Project, NoteCollection;
@interface Ticket : ORMObject

@property (strong) NSString *name;
@property (strong) NSString *body;
@property (strong) NSString *tags;
@property (strong) NSString *uid;
@property (strong) NSString *url;
@property (strong) NSString *type;
@property (strong) NSString *state;
@property (strong) NSString *owner;
@property (strong) NSString *requester;
@property (strong) NSDate *createdAt;
@property (strong) Project *project;
@property (strong) NoteCollection *noteCollection;
@property (strong) NSArray *attachments;

@end
