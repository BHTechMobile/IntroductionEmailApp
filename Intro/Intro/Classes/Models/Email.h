//
//  Email.h
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Email : NSObject

@property (nonatomic,assign) IntroType introType;
@property (nonatomic,strong) NSString * senderName;
@property (nonatomic,strong) NSString * senderEmail;
@property (nonatomic,strong) NSString * receiverName;
@property (nonatomic,strong) NSString * receiverEmail;

+(Email*)emailWithIntroType:(IntroType)introType senderName:(NSString*)senderName senderEmail:(NSString*)senderEmail receiverName:(NSString*)receiverName receiverEmail:(NSString*)receiverEmail;


@end
