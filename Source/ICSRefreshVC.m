//
//  ICSRefreshVC.h
//  INSPullToRefresh
//
//  Created by Mandea Daniel on 22.02.2015.
//  Copyright (c) 2015 Mindmagnet All rights reserved.
//

#import "ICSRefreshVC.h"

@interface ICSRefreshVC ()


@end

@implementation ICSRefreshVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Setup the controller 
    [self setupController];
}

#pragma mark - Helper classes

- (void)setupController {
    // Set the pull to refresh syle of the controller
    self.style = INSPullToRefreshStyleDefault;
}

- (void)setupInfinitScrollForScrollView:(UIScrollView *)scrollView
                             withHeight:(CGFloat)height
                             completion:(INSInfinityScrollActionHandler)completionHandeler {
    // Setup pull to refresh
    [scrollView ins_addInfinityScrollWithHeight:height handler:completionHandeler];
    
    UIView <INSAnimatable> *infinityIndicator = [self infinityIndicatorViewFromCurrentStyle];
    [scrollView.ins_infiniteScrollBackgroundView addSubview:infinityIndicator];
    [infinityIndicator startAnimating];
    
    scrollView.ins_infiniteScrollBackgroundView.preserveContentInset = NO;
    
    if (self.style == INSPullToRefreshStylePreserveContentInset) {
        scrollView.ins_infiniteScrollBackgroundView.preserveContentInset = YES;
    }
}

- (void)setupPullToRefreshForScrollView:(UIScrollView *)scrollView
                             withHeight:(CGFloat)height
                             completion:(INSPullToRefreshActionHandler)completionHandeler {
    
    if (self.style == INSPullToRefreshStylePreserveContentInset) {
        scrollView.contentInset = UIEdgeInsetsMake(100.0f, 0.0f, 100.0f, 0.0f);
    }
    
    [scrollView ins_addPullToRefreshWithHeight:height handler:completionHandeler];
    
    scrollView.ins_pullToRefreshBackgroundView.preserveContentInset = NO;
    if (self.style == INSPullToRefreshStylePreserveContentInset) {
        scrollView.ins_pullToRefreshBackgroundView.preserveContentInset = YES;
    }
    
    if (self.style == INSPullToRefreshStyleText) {
        scrollView.ins_pullToRefreshBackgroundView.dragToTriggerOffset = 60.0;
    }
    
    UIView <INSPullToRefreshBackgroundViewDelegate> *pullToRefresh = [self pullToRefreshViewFromCurrentStyle];
    scrollView.ins_pullToRefreshBackgroundView.delegate = pullToRefresh;
    [scrollView.ins_pullToRefreshBackgroundView addSubview:pullToRefresh];
    
    if (self.style == INSPullToRefreshStyleText) {
        pullToRefresh.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        pullToRefresh.translatesAutoresizingMaskIntoConstraints = YES;
        pullToRefresh.frame = scrollView.ins_pullToRefreshBackgroundView.bounds;
        
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.style == INSPullToRefreshStyleText) {
        if (scrollView.contentOffset.y <= -200) {
            scrollView.contentOffset = CGPointMake(scrollView.contentOffset.x, -200);
        }
    }
}



@end
