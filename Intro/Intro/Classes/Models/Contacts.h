//
//  Contacts.h
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

typedef void(^ContactsCompletionHandler)(bool granted, NSArray* contacts);


@interface Contacts : NSObject

@property (nonatomic,retain) NSArray * contacts;

-(id)initWithCompletionHandler:(ContactsCompletionHandler)completion;
-(NSArray*)contactsWithFilterString:(NSString*)filterString;

@end
