//
//  MMIENavigatorBar.m
//  MMIExtendingApp
//
//  Created by Alberto Lagos on 10/16/17.
//  Copyright © 2017 Alberto Lagos. All rights reserved.
//

#import "MMINavigator.h"

static NSString * const kSecondViewController = @"SecondViewController";
static NSString * const kMainStoryboard       = @"Main";
static NSString * const kAlertControllerDefaultButtonLabel       = @"Ok";

@implementation MMINavigator

#pragma mark - JSExport

+ (void)setNavigationTitle:(NSString *)aTitle {
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    if([rootViewController isKindOfClass:[UINavigationController class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            rootViewController.topViewController.navigationItem.title = aTitle;
        });
    }
}

+ (void)showDefaultAlertWithTitle:(NSString *)aTitle andMessage:(NSString *)aMessage {
    UIViewController *rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:aTitle
                                                                   message:aMessage
                                                            preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *defaultAction = [UIAlertAction actionWithTitle:kAlertControllerDefaultButtonLabel
                                                            style:UIAlertActionStyleDefault
                                                          handler:nil];
    
    [alert addAction:defaultAction];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [rootViewController presentViewController:alert animated:YES completion:nil];
    });
    
}

+ (void)pushViewController:(NSString *)aString {
    UIViewController *rootViewController = [[UIApplication sharedApplication] keyWindow].rootViewController;
    UIViewController *aViewController    = [[UIStoryboard storyboardWithName:kMainStoryboard bundle:nil] instantiateViewControllerWithIdentifier:kSecondViewController];
    
    aViewController.title = aString;
    
    if([rootViewController isKindOfClass:[UINavigationController class]]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [((UINavigationController *)rootViewController) pushViewController:aViewController animated:YES];
        });
    } else {
        dispatch_async(dispatch_get_main_queue(), ^{
            [rootViewController presentViewController:aViewController animated:YES completion:nil];
        });
    }
}

+ (void)addNavigationLeftBarButtonWithTitle:(NSString *)aTitle {
    UIBarButtonItem *left = [[UIBarButtonItem alloc] initWithTitle:aTitle
                                                             style:UIBarButtonItemStylePlain
                                                            target:nil
                                                            action:nil];
    
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        rootViewController.topViewController.navigationItem.leftBarButtonItem = left;
        
    });
    
}

+ (void)addNavigationRightBarButtonWithTitle:(NSString *)aTitle {
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithTitle:aTitle
                                                              style:UIBarButtonItemStylePlain
                                                             target:nil
                                                             action:nil];
    
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        rootViewController.topViewController.navigationItem.rightBarButtonItem = right;
    
    });
}

+ (void)removeNavigationRightBarButton {
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        rootViewController.topViewController.navigationItem.rightBarButtonItem = nil;
    });

}

+ (void)removeNavigationLeftBarButton {
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        rootViewController.topViewController.navigationItem.leftBarButtonItem = nil;
    });
}

+ (void)toggleNavigationBar {
    dispatch_async(dispatch_get_main_queue(), ^{
        UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
        [rootViewController setNavigationBarHidden:!rootViewController.isNavigationBarHidden animated:YES];
    });
}

+ (void)changeTintColorNavigationBar {
    UINavigationController *rootViewController = (UINavigationController*)[[UIApplication sharedApplication] keyWindow].rootViewController;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        rootViewController.navigationBar.barTintColor = [UIColor blueColor];
    });
}


@end
