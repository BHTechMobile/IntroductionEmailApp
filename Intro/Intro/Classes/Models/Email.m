//
//  Email.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "Email.h"

@implementation Email

+(Email*)emailWithIntroType:(IntroType)introType senderName:(NSString*)senderName senderEmail:(NSString*)senderEmail receiverName:(NSString*)receiverName receiverEmail:(NSString*)receiverEmail{
    Email * email = [[Email alloc] init];
    email.introType = introType;
    email.senderName = senderName;
    email.senderEmail = senderEmail;
    email.receiverName = receiverName;
    email.receiverEmail = receiverEmail;
    return email;
}

@end
