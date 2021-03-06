//
//  HomeViewController.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:HOME_PRESS_PERMISSION_SEGUE]){
        FormsViewController *form = (FormsViewController *)[segue destinationViewController];
        [form setIntrotype:IntroTypePermission];
    } else
    if([[segue identifier] isEqualToString:HOME_PRESS_SIMPLE_SEGUE]){
        FormsViewController *form = (FormsViewController *)[segue destinationViewController];
        [form setIntrotype:IntroTypeSimple];
    }
}

@end
