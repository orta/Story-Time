//
//  MixerCategory.h
//  Tickifier
//
//  Created by orta on 17/10/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

@class Mixer;

@protocol MixerAuthDelegate <NSObject>
- (void)mixer:(Mixer *)mixer DidLoginWithAuthToken:(NSString *)token;
- (void)mixer:(Mixer *)mixer failedToLogin:(NSError *)error;
@end
