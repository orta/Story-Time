//
//  Project.m
//  Pivotal Focus
//
//  Created by orta therox on 25/02/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

//    <id>390349</id>
//    <name>Entropy</name>
//    <iteration_length type="integer">1</iteration_length>
//    <week_start_day>Monday</week_start_day>
//    <point_scale>0,1,2,3</point_scale>
//    <account>Art.sy IT</account>
//    <first_iteration_start_time type="datetime">2011/10/17 04:00:00 UTC</first_iteration_start_time>
//    <current_iteration_number type="integer">19</current_iteration_number>
//    <enable_tasks type="boolean">true</enable_tasks>
//    <velocity_scheme>Average of 3 iterations</velocity_scheme>
//    <current_velocity>10</current_velocity>
//    <initial_velocity>10</initial_velocity>
//    <number_of_done_iterations_to_show>12</number_of_done_iterations_to_show>
//    <labels>iphone</labels>
//    <last_activity_at type="datetime">2012/02/21 19:22:43 UTC</last_activity_at>
//    <allow_attachments>true</allow_attachments>
//    <public>false</public>
//    <use_https>false</use_https>
//    <bugs_and_chores_are_estimatable>false</bugs_and_chores_are_estimatable>
//    <commit_mode>false</commit_mode>

#import "Project.h"

@implementation Project
@dynamic name, uid, labels, velocity, lastActivity;

+ (RKObjectMapping *)objectMapping {
    RKManagedObjectMapping *objectMapping = [RKManagedObjectMapping mappingForClass:[self class]];
    [objectMapping mapAttributes:@"name", @"labels", @"velocity", nil];
    [objectMapping mapKeyPath:@"last_activity_at" toAttribute:@"lastActivity"];
    [objectMapping mapKeyPath:@"id" toAttribute:@"uid"];
    objectMapping.primaryKeyAttribute = @"uid";
    return objectMapping;
}

@end
