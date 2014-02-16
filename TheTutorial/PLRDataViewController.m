//
//  PLRDataViewController.m
//  TheTutorial
//
//  Created by Osamu Suzuki on 2014/02/16.
//  Copyright (c) 2014年 Plegineer, Inc. All rights reserved.
//

#import "PLRDataViewController.h"

@interface PLRDataViewController ()

@end

@implementation PLRDataViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.dataLabel.text = [self.dataObject description];
}

@end
