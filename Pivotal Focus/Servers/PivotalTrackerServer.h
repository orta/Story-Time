//
//  PivotalTrackerServer.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

@class PTServer;

@interface PivotalTrackerMixer : NSObject  <RKRequestDelegate, RKObjectLoaderDelegate>
@property (strong) PTServer *server;

@property (weak) IBOutlet NSTextField *usernameTextField;
@property (weak) IBOutlet NSSecureTextField *passwordTextField;
- (IBAction)connectButton:(id)sender;
- (IBAction)getProjects:(id)sender;

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)getProjects;
@end
