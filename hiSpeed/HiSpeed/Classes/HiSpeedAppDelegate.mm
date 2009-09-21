//
//  HiSpeedAppDelegate.mm
//  HiSpeed
//
//  Created by P. Mark Anderson on 7/23/09.
//  Copyright ProxyObjects 2009. All rights reserved.
//

#import "HiSpeedAppDelegate.h"
#import "OpenFeint.h"

@implementation HiSpeedAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

	[OpenFeint initializeWithProductKey:@"L3o8bS5j3psBFn4UZJ2Dw" andSecret:@"FXnZyGIOAb0UZQIFgZBbJ8j6FWeY0EDrvJoK9sp6HI" andDisplayName:@"hiSpeed" andSettings:nil andDelegate:nil];
	
	// Override point for customization after application launch
	[window makeKeyAndVisible];
	[OpenFeint launchDashboard];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
	[OpenFeint applicationDidBecomeActive];
}

- (void)applicationWillResignActive:(UIApplication *)application {
	[OpenFeint applicationWillResignActive];
}

- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
