//
//  PivotalTrackerServer.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PivotalTrackerMixer.h"
#import "PTServer.h"
#import <RestKit/RKXMLParserLibXML.h>

@implementation PivotalTrackerMixer

@synthesize server = _server;

- (id)init {
    self = [super init];
    if (self) {
        self.server = [PTServer new];
    }
    return self;
}


- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password {
    NSString *address = @"/tokens/active";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys: username, @"username", password, @"password", nil];
    [_server.client post:address params:params delegate:self];
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    if ([response isOK]) {
        NSDictionary *responseDict = [[[RKXMLParserLibXML alloc] init] parseXML:[response bodyAsString]];
        if ([responseDict objectForKey:@"token"]) {
            NSString *token = [[responseDict objectForKey:@"token"] objectForKey:@"guid"];
            [_server.client setValue: token forHTTPHeaderField:@"X-TrackerToken"];
            
            if ([self.authDelegate respondsToSelector:@selector(mixer:DidLoginWithAuthToken:)]) {
                [self.authDelegate mixer:self DidLoginWithAuthToken:token];
            }
        }
    }else{
        if ([self.authDelegate respondsToSelector:@selector(mixer:failedToLogin:)]) {
            [self.authDelegate mixer:self failedToLogin:nil];
        }
        NSLog(@"failed");
    }
}

- (void)getProjects {
    [_server loadObjectsAtResourcePath:@"/projects" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"ERROR %@", error);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"%@", objects);
    id collection = [objects objectAtIndex:0];
    
    if ([collection respondsToSelector:@selector(projects)]){
        ProjectCollection *projects = (ProjectCollection *)collection;
        if ([self.delegate respondsToSelector:@selector(mixer:returnedProjectsCollection:)]) {
            [self.delegate mixer:self returnedProjectsCollection:projects];
        }
    }
    
    if ([collection respondsToSelector:@selector(tickets)]) {
        TicketCollection *tickets = (TicketCollection *)collection;
        if ([self.delegate respondsToSelector:@selector(mixer:returnedTicketCollection:)]) {
            [self.delegate mixer:self returnedTicketCollection:tickets];
        }
    }
    
}

- (void)getTicketsForProject:(Project *)project {
    NSString *address = [NSString stringWithFormat:@"/projects/%@/stories", project.uid];
    [_server loadObjectsAtResourcePath:address delegate:self];
}


@end
