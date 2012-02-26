//
//  TicketViewController.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "TicketViewController.h"

@implementation TicketViewController
@synthesize projects;
@dynamic mixer;

- (void)authenticated {
    [self.mixer getProjects];
}

- (void)mixer:(Mixer *)mixer returnedProjectsCollection:(ProjectCollection *)collection {
   self.projects  = collection.projects;
    [self.mixer getTicketsForProject:[self.projects objectAtIndex:0]];
}

- (IBAction)info:(id)sender {
    NSLog(@" array %@", self.projects);
}

#pragma mark Project management



#pragma mark Mixer management

- (void)setMixer:(Mixer *)mixer {
    _mixer = mixer;
    _mixer.delegate = self;
}

- (Mixer *)mixer {
    return _mixer;
}


@end
