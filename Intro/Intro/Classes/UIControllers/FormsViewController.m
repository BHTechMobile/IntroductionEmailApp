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
    
    NSArray *stringHTML = @[FORMS_PERMISSION_HTML_CONTENT,FORMS_SIMPLE_HTML_CONTENT];
    
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
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:FORMS_SELECT_BUTTON_TITLE style:UIBarButtonItemStylePlain target:self action:@selector(selects:)];
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
