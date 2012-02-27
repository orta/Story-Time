//
//  Mixer.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

@implementation Mixer

@synthesize authDelegate = _authDelegate;
@synthesize delegate = _delegate;

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password{};
- (void)getProjects{};
- (void)getTicketsForProject:(Project *)project{};

@end
