//
//  PreviewViewController.h
//  Intro
//
//  Created by Tommy on 11/10/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "ChooseContactViewController.h"
@interface PreviewViewController : UIViewController{
    
}

@property (nonatomic) IntroType introtype;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@end
