//
//  ORAppDelegate.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "AuthViewController.h"
#import "TicketViewController.h"

@interface ORAppDelegate : NSObject <NSApplicationDelegate, AuthDelegate> {
    AuthViewController *authVC;
    Mixer *mixer;
}

@property (weak) IBOutlet TicketViewController *ticketVC;
@property (unsafe_unretained) IBOutlet NSWindow *window;

@end
