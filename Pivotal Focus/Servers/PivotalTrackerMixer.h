//
//  PivotalTrackerServer.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "MixerDelegate_Protocol.h"

@class PTServer;

@interface PivotalTrackerMixer : Mixer  <RKRequestDelegate, RKObjectLoaderDelegate>

@property (strong) PTServer *server;
@property (weak) id<MixerDelegate> delegate;

- (IBAction)getProjects:(id)sender;

@end
