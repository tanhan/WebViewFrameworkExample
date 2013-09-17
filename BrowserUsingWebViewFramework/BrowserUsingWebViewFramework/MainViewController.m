//
//  MainViewController.m
//  WebView
//
//  Created by Abdulbasıt Tanhan on 15.09.2013.
//  Copyright (c) 2013 Abdulbasıt Tanhan. All rights reserved.
//

#import "MainViewController.h"
#import <WebViewFramework/WebViewController.h>

@interface MainViewController () <UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UIView *webViewcontainer;
@property (retain, nonatomic) IBOutlet UITextField *urlTextField;

@end

@implementation MainViewController

@synthesize webViewcontainer = _webViewcontainer;
@synthesize urlTextField = _urlTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.urlTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)goButtonPressed:(id)sender {
    NSBundle* webViewbundle = [NSBundle bundleWithPath:[[NSBundle mainBundle] pathForResource:@"WebViewBundle" ofType:@"bundle"]];
    WebViewController* webVC= [[WebViewController alloc] initWithNibName:@"WebViewController" bundle:webViewbundle webPageURL:self.urlTextField.text];
    [self.webViewcontainer addSubview:webVC.view];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.urlTextField resignFirstResponder];
    [self goButtonPressed:nil];
    return NO;
}

- (void)dealloc {
    [_webViewcontainer release];
    [_urlTextField release];
    [super dealloc];
}
@end
