 //
//  TicketCollection.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "TicketCollection.h"

@implementation TicketCollection

@synthesize tickets;

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    [objectMapping mapKeyPath:@"story" toRelationship:@"tickets" withMapping:[Ticket objectMapping]];
    return objectMapping;
}

@end
