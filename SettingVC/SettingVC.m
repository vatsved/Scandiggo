//
//  SettingVC.m
//  Scandiggo
//
//  Created by Ganesh on 30/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "SettingVC.h"
#import "Constant.h"
#import "webviewVC.h"
@interface SettingVC ()
{
    IBOutlet UILabel *lblName;
    IBOutlet UILabel *lblNameValue;
    IBOutlet UILabel *lblContNumber;
    IBOutlet UILabel *lblContNumberValue;
    IBOutlet UILabel *lblEmail;
    IBOutlet UILabel *lblEmailValue;
    
    IBOutlet UIButton *btnTerms;
    IBOutlet UIButton *btnPrivacy;
    IBOutlet UIButton *btnLogout;

    IBOutlet NSLayoutConstraint *topTermsVIewConstraint;

    
    IBOutlet NSLayoutConstraint *topLogutConstraint;
}

@end

@implementation SettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIView appearanceWhenContainedIn:[UITabBar class], nil] setTintColor:[UIColor whiteColor]];
//    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], UITextAttributeTextColor, nil]
//                                             forState:UIControlStateNormal];
    //self.tabBarController.tabBarItem.image.tintColor=[UIColor whiteColor];
   // self.tabBarController.tabBar.tintColor=[UIColor whiteColor];
    
//    [[UITabBar appearance] setTintColor:[UIColor whiteColor]]; // for unselected items that are gray
//    [[UITabBar appearance] setSelectedImageTintColor:[UIColor whiteColor]];
    if(IS_IPHONE4)
    {
        topTermsVIewConstraint.constant=10;
        topLogutConstraint.constant=10;

    }
    else
    {
        topTermsVIewConstraint.constant=58;
        topLogutConstraint.constant=39;
    }
}

-(IBAction)btnLogoutClicked:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(IBAction)btnTermsClicked:(id)sender
{
    webviewVC *objwebviewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"webviewVC"];
    objwebviewVC.strTitle=@"Terms of Use";
    [self.navigationController pushViewController:objwebviewVC animated:YES];
}

-(IBAction)btnPravicytClicked:(id)sender
{
    webviewVC *objwebviewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"webviewVC"];
    objwebviewVC.strTitle=@"Privacy Policy";
    [self.navigationController pushViewController:objwebviewVC animated:YES];
}
@end
