//
//  Contact.h
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject
@property (nonatomic,retain) NSString * firstName;
@property (nonatomic,retain) NSString * middleName;
@property (nonatomic,retain) NSString * lastName;
@property (nonatomic,retain) NSString * name;
@property (nonatomic,retain) NSString * email;

+(Contact*)contactWithFirstName:(NSString*)firstName middleName:(NSString*)middleName lastName:(NSString*)lastName email:(NSString*)email;

@end
