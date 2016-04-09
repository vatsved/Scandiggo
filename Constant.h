//
//  Constant.h
//  Shakin
//
//  Created by Akash on 2/17/15.
//  Copyright (c) 2015 Akash. All rights reserved.


#import "AppDelegate.h"

#import "UIImageView+AFNetworking.h"

#define UIFONT_CHAT(Size)[UIFont fontWithName:@"Lato-Medium" size:((int)Size)]
#define UIFONT_CHAT_REGULER(Size)[UIFont fontWithName:@"Lato-Regular" size:((int)Size)]
#define UIFONT_CHAT_LIGHT(Size)[UIFont fontWithName:@"Lato-Light" size:((int)Size)]

#define appDelegate ((AppDelegate *)[UISharedApplication delegate])

#define UserDefault [NSUserDefaults standardUserDefaults]

#define UISharedApplication [UIApplication sharedApplication]

#define statusBarLight [UISharedApplication setStatusBarStyle:UIStatusBarStyleLightContent];
#define statusBarBlack [UISharedApplication setStatusBarStyle:UIStatusBarStyleDefault];

#define removeLoader [[CustomLoader sharedInstance] removePreloader];
#define addLoader  [[CustomLoader sharedInstance] showPreloaderWithView:self.view];

#define UIColorFromHex(rgbValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0];

#define DEVICE_HEIGHT ((int)[UIScreen mainScreen].bounds.size.height)
#define DEVICE_WIDTH ((int)[UIScreen mainScreen].bounds.size.width)

#define textFieldPadding [[UIView alloc] initWithFrame:CGRectMake(txtUname.frame.size.width-10, 0, 15, 20)];

#define textRightImg [[UIImageView alloc] initWithFrame:CGRectMake(txtUname.frame.size.width-18, 7, 15, 15)];

#define appColor UIColorFromHex(0xe2017b)

#define UIColorRGB(r,g,b,a) [UIColor colorWithRed:52/255.0 green:121/255.0 blue:81/255.0 alpha:a]

#define clrBorder UIColorRGB(224.0,224.0,224.0,1.0)

#define CBorderColor(view,clr,width) \
{\
view.layer.borderWidth = width;\
view.layer.borderColor = clr.CGColor;\
}

#define CCornerRadius(view,radius) \
{\
view.layer.masksToBounds = YES;\
view.layer.cornerRadius = radius;\
}

#define ShowAlert( msg ) \
{\
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Shakin" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];\
[alert show];\
}

#define AlertWithButton(aMessage,strOk,strCancel,tag1,aTitle) \
{\
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:aTitle message:aMessage delegate:self cancelButtonTitle:strCancel otherButtonTitles:strOk, nil];\
alert.tag = [tag1 intValue];\
[alert show];\
}

static inline BOOL isEmpty(id thing)
{
    if (thing == nil)
    {
        return YES;
    }
    else if ([thing isKindOfClass:[NSNull class]])
    {
        return YES;
    }
    else if ([thing isKindOfClass:[NSData class]])
    {
        if ([(NSData *)thing length] == 0)
        {
            return YES;
        }
    }
    else if ([thing isKindOfClass:[NSArray class]])
    {
        if ([(NSArray *)thing copy] == 0)
        {
            return YES;
        }
    }
    else if ([thing isKindOfClass:[NSString class]])
    {
        if ([[(NSString *)thing stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0)
        {
            return YES;
        }
    }
    return NO;
}

#define IS_IOS8 ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0)

#define IS_IPHONE5 ([[UIScreen mainScreen] bounds].size.height == 568.0f) ? TRUE : FALSE
#define IS_IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480.0f) ? TRUE : FALSE
#define IS_IPHONE_6 ((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height == 667.0f))
#define IS_IPHONE_6Plus ((UI_USER_INTERFACE_IDIOM()==UIUserInterfaceIdiomPhone) && ([[UIScreen mainScreen ] bounds].size.height == 736.0f))


