//
//  TicketViewController.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "TicketViewController.h"

@implementation TicketViewController
@synthesize projects, tickets;
@dynamic mixer;

- (void)authenticated {
    [self.mixer getProjects];
}

#pragma mark helpers

- (Project *)currentProject {
   return [[_projectArrayController selectedObjects] objectAtIndex:0];
}

- (Ticket *)currentTicket {
    return [[_ticketArrayController selectedObjects] objectAtIndex:0];
}


#pragma mark Mixer Delegate Methods

- (void)mixer:(Mixer *)mixer returnedProjectsCollection:(ProjectCollection *)collection {
    NSLog(@"projects");
    self.projects  = [Project allObjects];
    [self.mixer getTicketsForProject:[self.projects objectAtIndex:0]];
}

- (void)mixer:(Mixer *)mixer returnedTicketCollection:(TicketCollection *)collection {
    self.tickets = [Ticket allObjects];
}

- (IBAction)info:(id)sender {
    NSLog(@" project %@", [Project allObjects] );
}

#pragma mark Mixer management

- (void)setMixer:(Mixer *)mixer {
    _mixer = mixer;
    _mixer.delegate = self;
}

- (Mixer *)mixer {
    return _mixer;
}


@end
