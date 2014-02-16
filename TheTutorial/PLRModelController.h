//
//  PLRModelController.h
//  TheTutorial
//
//  Created by Osamu Suzuki on 2014/02/16.
//  Copyright (c) 2014年 Plegineer, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PLRDataViewController;

@interface PLRModelController : NSObject <UIPageViewControllerDataSource>

- (PLRDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(PLRDataViewController *)viewController;

@end
