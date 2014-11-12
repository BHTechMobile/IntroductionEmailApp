//
//  ThanksViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "ThanksViewController.h"

@interface ThanksViewController ()

@end

@implementation ThanksViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    // Do any additional setup after loading the view.
}

- (IBAction)clickExit:(id)sender {
    exit(0);
}

- (IBAction)clickRetry:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
