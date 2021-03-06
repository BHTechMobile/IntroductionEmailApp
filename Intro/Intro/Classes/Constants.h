//
//  Constants.h
//  Copyright (c) 2014 BHTech Mobile. All rights reserved.
//

typedef enum {
    IntroTypePermission,
    IntroTypeSimple
}IntroType;

#define SUGGESTION_VIEW_CEL_HEIGHT 25

#define HOME_PRESS_SIMPLE_SEGUE @"pushSimplePressed"
#define HOME_PRESS_PERMISSION_SEGUE @"pushPermissionPressed"
#define FORMS_VIEW_PADDING 5
#define FORMS_SELECT_BUTTON_TITLE @"Select"
#define KEYBOARD_HEIGHT 216

#define FORMS_PERMISSION_HTML_CONTENT @"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h3>Permission to Intro</h3></div><a>Hi Justin,</a><p>I hope you are well. I wanted to check to see if you'd be open to being introduced to my friend Jack. Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow. His new company seems pertty interesting - it's in the email space - and they're going to start fundraising soon.</p><p>I know he reads your blog and is a fan.</p><p>Would you be OK if made the email intro? No worries either way.</p><p>Thanks and all best,</p><p>Jeff</p></font></body></html>"
#define FORMS_SIMPLE_HTML_CONTENT @"<!DOCTYPE html><html><body><font style=\"font-family:Helvetica\" color=\"white\"><div align=\"center\"><h3>Simple Intro</h3></div><a>Hi Justin,</a><p>I wanted to introduced you to Jack. Jack is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.</p><p>I will let you both take it form here.</p><p>Best,</p><p>Jeff</p></font></body></html>"

#define EMAIL_PERMISSION_CONTENT @"Hi %@,\nI hope you are well.I wanted to check to see if you'd be open to being introduced to my friend Jack. Jack is a serial entrepreneur based in SF who I had dinner with last night.Sharp fellow.His new company seems pertty interesting- it's in the email space - and they're going to start fundraising soon\nI know he reads your blog and is a fan\nWould you be OK if made the email intro? No worries either way.\nThanks and all best,\nJeff\n"

#define EMAIL_SIMPLE_CONTENT @"Hi %@,\nI wanted to introduced you to %@. %@ is the product guru and cofounder of Square and Twitter. Based on your mutual interest in mobile payments I think it would be worthwhile for you guys to connect.\nI will let you both take it form here\nBest,"
