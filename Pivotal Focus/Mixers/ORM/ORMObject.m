//
//  ORMObject.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

@implementation ORMObject
@dynamic createdAt, updatedAt;

+ (RKManagedObjectMapping *)objectMapping {
    NSLog(@"USING DEFAULT MAPPING FOR %@", self.class);
    RKManagedObjectMapping *objectMapping = [RKManagedObjectMapping mappingForClass:[self class]];
    return objectMapping;
}

@end
