//
//  PLRViewController.h
//  TheTutorial
//
//  Created by Osamu Suzuki on 2014/02/16.
//  Copyright (c) 2014年 Plegineer, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PLRViewController : UIViewController

@property (nonatomic,weak) IBOutlet UIButton *button;
@property (nonatomic,weak) IBOutlet UIPageControl *pageControl;
- (IBAction)pushedButton:(id)sender;

@end
