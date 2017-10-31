//
//  MMIENavigatorBar.h
//  MMIExtendingApp
//
//  Created by Alberto Lagos on 10/16/17.
//  Copyright © 2017 Alberto Lagos. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;
@import JavaScriptCore;

@protocol MMINavigatorExport <JSExport>

+ (void)setNavigationTitle:(NSString *)aTitle;
+ (void)showDefaultAlertWithTitle:(NSString *)aTitle andMessage:(NSString *)aMessage;
+ (void)pushViewController:(NSString *)aString;
+ (void)addNavigationLeftBarButtonWithTitle:(NSString *)aTitle;
+ (void)addNavigationRightBarButtonWithTitle:(NSString *)aTitle;
+ (void)removeNavigationRightBarButton;
+ (void)removeNavigationLeftBarButton;
+ (void)toggleNavigationBar;
+ (void)changeTintColorNavigationBar;

@end

@interface MMINavigator : NSObject <MMINavigatorExport>

@end
