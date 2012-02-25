//
//  AuthViewController.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "AuthViewController.h"

@implementation AuthViewController

@synthesize usernameTextField, passwordTextField, window;
@synthesize loading = _loading, delegate = _delegate;
@dynamic mixer;

- (IBAction)connectButton:(id)sender {
    [self.mixer loginWithUsername:[usernameTextField stringValue] andPassword:[passwordTextField stringValue]];
    self.loading = YES;
}

- (void)mixer:(Mixer *)mixer DidLoginWithAuthToken:(NSString *)token {
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:ORAuthToken];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    [self.window close];
    [self.delegate authenticated];
}

- (void)mixer:(Mixer *)mixer failedToLogin:(NSError *)error {
    self.loading = NO;
}

- (void)setMixer:(Mixer *)aMixer {
    mixer = aMixer;
    mixer.authDelegate = self;
}

- (Mixer *)mixer {
    return mixer;
}

@end
