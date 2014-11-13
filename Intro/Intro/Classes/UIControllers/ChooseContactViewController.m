//
//  ChooseContactViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "ChooseContactViewController.h"

@interface ChooseContactViewController ()<UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UIView *viewLineUnderName;
@property (weak, nonatomic) IBOutlet UIView *viewLineUnderEmail;
@property (weak, nonatomic) IBOutlet UIView *viewLinderUnderIntroduce;
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
    self.title = title;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"pushPreviewView"]){
        
        PreviewViewController *preview = (PreviewViewController *)[segue destinationViewController];
        [preview setEmail:[Email emailWithIntroType:_introtype senderName:_textFieldNameSimple.text senderEmail:_textFieldEmailSimple.text receiverName:_textFieldNamePermission.text receiverEmail:_textFieldEmailPermission.text]];
    } }

@end
