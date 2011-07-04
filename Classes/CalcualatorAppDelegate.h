//
//  CalcualatorAppDelegate.h
//  Calcualator
//
//  Created by M.S.GOVINDANKUTTY KUTTY on 5/20/11.
//  Copyright 2011 AWROSTAMANI. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CalcualatorViewController;

@interface CalcualatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    CalcualatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet CalcualatorViewController *viewController;

@end

