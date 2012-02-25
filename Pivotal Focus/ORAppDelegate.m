//
//  ORAppDelegate.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ORAppDelegate.h"
#import "AuthViewController.h"

@implementation ORAppDelegate

@synthesize window = _window;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    mixer = [[PivotalTrackerMixer alloc] init];
    
    
//    NSString *token = [[NSUserDefaults standardUserDefaults] stringForKey:ORAuthToken];
//    if (token) {
//    }else{
    
    authVC = [[AuthViewController alloc] init];
    authVC.mixer = mixer;
    authVC.delegate = self;
    [NSBundle loadNibNamed:@"AuthWindow" owner:authVC];
    
//    }
}

- (void)authenticated {
    authVC = nil;
    [self.window becomeMainWindow];
}

@end
