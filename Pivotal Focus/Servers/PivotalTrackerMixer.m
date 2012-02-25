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
@synthesize delegate = _delegate;

- (id)init {
    self = [super init];
    if (self) {
        self.server = [PTServer new];
    }
    return self;
}


- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    
    NSString *address = @"/tokens/active";
    NSDictionary* params = [NSDictionary dictionaryWithObjectsAndKeys: username, @"username", password, @"password", nil];
    [_server.client post:address params:params delegate:self];
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"response");    
    if ([response isOK]) {
        NSDictionary *responseDict = [[[RKXMLParserLibXML alloc] init] parseXML:[response bodyAsString]];
        if ([responseDict objectForKey:@"token"]) {
            NSString *token = [[responseDict objectForKey:@"token"] objectForKey:@"guid"];
            [_server.client setValue: token forHTTPHeaderField:@"X-TrackerToken"];
            
            if ([self.delegate respondsToSelector:@selector(mixer:DidLoginWithAuthToken:)]) {
                [self.delegate mixer:self DidLoginWithAuthToken:token];
            }
        }
    }else{
        if ([self.delegate respondsToSelector:@selector(mixer:failedToLogin:)]) {
            [self.delegate mixer:self failedToLogin:nil];
        }
        NSLog(@"failed");
    }
}

- (IBAction)getProjects:(id)sender {
    [self getProjects];
}

- (void)getProjects {
    [_server loadObjectsAtResourcePath:@"/projects" delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    NSLog(@"ERROR %@", error);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects{    
    ProjectCollection *collection = [objects objectAtIndex:0];
    NSLog(@"objects %@", collection.projects);
}

@end
