//
//  TicketViewController.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixerDelegate_Protocols.h"

@interface TicketViewController : NSObject <MixerDelegate> {
    Mixer *_mixer;
    
    IBOutlet NSArrayController *_projectArrayController;
    IBOutlet NSArrayController *_ticketArrayController;
}

@property (strong) NSArray *projects;
@property (strong) NSArray *tickets;
@property (strong) Mixer *mixer;

- (Project *)currentProject;
- (void)authenticated;
- (IBAction)info:(id)sender;
@end
