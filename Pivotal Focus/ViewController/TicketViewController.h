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
}
@property (strong) NSArray *projects;
@property (strong) Mixer *mixer;

- (void)authenticated;
- (IBAction)info:(id)sender;
@end
