//
//  SignInVC.m
//  Scandiggo
//
//  Created by Ganesh on 29/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "SignInVC.h"
#import "Constant.h"

#import "ViewController.h"

@interface SignInVC ()
{
    IBOutlet UITextField *txtEmail;
    IBOutlet UITextField *txtPassword;
    IBOutlet UIButton *btnSignIn;
    IBOutlet UIButton *btnForgotPass;

}
@end

@implementation SignInVC


- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self textRightPadding:txtEmail img:[UIImage imageNamed:@"emailicon"]];
    [self textRightPadding:txtPassword img:[UIImage imageNamed:@"password_icon"]];
    
    //[self.tabBarController.tabBar.appearance setSelectionIndicatorImage:
     //[UIImage imageNamed:@"imgSelected"]];
    //[self.tabBarController.tabBar.appearance].setSelectionIndicatorImage = [UIImage imageNamed:@"imgSelected"];
    
    [[UITabBar appearance] setSelectionIndicatorImage:
     [UIImage imageNamed:@"imgSelected"]];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /*if(IS_IPHONE5) {
        _hmVC.scrlView.contentSize = CGSizeMake(_hmVC.view.frame.size.width, _hmVC.view.frame.size.height + 20);
    }*/
    if (IS_IPHONE4)
    {
        _hmVC.scrlView.contentSize = CGSizeMake(_hmVC.view.frame.size.width, _hmVC.view.frame.size.height + 100);
    }
    
}
-(void)textRightPadding:(UITextField *)txtField img:(UIImage *)imgPadding
{
    UIImageView *imgTemp    = [[UIImageView alloc] initWithFrame:CGRectMake(0, 7, 15, 15)];;
    imgTemp.contentMode = UIViewContentModeScaleAspectFit;
    imgTemp.image           = imgPadding;
    txtField.leftView      = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 18, 20)];
    [txtField addSubview:imgTemp];
    txtField.leftViewMode  = UITextFieldViewModeAlways;
}

#pragma mark - UiText field Delegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == txtEmail) {
        [theTextField resignFirstResponder];
        [txtPassword becomeFirstResponder];
    } else if (theTextField == txtPassword) {
        [theTextField resignFirstResponder];
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if(IS_IPHONE_6 || IS_IPHONE_6Plus || IS_IPHONE5)
    {
    _hmVC.scrlView.contentSize = CGSizeMake(_hmVC.view.frame.size.width, _hmVC.view.frame.size.height);
    }
    return YES;
}

#pragma mark - button Click

-(IBAction)btnSignInClicked:(id)sender
{
}


-(IBAction)btnForgotPassClicked:(id)sender
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Alert!"
                                                                             message:@"Please enter your email id"
                                                                      preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField)
     {
         textField.placeholder = NSLocalizedString(@"Enter email address", @"Login");
         [textField addTarget:self
                       action:@selector(alertTextFieldDidChange:)
             forControlEvents:UIControlEventEditingChanged];
     }];
    
   
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", @"Cancel action")
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction *action)
                                   {
                                       NSLog(@"Cancel action");
                                   }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction *action)
                               {
                                   UITextField *login = alertController.textFields.firstObject;
                                   UITextField *password = alertController.textFields.lastObject;
                                   
                                   NSLog(@"OK action");
                                   NSLog(@"Login value: %@",login.text);
                                   NSLog(@"Password value: %@",password.text);
                               }];
    
    okAction.enabled = NO;
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];


}

#pragma mark -
#pragma mark === UITextField - UIControlEventEditingChanged ===
#pragma mark -

- (void)alertTextFieldDidChange:(UITextField *)sender
{
    UIAlertController *alertController = (UIAlertController *)self.presentedViewController;
    if (alertController)
    {
        UITextField *login = alertController.textFields.firstObject;
        UIAlertAction *okAction = alertController.actions.lastObject;
        okAction.enabled = login.text.length;
    }
}

@end
