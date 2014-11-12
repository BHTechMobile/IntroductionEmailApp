//
//  PreviewViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "PreviewViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

@interface PreviewViewController ()<MFMailComposeViewControllerDelegate>{
    NSString *_stringHTML;
}

@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (_email.introType == IntroTypePermission) {
        _stringHTML =[ NSString stringWithFormat:@"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h2>Permission to Intro</h2></div><a>Hi %@,</a><p>I hope you are well.I wanted to check to see if you'd be open to being introduced to my friend Jack.Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow.His new company seems pertty interesting- it's in the email space - and they're going to start fundraising soon</p><p>I know he reads your blog and is a fan</p><p>Would you be OK if made the email intro? No worries either way.</p><p>Thanks and all best,</p><p>Jeff</p></font></body></html>",_email.receiverName];
        
    }else if(_email.introType == IntroTypeSimple){
        _stringHTML =[ NSString stringWithFormat:@"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h2>Simple Intro</h2></div><a>Hi %@,</a><p>I wanted to introduced you to %@. %@ is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.</p><p>I will let you both take it form here</p><p>Best,</p><p>Jeff</p></font></body></html>",_email.receiverName,_email.senderName,_email.senderName];
    }
    _webView.scrollView.scrollEnabled = NO;
    _webView.backgroundColor = [UIColor clearColor];
    _webView.opaque = NO;

    [_webView loadHTMLString:_stringHTML baseURL:nil];

}

- (IBAction)clickSelectButton:(id)sender {
    if(![MFMailComposeViewController canSendMail] ) {
        NSLog(@"Cannot send mail\n%s", __PRETTY_FUNCTION__) ;
        return ;
    }
    
    // Email Subject
    NSString *emailTitle = @"Open to being introduced to?";

    NSArray *toRecipents = @[_email.receiverEmail];
    
    MFMailComposeViewController *mc = [[MFMailComposeViewController alloc] init];
    mc.mailComposeDelegate = self;
    [mc setSubject:emailTitle];
    [mc setMessageBody:_email.introType==IntroTypePermission?[ NSString stringWithFormat:EMAIL_PERMISSION_CONTENT,_email.receiverName]:[ NSString stringWithFormat:EMAIL_SIMPLE_CONTENT,_email.receiverName,_email.senderName,_email.senderName] isHTML:NO];
    [mc setToRecipients:toRecipents];
    
    // Present mail view controller on screen
    [self presentViewController:mc animated:YES completion:NULL];
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    if (result == MFMailComposeResultSent) {
        [self performSegueWithIdentifier:@"ThanksVCSegueID" sender:nil];
    }
    
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
