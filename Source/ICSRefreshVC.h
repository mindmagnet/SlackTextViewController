//
//  ICSCollectionViewRefreshVC.h
//  INSPullToRefresh
//
//  Created by Mandea Daniel on 22.02.2015.
//  Copyright (c) 2015 Mindmagnet All rights reserved.
//

#import "INSBaseViewController.h"

@interface ICSRefreshVC : INSBaseViewController


#pragma mark - Set completion 

- (void)setupInfinitScrollForScrollView:(UIScrollView * __nonnull)scrollView
                            withHeight:(CGFloat)height
                            completion:(INSInfinityScrollActionHandler __nonnull)completionHandeler;

- (void)setupPullToRefreshForScrollView:(UIScrollView * __nonnull)scrollView
                             withHeight:(CGFloat)height
                             completion:(INSPullToRefreshActionHandler __nonnull)completionHandeler;

#pragma mark - Helper methods

/**
 * Use this method  to call all needed setup for the controller
 */
- (void)setupController;

@end
