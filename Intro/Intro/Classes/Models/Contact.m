//
//  Contact.m
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "Contact.h"

@implementation Contact

+(Contact*)contactWithFirstName:(NSString*)firstName middleName:(NSString*)middleName lastName:(NSString*)lastName email:(NSString*)email{
    Contact * contact = [[Contact alloc] init];
    contact.firstName = firstName;
    contact.middleName = middleName;
    contact.lastName = lastName;
    contact.email = email;
    return contact;
}

-(NSString*)description{
    return [NSString stringWithFormat:@"Contact:%@ -- %@ -- %@ -- %@",_firstName,_middleName,_lastName,_email];
}


@end
