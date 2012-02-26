//
//  Mixer.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "Mixer.h"

static Mixer *sharedMixer;


@implementation Mixer

@synthesize authDelegate = _authDelegate;
@synthesize delegate = _delegate;

- (void)initialize {
    static dispatch_once_t pred;
    dispatch_once(&pred, ^{ sharedMixer = [[Mixer alloc] init]; } );
}

+ (Mixer*) sharedMixer {
    return sharedMixer;
}

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password{};
- (void)getProjects{};
- (void)getTicketsForProject:(Project *)project{};

@end
