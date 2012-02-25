//
//  AuthViewController.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MixerDelegate_Protocols.h"
#import "PivotalTrackerMixer.h"

@protocol AuthDelegate <NSObject> 
- (void)authenticated;
@end

@interface AuthViewController  : NSViewController <MixerAuthDelegate>{
    Mixer *mixer;
}

@property (strong) Mixer *mixer;
@property (unsafe_unretained) id <AuthDelegate>delegate;
@property (assign) BOOL loading;

@property (unsafe_unretained) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextField *usernameTextField;
@property (weak) IBOutlet NSSecureTextField *passwordTextField;

- (IBAction)connectButton:(id)sender;

@end
