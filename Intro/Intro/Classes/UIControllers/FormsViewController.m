//
//  FormsViewController.m
//  Intro
//
//  Created by Tommy on 11/11/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "FormsViewController.h"

@interface FormsViewController ()

@end

@implementation FormsViewController{
    
    CGPoint point;
}

-(void)loadView{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:NO];

    NSArray *stringHTML = @[
                            @"<!DOCTYPE html><html><h2>Permission to Intro</h2><a>Hi Justin,</a><p>I hope you are well.I wanted to check to see if you'd be open to being introduced to my friend Jack.Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow.His new company seems pertty interesting- it's in the email space - and they're going to start fundraising soon</p><p>I know he reads your blog and is a fan</p><p>Would you be OK if made the email intro? No worries either way.</p><p>Thanks and all best,</p><p>Jeff</p></html>",
                            @"<!DOCTYPE html><html><h2>Simple Intro</h2><a>Hi Justin,</a><p>I wanted to introduced you to Jack.Jack is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.</p><p>I will let you both take it form here</p><p>Best,</p><p>Jeff</p></html>"
                            ];
    
    
    for (int i = 0; i < stringHTML.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.size = self.scrollView.frame.size;
        UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(320*i, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
        webview.scrollView.scrollEnabled = NO;
        webview.scrollView.backgroundColor = [UIColor clearColor];
        webview.backgroundColor = [UIColor clearColor];
        webview.opaque = NO;
        [webview loadHTMLString:[stringHTML objectAtIndex:i] baseURL:nil];
        [self.scrollView addSubview:webview];
    }
    [self.scrollView scrollsToTop];
    if(_introtype==IntroTypeSimple){
        point.x = 320;
        point.y = 0;
        [_scrollView setContentOffset:point animated:YES];
    }else if(_introtype==IntroTypePermission){
        point.x = 0;
        point.y = 0;
        [_scrollView setContentOffset:point animated:YES];
        
    }
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * stringHTML.count, self.scrollView.frame.size.height);
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:self action:@selector(selects:)];
    self.navigationItem.rightBarButtonItem = barButton;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    

}

-(IBAction)selects:(id)sender
{


}




@end
