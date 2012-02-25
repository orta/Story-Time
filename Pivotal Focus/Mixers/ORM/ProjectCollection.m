//
//  ProjectCollection.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ProjectCollection.h"

@implementation ProjectCollection

@synthesize projects;

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    [objectMapping mapKeyPath:@"project" toRelationship:@"projects" withMapping:[Project objectMapping]];
    return objectMapping;
}

@end
