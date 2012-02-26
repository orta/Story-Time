//
//  Ticket.m
//  Tickifier
//
//  Created by orta therox on 16/09/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

#import "Ticket.h"

//<story>
//<id type="integer">19598265</id>
//<project_id type="integer">390349</project_id>
//<story_type>feature</story_type>
//<url>http://www.pivotaltracker.com/story/show/19598265</url>
//<estimate type="integer">2</estimate>
//<current_state>accepted</current_state>
//<description>A user should be able to view an artwork in full landscape or portrait mode with additional meta data (artist, title, medium, size) also displayed. The ability to save an artwork to a user's collection should be visible and easily tapable. </description>
//<name>user should be able to view an artwork</name>
//<requested_by>Oz Lubling</requested_by>
//<owned_by>Orta Therox</owned_by>
//<created_at type="datetime">2011/10/12 16:20:36 UTC</created_at>
//<updated_at type="datetime">2011/10/19 14:48:18 UTC</updated_at>
//<accepted_at type="datetime">2011/10/19 14:48:18 UTC</accepted_at>
//</story>

// Called Story in PT
#import "NoteCollection.h"

@implementation Ticket
@synthesize name, body, tags, uid, url, state, type, createdAt, project, owner, requester, noteCollection, attachments;

+ (RKObjectMapping *)objectMapping {
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class]];
    [objectMapping mapAttributes: @"url", nil];
    [objectMapping mapKeyPath:@"name" toAttribute:@"name"];
    [objectMapping mapKeyPath:@"description" toAttribute:@"body"];
    [objectMapping mapKeyPath:@"created_at" toAttribute:@"createdAt"];
    [objectMapping mapKeyPath:@"current_state" toAttribute:@"state"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"uid"];
    [objectMapping mapKeyPath:@"owned_by" toAttribute:@"owner"];
    [objectMapping mapKeyPath:@"requested_by" toAttribute:@"requester"];
    [objectMapping mapKeyPath:@"notes" toRelationship:@"noteCollection" withMapping: [NoteCollection objectMapping]];

    return objectMapping;
}

@end
