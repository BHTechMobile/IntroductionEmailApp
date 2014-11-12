//
//  Contacts.m
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "Contacts.h"
#import "Contact.h"

#import <AddressBook/AddressBook.h>

@interface Contacts ()

@property (nonatomic) ABAddressBookRef addressBook;
@property (nonatomic,assign) ContactsCompletionHandler contactCompletion;


@end

@implementation Contacts

-(id)initWithCompletionHandler:(ContactsCompletionHandler)completion{
    self = [super init];
    _contacts = [NSArray new];
    _contactCompletion = completion;
    [self authenticate];
    return self;
}

-(void)authenticate{
    
    ABAuthorizationStatus status = ABAddressBookGetAuthorizationStatus();
    
    if (status == kABAuthorizationStatusNotDetermined) {
        
        ABAddressBookRequestAccessWithCompletion(_addressBook, ^(bool granted, CFErrorRef error) {
            if (error) {
                NSLog(@"ABAddressBookRequestAccessWithCompletion error: %@", CFBridgingRelease(error));
            }
            if (granted) {
                [self getAllContacts];
                if (_contactCompletion) {
                    _contactCompletion(granted,_contacts);
                }
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    if (_contactCompletion) {
                        _contactCompletion(granted,_contacts);
                    }

                });
            }
        });
        
    } else if (status == kABAuthorizationStatusAuthorized) {
        [self getAllContacts];
        if (_contactCompletion) {
            _contactCompletion(YES,_contacts);
        }
    }
}

-(void)getAllContacts{
    CFErrorRef error = NULL;
    _addressBook = ABAddressBookCreateWithOptions(NULL,&error);
    if (error) {

    }
    
    CFArrayRef all = ABAddressBookCopyArrayOfAllPeople(_addressBook);
    CFIndex n = ABAddressBookGetPersonCount(_addressBook);
    NSMutableArray *mutableContacts = [[NSMutableArray alloc] init];
    for( int i = 0 ; i < n ; i++ )
    {
        ABRecordRef ref = CFArrayGetValueAtIndex(all, i);
        NSString *firstName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonFirstNameProperty);
        NSString *middleName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonMiddleNameProperty);
        NSString *lastName = (__bridge NSString *)ABRecordCopyValue(ref, kABPersonLastNameProperty);
        ABMultiValueRef emails = ABRecordCopyValue(ref, kABPersonEmailProperty);
        
        for(CFIndex j = 0; j < ABMultiValueGetCount(emails); j++){
            NSString *email = (__bridge NSString*)ABMultiValueCopyValueAtIndex(emails, j);
            Contact * contact = [Contact contactWithFirstName:firstName middleName:middleName lastName:lastName email:email];
            [mutableContacts addObject:contact];
        }
    }
    _contacts = mutableContacts;
    NSLog(@"%@",_contacts);
}

-(NSArray*)contactsWithFilterString:(NSString*)filterString{
    NSMutableArray * result = [NSMutableArray new];
    for (Contact * contact in _contacts) {
        if ([contact.firstName isEqual:[NSNull null]]) {
            if ([contact.email rangeOfString:filterString].location != NSNotFound) {
                [result addObject:contact];
            }
        }
        else if (([contact.firstName rangeOfString:filterString].location != NSNotFound)||([contact.email rangeOfString:filterString].location != NSNotFound)) {
            [result addObject:contact];
        }
    }
    return result;
}



@end
