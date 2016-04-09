//
//  ViewController.m
//  Scandiggo
//
//  Created by Ganesh on 28/03/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "ViewController.h"
#import "SignInVC.h"
#import "SignUpVC.h"

@interface ViewController ()
{
    IBOutlet UIButton *btnSignIn;
    IBOutlet UIButton *btnSignUp;
    IBOutlet UIView *signInView;
    IBOutlet UIView *signUpView;
    IBOutlet UIImageView *imgSignInTop;
    IBOutlet UIImageView *imgSignUpTop;

    
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    signUpView.alpha=0.0;
    imgSignUpTop.hidden=YES;

    // Do any additional setup after loading the view, typically from a nib.
}

-(IBAction)btnSignInClicked:(id)sender
{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         signUpView.alpha=0.0;
                         signInView.alpha=1.0;
                     } completion:nil];
    imgSignInTop.hidden=NO;
    imgSignUpTop.hidden=YES;
    
    
    
}
-(IBAction)btnSignUpClicked:(id)sender
{
    [UIView animateWithDuration:0.2
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         signUpView.alpha=1.0;
                         signInView.alpha=0.0;
                     } completion:nil];
    imgSignInTop.hidden=YES;
    imgSignUpTop.hidden=NO;

}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"SignINIdentifirea"]) {
        SignInVC  *objSIgnIn = (SignInVC *) [segue destinationViewController];
        objSIgnIn.hmVC = self;
    } else if ([segueName isEqualToString: @"SignupIdentifier"]) {
        SignUpVC  *objSignUp = (SignUpVC *) [segue destinationViewController];
        objSignUp.hmVC = self;
    }
}
@end
