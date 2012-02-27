//
//  TicketViewController.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ObserverBlockConstants.h"
#import "TicketViewController.h"
#import "PivotalTrackerMixer.h"

@implementation TicketViewController
@synthesize projects, tickets;
@dynamic mixer;

- (void)authenticated {    
    if (![[Project allObjects] count]) {
        [self.mixer getProjects];
    }else{
        self.projects  = [Project allObjects];
        NSLog(@"%@ ", self.projects);
    }
    
    [_projectArrayController addObserverForKeyPath:@"selectionIndex" identifier:ORProjectChangedBlock task:^(id obj, NSDictionary *change) {

        [Ticket truncateAll];
        
        NSArrayController* projectsAC = obj;
        Mixer *mixer = [PivotalTrackerMixer sharedMixer];
        [mixer getTicketsForProject:[projectsAC.selectedObjects objectAtIndex:0]];        
    }];
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
    self.projects  = [Project allObjects];
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
