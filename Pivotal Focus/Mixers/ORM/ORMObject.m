//
//  ORMObject.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "ORMObject.h"

@implementation ORMObject

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    return objectMapping;
}

@end
