//
//  ChooseContactViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "ChooseContactViewController.h"
#import "SuggestionView.h"

@interface ChooseContactViewController ()<UIAlertViewDelegate,SuggestionViewDataSource,SuggestionViewDelegate,UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewLineUnderName;
@property (weak, nonatomic) IBOutlet UIView *viewLineUnderEmail;
@property (weak, nonatomic) IBOutlet UIView *viewLinderUnderIntroduce;
@property (strong, nonatomic) SuggestionView * suggestionViewSimple;
@property (strong, nonatomic) SuggestionView * suggestionViewPermission;
@property (strong, nonatomic) NSString * filterSimpleString;
@property (strong, nonatomic) NSString * filterPermissionString;
@end

@implementation ChooseContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString * title = @"";
    _labelDetailPermission.hidden = YES;
    // Do any additional setup after loading the view.
    if (_introtype == IntroTypePermission) {
        _labelDetailPermission.hidden = NO;
        _labelDetailSimple.hidden = YES;
        _labelEmailSimple.hidden = YES;
        
        _labelIntroSimple.hidden = YES;
        _labelNameSimple.hidden = YES;
        _textFieldEmailSimple.hidden = YES;
        _textFieldNameSimple.hidden = YES;
        _viewLineUnderEmail.hidden = YES;
        _viewLineUnderName.hidden = YES;
        _viewLinderUnderIntroduce.hidden = YES;
        title = @"Permission to Intro";
        
    }else if(_introtype == IntroTypeSimple){
        _labelDetailPermission.hidden = YES;
        _labelDetailSimple.hidden = NO;
        _labelEmailSimple.hidden = NO;
        _labelIntroSimple.hidden = NO;
        _labelNameSimple.hidden = NO;
        _textFieldEmailSimple.hidden = NO;
        _textFieldNameSimple.hidden = NO;
        title = @"Simple Intro";
    }
    _labelNameIntro.text = title;
    self.title = title;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    _filterPermissionString = @"";
    _filterSimpleString = @"";
    [_suggestionViewPermission removeFromSuperview];
    [_suggestionViewSimple removeFromSuperview];
    _suggestionViewPermission = [[SuggestionView alloc] initWithFrame:CGRectMake(_textFieldNamePermission.frame.origin.x, FORMS_VIEW_PADDING , _textFieldNamePermission.frame.size.width, _textFieldNamePermission.frame.origin.y - FORMS_VIEW_PADDING)];
    _suggestionViewPermission.suggestionViewDatasource = self;
    _suggestionViewPermission.suggestionViewDelegate = self;
    _suggestionViewPermission.hidden = YES;
    if(_introtype == IntroTypeSimple){
        _suggestionViewSimple = [[SuggestionView alloc] initWithFrame:CGRectMake(_textFieldNameSimple.frame.origin.x, _textFieldNameSimple.frame.origin.y+_textFieldNameSimple.frame.size.height, _textFieldNameSimple.frame.size.width, self.view.frame.size.height-KEYBOARD_HEIGHT- (_textFieldNameSimple.frame.origin.y+_textFieldNameSimple.frame.size.height)-5)];
        [self.view addSubview:_suggestionViewSimple];
        _suggestionViewSimple.suggestionViewDatasource = self;
        _suggestionViewSimple.suggestionViewDelegate = self;
        _suggestionViewSimple.hidden = YES;
        [_textFieldNameSimple becomeFirstResponder];
    }
    else{
        [_textFieldNamePermission becomeFirstResponder];

    }
    
    [self.view addSubview:_suggestionViewPermission];
}

- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)seeDraft:(id)sender {
//    if (((![_textFieldEmailSimple.text isEqualToString:@""] || _textFieldEmailSimple.text != nil) && [self validateEmail:_textFieldEmailSimple.text]) && ((![_textFieldEmailPermission.text isEqualToString:@""] || _textFieldEmailPermission.text != nil) && [self validateEmail:_textFieldEmailPermission.text])) {
        [self performSegueWithIdentifier:@"pushPreviewView" sender:nil];
//    }
//    else{
//        [[[UIAlertView alloc] initWithTitle:nil message:@"Input email is invalid.\nPlease check it again" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] show];
//    }
}
- (IBAction)clickBackground:(id)sender {
    [_textFieldNamePermission endEditing:YES];
    [_textFieldEmailPermission endEditing:YES];
    [_textFieldNameSimple endEditing:YES];
    [_textFieldEmailSimple endEditing:YES];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"pushPreviewView"]){
        
        PreviewViewController *preview = (PreviewViewController *)[segue destinationViewController];
        [preview setEmail:[Email emailWithIntroType:_introtype senderName:_textFieldNameSimple.text senderEmail:_textFieldEmailSimple.text receiverName:_textFieldNamePermission.text receiverEmail:_textFieldEmailPermission.text]];
    }
}

#pragma mark - SuggestionView Datasource

-(CGFloat)maxHeightForSuggestionView:(SuggestionView*)suggestionView{
    if (suggestionView == _suggestionViewSimple) {
        return self.view.frame.size.height- KEYBOARD_HEIGHT- (_textFieldNameSimple.frame.origin.y+_textFieldNameSimple.frame.size.height)- FORMS_VIEW_PADDING;
    }
    else {
     return _textFieldNamePermission.frame.origin.y - FORMS_VIEW_PADDING;
    }
}

-(NSString*)filterStringForSuggestionView:(SuggestionView*)suggestionView{
    if (suggestionView == _suggestionViewSimple) {
       return _filterSimpleString;
    }
    else{
        return _filterPermissionString;
    }
}

#pragma mark - SuggestionView Delegate

-(void)suggestionView:(SuggestionView*)suggestionView didSelectContact:(Contact*)contact{
    if (suggestionView == _suggestionViewSimple) {
        _textFieldNameSimple.text = contact.firstName;
        _textFieldEmailSimple.text = contact.email;
    }
    else if (suggestionView == _suggestionViewPermission){
        _textFieldNamePermission.text = contact.firstName;
        _textFieldEmailPermission.text = contact.email;
    }
    suggestionView.hidden = YES;
}

#pragma mark - UITextField Delegate

- (void)textFieldDidBeginEditing:(UITextField *)textField{
    if (textField == _textFieldNameSimple) {
        [_suggestionViewSimple reloadData];
        _suggestionViewSimple.hidden = NO;
        _suggestionViewPermission.hidden = YES;
    }
    else if (textField == _textFieldNamePermission) {
        [_suggestionViewPermission reloadData];
        _suggestionViewSimple.hidden = YES;
        _suggestionViewPermission.hidden = NO;
    }
    else{
        _suggestionViewSimple.hidden = YES;
        _suggestionViewPermission.hidden = YES;
    }
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == _textFieldNameSimple) {
        _suggestionViewSimple.hidden = NO;
        _filterSimpleString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        [_suggestionViewSimple reloadData];
    }
    if (textField == _textFieldNamePermission) {
        _suggestionViewPermission.hidden = NO;
        _filterPermissionString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        [_suggestionViewPermission reloadData];
    }
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
    _suggestionViewSimple.hidden = YES;
    _suggestionViewPermission.hidden = YES;
}

- (BOOL)validateEmail:(NSString *)checkString{
    BOOL stricterFilter = YES; // Discussion http://blog.logichigh.com/2010/09/02/validating-an-e-mail-address/
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


@end
