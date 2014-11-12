//
//  ChooseContactViewController.m
//  Intro
//
//  Created by Tommy on 11/10/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "ChooseContactViewController.h"

@interface ChooseContactViewController ()<UIAlertViewDelegate>

@end

@implementation ChooseContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
        
        _labelNameIntro.text = @"Permission to Intro";
        NSLog(@"permission contact");
        
        
    }else if(_introtype == IntroTypeSimple){
        _labelDetailPermission.hidden = YES;
        _labelDetailSimple.hidden = NO;
        _labelEmailSimple.hidden = NO;
        _labelIntroSimple.hidden = NO;
        _labelNameSimple.hidden = NO;
        _textFieldEmailSimple.hidden = NO;
        _textFieldNameSimple.hidden = NO;
        _labelNameIntro.text = @"Simple Intro";
        NSLog(@"Simple contact");
    }
    
}

-(void)setIntrotype:(IntroType)introtype{
    
      _introtype = introtype;
    

}
-(void)addMessage {
    UIAlertView *myAlert = [[UIAlertView alloc]
                            initWithTitle:@"Don't have Email"
                            message:@"Message"
                            delegate:self
                            cancelButtonTitle:nil
                            otherButtonTitles:@"Ok",nil];
    NSString *null = @"";
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (_introtype == IntroTypePermission) {
        
        if (_textFieldEmailPermission.text == null ) {
            
            [myAlert show];
            NSLog(@"add error1");
        }else if (_textFieldNamePermission.text == null) {
            
            [myAlert show];
            NSLog(@"add error3");
        }
        [defaults setObject:_textFieldNamePermission.text forKey:@"NamePermission"];
        [defaults setObject:_textFieldEmailPermission.text forKey:@"EmailPermission"];
    } else if(_introtype == IntroTypeSimple){
        if (_textFieldEmailPermission.text == null ) {
            
            [myAlert show];
            NSLog(@"add error1");
        }else if (_textFieldEmailSimple.text == null) {
            
            [myAlert show];
            NSLog(@"add error2");
        }else if (_textFieldNamePermission.text == null) {
            
            [myAlert show];
            NSLog(@"add error3");
        }else if (_textFieldNameSimple.text == null) {
            
            [myAlert show];
            NSLog(@"add error4");
        }
        [defaults setObject:_textFieldNameSimple.text forKey:@"NameSimple"];
        [defaults setObject:_textFieldEmailSimple.text forKey:@"EmailSimple"];
        [defaults setObject:_textFieldNamePermission.text forKey:@"NamePermission"];
        [defaults setObject:_textFieldEmailPermission.text forKey:@"EmailPermission"];
    }

    NSLog(@"add done");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"pushPreviewView"]){
        [self addMessage];
        PreviewViewController *preview = (PreviewViewController *)[segue destinationViewController];
        [preview setIntrotype:_introtype];
        NSLog(@" permission home");
    } }

@end
