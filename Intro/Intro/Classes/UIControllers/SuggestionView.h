//
//  SuggestionView.h
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
#import "Contacts.h"

@class SuggestionView;

@protocol SuggestionViewDataSource <NSObject>

@required
-(CGFloat)maxHeightForSuggestionView;
-(NSString*)filterStringForSuggestionView;

@end

@protocol SuggestionViewDelegate <NSObject>

@optional
-(void)suggestionView:(SuggestionView*)suggestionView didSelectContact:(Contact*)contact;

@end


@interface SuggestionView : UIView<UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *contactsTableView;
@property (nonatomic,assign) id<SuggestionViewDataSource> suggestionViewDatasource;
@property (nonatomic,assign) id<SuggestionViewDelegate> suggestionViewDelegate;

-(void)reloadData;

@end
