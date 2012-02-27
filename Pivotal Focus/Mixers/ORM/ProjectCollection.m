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

+ (RKManagedObjectMapping *)objectMapping {
    RKManagedObjectMapping *objectMapping = [RKManagedObjectMapping mappingForClass:[self class]];
    [objectMapping mapKeyPath:@"project" toRelationship:@"projects" withMapping:[Project objectMapping]];
    return objectMapping;
}

@end
