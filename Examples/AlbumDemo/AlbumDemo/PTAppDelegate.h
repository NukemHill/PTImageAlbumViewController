//
//  PTAppDelegate.h
//  AlbumDemo
//
//  Created by Ali Servet Donmez on 16.2.12.
//  Copyright (c) 2012 Apex-net srl. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PTDemoViewController;

@interface PTAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) UINavigationController *navController;
@property (strong, nonatomic) PTDemoViewController *viewController;

@end
