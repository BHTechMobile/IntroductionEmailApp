//
//  PreviewViewController.m
//  Intro
//
//  Created by Tommy on 11/10/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "PreviewViewController.h"

@interface PreviewViewController ()

@end

@implementation PreviewViewController{
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *namePermission = [defaults objectForKey:@"NamePermission"];
    NSString *nameSimple = [defaults objectForKey:@"NameSimple"];
    if (_introtype == IntroTypePermission) {
        NSString *stringHTML =[ NSString stringWithFormat:@"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h2>Permission to Intro</h2></div><a>Hi %@,</a><p>I hope you are well.I wanted to check to see if you'd be open to being introduced to my friend Jack.Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow.His new company seems pertty interesting- it's in the email space - and they're going to start fundraising soon</p><p>I know he reads your blog and is a fan</p><p>Would you be OK if made the email intro? No worries either way.</p><p>Thanks and all best,</p><p>Jeff</p></font></body></html>",namePermission];
        [_webView loadHTMLString:stringHTML baseURL:nil];
        
        
    }else if(_introtype == IntroTypeSimple){
        NSString *stringHTML =[ NSString stringWithFormat:@"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h2>Simple Intro</h2></div><a>Hi %@,</a><p>I wanted to introduced you to %@.%@ is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.</p><p>I will let you both take it form here</p><p>Best,</p><p>Jeff</p></font></body></html>",namePermission,nameSimple,nameSimple];
        [_webView loadHTMLString:stringHTML baseURL:nil];
    }
}

-(void)setIntrotype:(IntroType)introtype{
    
    _introtype = introtype;
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


@end
