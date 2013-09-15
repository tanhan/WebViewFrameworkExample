//
//  WebViewController.m
//  WebView
//
//  Created by Abdulbasıt Tanhan on 14.09.2013.
//  Copyright (c) 2013 Abdulbasıt Tanhan. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (retain, nonatomic) IBOutlet UIWebView *webView;
@property (retain, nonatomic) NSString *url;

- (void)loadWebPageWithURL:(NSString *)url;

@end

@implementation WebViewController

@synthesize webView = _webView;
@synthesize url = _url;

- (id)initWithURL:(NSString *)webPageURL frame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.url = webPageURL;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self loadWebPageWithURL:self.url];
}

- (void)loadWebPageWithURL:(NSString *)url
{
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [self.webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_webView release];
    [_url release];
    [super dealloc];
}
@end
