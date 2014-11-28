//
//  SuggestionView.m
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "SuggestionView.h"
#import "Constants.h"


@interface SuggestionView ()

@property (strong, nonatomic) NSArray *contacts;
@property (strong, nonatomic) Contacts *contactList;
@property (nonatomic, assign) CGRect myFrame;
@end

@implementation SuggestionView

-(id)initWithFrame:(CGRect)frame{
    self = [[[NSBundle mainBundle] loadNibNamed:[[self class] description] owner:nil options:nil] objectAtIndex:0];
    self.frame = frame;
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
    _contactsTableView.dataSource = self;
    _contactsTableView.delegate = self;
    _contactList = [[Contacts alloc] initWithCompletionHandler:^(bool granted, NSArray *contacts) {
        if (granted) {
            _contacts = contacts;
            [_contactsTableView reloadData];
        }
    }];
}

#pragma  mark - UITableView DataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SUGGESTION_VIEW_CEL_HEIGHT;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _contacts.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * cellIdentifier = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.textLabel.text = [((Contact*)_contacts[indexPath.row]).firstName isEqual:[NSNull null]]? (((Contact*)_contacts[indexPath.row]).email):([((Contact*)_contacts[indexPath.row]).lastName isEqual:[NSNull null]]?((Contact*)_contacts[indexPath.row]).firstName:[NSString stringWithFormat:@"%@ %@",((Contact*)_contacts[indexPath.row]).firstName,((Contact*)_contacts[indexPath.row]).lastName]);
    return cell;
}

#pragma mark - UItableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_suggestionViewDelegate && [_suggestionViewDelegate respondsToSelector:@selector(suggestionView:didSelectContact:)]) {
        [_suggestionViewDelegate suggestionView:self didSelectContact:(Contact*)_contacts[indexPath.row]];
    }
}

#pragma mark - action

-(void)reloadData{
    _contacts = [_contactList contactsWithFilterString:[_suggestionViewDatasource filterStringForSuggestionView:self]];
    
    CGRect updateFrame = self.frame;
    
    if (_contacts.count *SUGGESTION_VIEW_CEL_HEIGHT < [_suggestionViewDatasource maxHeightForSuggestionView:self]) {
        updateFrame.size.height = _contacts.count * SUGGESTION_VIEW_CEL_HEIGHT;
    }
    else{
        updateFrame.size.height = [_suggestionViewDatasource maxHeightForSuggestionView:self];
    }
    self.frame = updateFrame;
    [self layoutIfNeeded];
    [_contactsTableView reloadData];
}

@end
