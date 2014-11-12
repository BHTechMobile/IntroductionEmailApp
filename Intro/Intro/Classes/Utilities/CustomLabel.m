//
//  CustomLabel.m
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

#import "CustomLabel.h"

#define FONT_NAME @"Helvetica"

@implementation CustomLabel

-(void)awakeFromNib{
    [super awakeFromNib];
    self.font = [UIFont fontWithName:FONT_NAME size:self.font.pointSize];
}

@end
