//
//  SignUpVC.m
//  Scandiggo
//
//  Created by Ganesh on 29/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "SignUpVC.h"

#import "ViewController.h"

#import "Constant.h"
#import "webviewVC.h"
@interface SignUpVC (){
    IBOutlet UIButton   *btnSignup;
    IBOutlet UIButton   *btnTerms;
    IBOutlet UIButton   *btnAccept;


    IBOutlet UITextField *txtSignupName;
    IBOutlet UITextField *txtSignupContactNo;
    IBOutlet UITextField *txtSignupEmail;
    IBOutlet UITextField *txtSignupPassword;
    
    
}
@end

@implementation SignUpVC

- (void)viewDidLoad {
    [super viewDidLoad];
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
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - button Click
-(IBAction)btnSignupClicked:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

-(IBAction)btnTermsClicked:(id)sender
{
    webviewVC *objwebviewVC = [self.storyboard instantiateViewControllerWithIdentifier:@"webviewVC"];
    objwebviewVC.strTitle=@"Terms & Conditions";
    [self.navigationController pushViewController:objwebviewVC animated:YES];
}
#pragma mark - UiText field Delegate Method

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == txtSignupName) {
        [textField resignFirstResponder];
        [txtSignupContactNo becomeFirstResponder];
    } else if (textField == txtSignupContactNo) {
        [textField resignFirstResponder];
        [txtSignupEmail becomeFirstResponder];

    }
    else if (textField == txtSignupEmail) {
        [textField resignFirstResponder];
        [txtSignupPassword becomeFirstResponder];
        
    }
    else if (textField == txtSignupPassword) {
        [textField resignFirstResponder];
        
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

@end
