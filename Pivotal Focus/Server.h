//
//  LighthouseServer.h
//  Tickifier
//
//  Created by orta on 12/10/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MixerDelegate_Protocol.h"

@interface Server : NSObject <NSCoding>{
    
  NSString *url;
  NSString *APIKey;
  
  NSString *username;
  NSString *password;
}

@property (strong) NSString *mixer;

@property (strong) NSString *url;
@property (strong) NSString *APIKey;

@property (strong) NSString *username;
@property (strong) NSString *password;

@property () int projectIndex;
@property () int milestoneIndex;
@property () int userIndex;

@end
