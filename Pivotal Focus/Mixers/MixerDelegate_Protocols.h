//
//  MixerCategory.h
//  Tickifier
//
//  Created by orta on 17/10/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

@class Mixer;
@class ProjectCollection;
@class TicketCollection;

@protocol MixerAuthDelegate <NSObject>
- (void)mixer:(Mixer *)mixer DidLoginWithAuthToken:(NSString *)token;
- (void)mixer:(Mixer *)mixer failedToLogin:(NSError *)error;
@end

@protocol MixerDelegate <NSObject>
- (void)mixer:(Mixer *)mixer returnedProjectsCollection:(ProjectCollection *)collection;
- (void)mixer:(Mixer *)mixer returnedTicketCollection:(TicketCollection *)collection;
@end
