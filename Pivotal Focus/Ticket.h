//
//  Ticket.h
//  Tickifier
//
//  Created by orta therox on 16/09/2010.
//  Copyright 2010 http://www.ortatherox.com. All rights reserved.
//

#import <Cocoa/Cocoa.h>


@interface Ticket : NSObject {
  NSString * title;
  NSString *body;
  NSString *tags;
  NSString *identifier;
  NSString *url;
}

@property (strong) NSString * title;
@property (strong) NSString *body;
@property (strong) NSString *tags;
@property (strong) NSString *identifier;
@property (strong) NSString *url;

@end
