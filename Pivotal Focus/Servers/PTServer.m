//
//  PTServer.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PTServer.h"

#import "Project.h"
#import "ProjectCollection.h"

#import "Ticket.h"
#import "TicketCollection.h"

#import "Note.h"
#import "NoteCollection.h"

@implementation PTServer

- (id)init {
    self = [super initWithBaseURL:@"https://www.pivotaltracker.com/services/v3/"];

    if (self) {
        NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:ORAuthToken];
        if (token) {
            NSLog(@"token %@", token);
            [self.client setValue:token forHTTPHeaderField:@"X-TrackerToken"];
        }
        
        self.acceptMIMEType = @"application/xml";   
        
        [self.mappingProvider setMapping:[ProjectCollection objectMapping] forKeyPath:@"projects"];
        [self.mappingProvider setMapping:[Project objectMapping] forKeyPath:@"project"];
        
        [self.mappingProvider setMapping:[TicketCollection objectMapping] forKeyPath:@"stories"];
        [self.mappingProvider setMapping:[Ticket objectMapping] forKeyPath:@"story"];

    }
    return self;
}

@end
