//
//  Mixer.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mixer : NSObject

+ (Mixer*)sharedMixer;
- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)getProjects;

@end
