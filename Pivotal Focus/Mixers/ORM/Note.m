//
//  Comment.m
//  Pivotal Focus
//
//  Created by orta therox on 26/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

@implementation Note

//{
//    author = "Orta Therox";
//    id = 19017697;
//    "noted_at" = "2012/02/23 16:50:14 UTC";
//    text = "I think I did, will look and confirm";
//    type = datetime;
//}

@synthesize text, authorString, uid, ticket;

+ (RKManagedObjectMapping *)objectMapping {
    RKManagedObjectMapping *objectMapping = [RKManagedObjectMapping mappingForClass:[self class]];
    [objectMapping mapAttributes:@"title", @"url", nil];
//    [objectMapping mapKeyPath:@"noted_at" toAttribute:@"createdAt"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"uid"];
    [objectMapping mapKeyPath:@"authorString" toAttribute:@"author"];
    objectMapping.primaryKeyAttribute = @"uid";
    return objectMapping;
}

@end
