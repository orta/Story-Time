//
//  NoteCollection.m
//  Pivotal Focus
//
//  Created by orta therox on 26/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

@implementation NoteCollection

@synthesize notes;

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    [objectMapping mapKeyPath:@"note" toRelationship:@"notes" withMapping:[Project objectMapping]];
    return objectMapping;
}

@end
