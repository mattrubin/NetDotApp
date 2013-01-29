//
//  NDAAuthenticationViewController.m
//  NetDotApp
//
//  Created by Me on 1/28/13.
//  Copyright (c) 2013 Matt Rubin. All rights reserved.
//

#import "NDAAuthenticationViewController.h"


@interface NDAAuthenticationViewController ()

- (void)handleRedirectURL:(NSURL*)url;
- (void)handleError:(NSError *)error;

+ (NSDictionary *)parseQueryString:(NSString*)queryString;

@end


@implementation NDAAuthenticationViewController

/*
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
 {
 self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
 if (self) {
 // Custom initialization
 }
 return self;
 }
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"ADN" ofType:@"plist"];
    NSDictionary* ADNDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    NSString *client_id = [ADNDictionary objectForKey:@"client_id"];
    //NSLog(@"Client ID: %@", client_id);
    
    ADNAuthenticationRequest *authRequest = [ADNAuthenticationRequest new];
    authRequest.clientId = client_id;
    authRequest.responseType = ADNAuthenticationResponseTypeToken;
    authRequest.redirectURI = @"netdotapp://callback";
    authRequest.scopes = ADNScopeBasic|ADNScopeFiles;
    authRequest.appStoreCompliant = YES;
    
    NSURL* authURL = authRequest.URL;
    
    //NSLog(@"%@", authURL);
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.delegate = self;
    [webView loadRequest:[NSURLRequest requestWithURL:authURL]];
    [self.view addSubview:webView];
    
}

/*
 - (void)didReceiveMemoryWarning
 {
 [super didReceiveMemoryWarning];
 // Dispose of any resources that can be recreated.
 }
 */


#pragma mark Web View Delegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([request.URL.scheme isEqualToString:@"netdotapp"]) {
        [self handleRedirectURL:request.URL];
        [webView removeFromSuperview];
        return NO;
    }
    
    return YES;
}

#pragma mark Authentication

- (void)handleRedirectURL:(NSURL*)url
{
    //NSLog(@"%@", url);
    
    NSDictionary *fragmentVars = [self.class parseQueryString:url.fragment];
    
    if ([fragmentVars objectForKey:@"error"]) {
        NSString *errorType = [[[fragmentVars objectForKey:@"error"] stringByReplacingOccurrencesOfString:@"_" withString:@" "] capitalizedString];
        NSString *errorDescription = [[fragmentVars objectForKey:@"error_description"] stringByReplacingOccurrencesOfString:@"+" withString:@" "];
        
        [self handleError:[NSError errorWithDomain:[fragmentVars objectForKey:@"error"] code:0 userInfo:[NSDictionary dictionaryWithObjectsAndKeys:errorType, NSLocalizedFailureReasonErrorKey, errorDescription, NSLocalizedDescriptionKey, nil]]];
    }
    
    if ([fragmentVars objectForKey:@"access_token"]) {
        NSLog(@"Access token: %@", [fragmentVars objectForKey:@"access_token"]);
        //NSLog(@"State: %@", [fragmentVars objectForKey:@"state"]);
        
        [[ADNClient sharedClient] setAccessToken:[fragmentVars objectForKey:@"access_token"]];
        
        [self.delegate authenticationComplete];
    }
}

- (void)handleError:(NSError *)error
{
    NSLog(@"%@: %@", error.localizedFailureReason, error.localizedDescription);
}

#pragma mark Utility

+ (NSDictionary *)parseQueryString:(NSString*)queryString
{
    NSMutableDictionary *fragmentDictionary = [NSMutableDictionary new];
    NSArray *fragmentComponents = [queryString componentsSeparatedByString:@"&"];
    
    for (NSString *keyValuePair in fragmentComponents) {
        NSArray *keyValueComponents = [keyValuePair componentsSeparatedByString:@"="];
        
        NSString *key   = [keyValueComponents objectAtIndex:0];
        NSString *value = [keyValueComponents objectAtIndex:1];
        
        [fragmentDictionary setObject:value forKey:key];
    }
    
    return fragmentDictionary;
}


@end
