//
//  ChooseContactViewController.h
//  Intro
//
//  Created by Tommy on 11/10/14.
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constants.h"
#import "PreviewViewController.h"

@interface ChooseContactViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *labelDetailSimple;
@property (strong, nonatomic) IBOutlet UILabel *labelDetailPermission;

@property (weak, nonatomic) IBOutlet UILabel *labelIntroSimple;

@property (weak, nonatomic) IBOutlet UILabel *labelNameSimple;
@property (weak, nonatomic) IBOutlet UILabel *labelEmailSimple;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNameSimple;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailSimple;
@property (weak, nonatomic) IBOutlet UILabel *labelNameIntro;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNamePermission;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailPermission;

@property (nonatomic) IntroType introtype;

@end
