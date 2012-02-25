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
@synthesize mixer = _mixer;


- (IBAction)connectButton:(id)sender {
    NSLog(@"logging in %@", self.mixer);
    [self.mixer loginWithUsername:[usernameTextField stringValue] andPassword:[passwordTextField stringValue]];
}

- (void)mixer:(Mixer *)mixer DidLoginWithAuthToken:(NSString *)token {
    NSLog(@"success");
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:ORAuthToken];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

- (void)mixer:(Mixer *)mixer failedToLogin:(NSError *)error {
    NSLog(@"failure");    
}

@end
