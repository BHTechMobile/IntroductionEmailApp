//
//  FormsViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "FormsViewController.h"

@interface FormsViewController ()<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation FormsViewController{
    CGPoint point;
}

-(void)loadView{
    [super loadView];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    NSArray *stringHTML = @[
                            @"<!DOCTYPE html><html><h2>Permission to Intro</h2><a>Hi Justin,</a><p>I hope you are well.I wanted to check to see if you'd be open to being introduced to my friend Jack.Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow.His new company seems pertty interesting- it's in the email space - and they're going to start fundraising soon</p><p>I know he reads your blog and is a fan</p><p>Would you be OK if made the email intro? No worries either way.</p><p>Thanks and all best,</p><p>Jeff</p></html>",
                            @"<!DOCTYPE html><html><h2>Simple Intro</h2><a>Hi Justin,</a><p>I wanted to introduced you to Jack.Jack is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.</p><p>I will let you both take it form here</p><p>Best,</p><p>Jeff</p></html>"
                            ];
    
    
    for (int i = 0; i < stringHTML.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.size = self.scrollView.frame.size;
        UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, _scrollView.frame.size.height)];
        webview.scrollView.scrollEnabled = NO;
        webview.backgroundColor = [UIColor clearColor];
        webview.opaque = NO;
        [webview loadHTMLString:[stringHTML objectAtIndex:i] baseURL:nil];
        [self.scrollView addSubview:webview];
    }

    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * stringHTML.count, self.scrollView.frame.size.height);

    _pageControl.numberOfPages = stringHTML.count;
    _pageControl.currentPage = _introtype;
    
    point = CGPointZero;
    if(_introtype==IntroTypeSimple){
        point.x = self.view.frame.size.width;
    }
    
    [_scrollView setContentOffset:point animated:NO];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Select" style:UIBarButtonItemStylePlain target:self action:@selector(selects:)];
    self.navigationItem.rightBarButtonItem = barButton;
    
}


-(IBAction)selects:(id)sender{
    //TODO: action for select button

}

#pragma mark - UIScrollview Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x>=self.view.frame.size.width){
        _introtype = IntroTypeSimple;
    }else if(_introtype==IntroTypePermission){
        _introtype = IntroTypePermission;
    }
    _pageControl.currentPage = _introtype;

}

@end
