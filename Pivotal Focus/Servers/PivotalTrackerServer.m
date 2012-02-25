//
//  PivotalTrackerServer.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PivotalTrackerServer.h"
#import "PTServer.h"
#import <RestKit/RKXMLParserLibXML.h>

@implementation PivotalTrackerMixer
@synthesize usernameTextField;
@synthesize passwordTextField;
@synthesize server = _server;

- (id)init {
    self = [super init];
    if (self) {
        self.server = [PTServer new];
        [self getProjects];
    }
    return self;
}

- (IBAction)connectButton:(id)sender {
    [self loginWithUsername:[usernameTextField stringValue] andPassword:[passwordTextField stringValue]];
}

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password {
    NSString *address = @"/tokens/active";
    NSDictionary* params = $dict( username, @"username", password, @"password" );
    [_server.client post:address params:params delegate:self];
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    if ([response isOK]) {
        NSDictionary *responseDict = [[[RKXMLParserLibXML alloc] init] parseXML:[response bodyAsString]];
        if ([responseDict objectForKey:@"token"]) {
            NSString *token = [[responseDict objectForKey:@"token"] objectForKey:@"guid"];
            
            [_server.client setValue: token forHTTPHeaderField:@"X-TrackerToken"];
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:ORAuthToken];
            [[NSUserDefaults standardUserDefaults] synchronize];
        }
    }else{
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
    ProjectCollection *collection = [objects $first];
    NSLog(@"objects %@", collection.projects);
}

@end
