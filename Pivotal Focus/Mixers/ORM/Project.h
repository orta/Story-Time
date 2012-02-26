//
//  Project.h
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Project : ORMObject

@property (strong) NSString *name;
@property (strong) NSNumber *uid;
@property (strong) NSString *labels;
@property (strong) NSNumber *velocity;
@property (strong) NSDate *lastActivity;

@end
