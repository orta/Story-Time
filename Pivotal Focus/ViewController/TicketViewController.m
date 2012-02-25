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
    [mixer getProjects];
}

- (void)mixer:(Mixer *)mixer returnedProjectsCollection:(ProjectCollection *)collection {
   self.projects  = collection.projects;    
}

- (IBAction)info:(id)sender {
    NSLog(@" array %@", self.projects);
}

#pragma mark Project management


#pragma mark Mixer management

- (void)setMixer:(Mixer *)aMixer {
    mixer = aMixer;
    mixer.delegate = self;
}

- (Mixer *)mixer {
    return mixer;
}


@end
