//
//  LighthouseServer.m
//  Tickifier
//
//  Created by orta on 12/10/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

#import "Server.h"


@implementation Server

@synthesize url, APIKey, projectIndex, milestoneIndex, userIndex, mixer, username, password;

- (NSString *) description {
  return [NSString stringWithFormat:@"%@ (with a twist of %@): projectID: %i userID %i milestoneID %i", self.url, self.mixer, self.projectIndex, self.userIndex, self.milestoneIndex ];
}

- (void)encodeWithCoder: (NSCoder *)coder {
  [coder encodeObject: [self url] forKey: @"url"];
  [coder encodeObject: [self APIKey] forKey: @"APIKey"];
  [coder encodeObject: [self mixer] forKey: @"mixer"];
  [coder encodeObject: [self username] forKey: @"username"];
  [coder encodeObject: [self password] forKey: @"password"];
  

  [coder encodeInt:self.userIndex forKey:@"userIndex"];
  [coder encodeInt:self.milestoneIndex forKey:@"milestoneIndex"];
  [coder encodeInt:self.projectIndex forKey:@"projectIndex"];
}

- (id)initWithCoder: (NSCoder *)coder {
  if((self = [self init])) {
    self.url = [coder decodeObjectForKey: @"url"];
    self.APIKey = [coder decodeObjectForKey: @"APIKey"];
    self.mixer = [coder decodeObjectForKey: @"mixer"];
    self.username = [coder decodeObjectForKey: @"username"];
    self.password = [coder decodeObjectForKey: @"passsword"];

    
    self.userIndex = [coder decodeIntForKey:@"userIndex"];
    self.milestoneIndex = [coder decodeIntForKey:@"milestoneIndex"];
    self.projectIndex = [coder decodeIntForKey:@"projectIndex"];
    if(self.mixer == nil){
      self.mixer = @"Lighthouse";      
    }
   }
  return self;
}

@end
