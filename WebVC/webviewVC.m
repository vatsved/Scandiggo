//
//  webviewVC.m
//  Scandiggo
//
//  Created by Ganesh on 05/04/16.
//  Copyright © 2016 SP. All rights reserved.
//

#import "webviewVC.h"

@interface webviewVC ()
{
    IBOutlet UIButton *btnBack;
    IBOutlet UILabel *lblTitle;
    IBOutlet UIWebView *webView;
}

@end

@implementation webviewVC
@synthesize strTitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    lblTitle.text=strTitle;

    
//    NSString *urlAddress = @"http://www.google.com/";
//    NSURL *url = [NSURL URLWithString:urlAddress];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
//    [webView loadRequest:requestObj];
    
    NSString *myHTML = @"<html><body>Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.</body></html>";
    [webView loadHTMLString:myHTML baseURL:nil];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
}

-(IBAction)btnBackClicked:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];

}

@end
