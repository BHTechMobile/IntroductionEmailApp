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
    NSArray *stringHTML = @[FORMS_PERMISSION_HTML_CONTENT,FORMS_SIMPLE_HTML_CONTENT];
    
    self.scrollView.contentOffset = CGPointZero;
    self.scrollView.contentSize = CGSizeMake((self.view.frame.size.width- FORMS_VIEW_PADDING*2) * stringHTML.count, _scrollView.frame.size.height);
    
    for (int i = 0; i < stringHTML.count; i++) {
        UIWebView *webview = [[UIWebView alloc] initWithFrame:CGRectMake((self.view.frame.size.width- FORMS_VIEW_PADDING*2) *i, 0, (self.view.frame.size.width- FORMS_VIEW_PADDING*2), self.view.frame.size.height-40 - FORMS_VIEW_PADDING)];
        webview.contentMode = UIViewContentModeTop;
        webview.scrollView.scrollEnabled = NO;
        webview.backgroundColor = [UIColor clearColor];
        webview.opaque = NO;
        [webview loadHTMLString:[stringHTML objectAtIndex:i] baseURL:nil];
        [self.scrollView addSubview:webview];
    }
    
    
    _pageControl.numberOfPages = stringHTML.count;
    _pageControl.currentPage = _introtype;
    
    point = CGPointZero;
    if(_introtype==IntroTypeSimple){
        point.x = self.view.frame.size.width - FORMS_VIEW_PADDING * 2;
    }
    
    [_scrollView setContentOffset:point animated:NO];

    
  
}
- (IBAction)back:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

-(IBAction)selects:(id)sender{
    //TODO: action for select button
    [self performSegueWithIdentifier:@"FormsViewController" sender:nil];

}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"FormsViewController"]){
        
        ChooseContactViewController *chooseContact = (ChooseContactViewController *)[segue destinationViewController];
        
        [chooseContact setIntrotype:_introtype];
    }
}

#pragma mark - UIScrollview Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.x>=self.view.frame.size.width- FORMS_VIEW_PADDING * 2){
        _introtype = IntroTypeSimple;
    }else{
        _introtype = IntroTypePermission;
    }
    _pageControl.currentPage = _introtype;
}

@end
