//
//  Mixer.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "MixerDelegate_Protocols.h"

@class Project;

@interface Mixer : NSObject

+ (Mixer*)sharedMixer;

@property (unsafe_unretained) id<MixerAuthDelegate> authDelegate;
@property (unsafe_unretained) id<MixerDelegate> delegate;

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)getProjects;
- (void)getTicketsForProject:(Project *)project;
@end
