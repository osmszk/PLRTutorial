//
//  PLRViewController.m
//  TheTutorial
//
//  Created by Osamu Suzuki on 2014/02/16.
//  Copyright (c) 2014年 Plegineer, Inc. All rights reserved.
//

#import "PLRViewController.h"

#define PAGE_COUNT 3
#define HEXCOLOR(c) [UIColor colorWithRed:((c>>16)&0xFF)/255.0 green:((c>>8)&0xFF)/255.0 blue:(c&0xFF)/255.0 alpha:1.0]

#define APP_COLOR HEXCOLOR(0x092793)
#define BG_COLOR HEXCOLOR(0xf7f6f8)

@interface PLRViewController ()<UIScrollViewDelegate>
@property (nonatomic,strong) UIScrollView *scrollView;
@end

@implementation PLRViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    self.view.backgroundColor = BG_COLOR;
    
    [_button setTitleColor:APP_COLOR forState:UIControlStateNormal];
    _pageControl.numberOfPages = PAGE_COUNT;
    _pageControl.currentPageIndicatorTintColor = APP_COLOR;
    
    CGSize displaySize = [[UIScreen mainScreen] bounds].size;
    
    UIView *statusBarBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, displaySize.width, 20)];
    statusBarBgView.backgroundColor = APP_COLOR;
    [self.view addSubview:statusBarBgView];
    
    CGSize contentSize = CGSizeMake(displaySize.width*PAGE_COUNT, displaySize.height-50-20);
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 20, displaySize.width, displaySize.height-20-50)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor whiteColor];
    scrollView.pagingEnabled = YES;
    scrollView.contentSize = contentSize;
    scrollView.bounces = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    BOOL is4inch = ([[UIScreen mainScreen] bounds].size.height == 568) ? YES : NO;
    CGFloat offsetYTitle = 0;
    CGFloat offsetYContent = 0;
    if(!is4inch){
        offsetYTitle = 22;
        offsetYContent = 88;
    }
    
    for(NSInteger i=0 ;i<PAGE_COUNT; i++){
        UIView *contentView = [[UIView alloc]initWithFrame:CGRectMake(displaySize.width*i, 0, displaySize.width, displaySize.height-50-20)];
        contentView.backgroundColor = BG_COLOR;
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, displaySize.width, 240)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"tutorial_image%d",(int)i+1]];
        [contentView addSubview:imageView];
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 270-offsetYTitle, 240, 32)];
        titleLabel.text = [NSString stringWithFormat:@"title%d",(int)(i+1)];
        titleLabel.textColor = APP_COLOR;
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont boldSystemFontOfSize:20];
        titleLabel.backgroundColor = [UIColor clearColor];
        [contentView addSubview:titleLabel];
        
        UILabel *contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(40, 312-offsetYContent, 240, 220)];
        contentLabel.text = [NSString stringWithFormat:@"AAAAAAAAAAAAAAAAA\nbbbbbbbbbbbbbbbbb\nccccccccccccccccccc\ndddddddddddddddd"];
        contentLabel.textColor = [UIColor grayColor];
        contentLabel.textAlignment = NSTextAlignmentCenter;
        contentLabel.font = [UIFont systemFontOfSize:17];
        contentLabel.numberOfLines = 5;
        contentLabel.backgroundColor = [UIColor clearColor];
        [contentView addSubview:contentLabel];
        
        [scrollView addSubview:contentView];
    }
    
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)pushedButton:(id)sender
{
    CGFloat pageWidth = _scrollView.frame.size.width;
    NSInteger currentPage = floor((_scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    NSInteger nextPage = currentPage+1;
    
    if(nextPage>=PAGE_COUNT-1){
        nextPage = PAGE_COUNT-1;
    }
    
    [_scrollView setContentOffset:CGPointMake(nextPage*pageWidth, 0.0f) animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    if(currentPage == PAGE_COUNT-1){
        [_button setTitle:@"Start" forState:UIControlStateNormal];
    }else{
        [_button setTitle:@"Next" forState:UIControlStateNormal];
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = scrollView.frame.size.width;
    NSInteger currentPage = floor((scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    _pageControl.currentPage = currentPage;
}

@end
