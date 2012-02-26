//
//  ORMObject.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ORMObject.h"

@implementation ORMObject
@dynamic createdAt, updatedAt;

+ (RKObjectMapping *)objectMapping {
    NSLog(@"USING DEFAULT MAPPING FOR %@", self.class);
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    return objectMapping;
}

@end
