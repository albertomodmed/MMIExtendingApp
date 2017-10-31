//
//  ViewController.m
//  MMIExtendingApp
//
//  Created by Alberto Lagos on 10/16/17.
//  Copyright © 2017 Alberto Lagos. All rights reserved.
//

#import "ViewController.h"
#import "MMINavigator.h"
#import "SecondViewController.h"

@import JavaScriptCore;


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (nonatomic) JSContext *context;

@property (nonatomic) NSMutableURLRequest *request;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.translucent = NO;
    
    self.title = @"This is the title :D";
    
    [self setupJSContext];
    
    [self loadRequest];
}

#pragma mark - Setup JSContext

- (void)setupJSContext {
    self.context =  [self.webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    
    self.context[@"MMINavigator"]         = [MMINavigator class];
    
    [self.context setExceptionHandler:^(JSContext *context, JSValue *value) {
        NSLog(@"ERROR-JSCONTEXT: %@", value);
    }];

}

#pragma mark - Setup Request

- (void)loadRequest {
    //load a file
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index_demo" ofType:@"html"];
    NSURL *baseURL = [NSURL fileURLWithPath:path];
    NSString *content = [NSString stringWithContentsOfURL:baseURL encoding:NSUTF8StringEncoding error:nil];
    
    [self.webView loadHTMLString:content baseURL:baseURL];
}

@end
