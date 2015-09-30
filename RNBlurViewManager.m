//
//  RNBlurViewManager.m
//  RNBlurView
//
//  Created by Ari Litan on 9/30/15.
//  Copyright © 2015 Swish. All rights reserved.
//

#import "RNBlurViewManager.h"
#import "RCTBridge.h"
#import "RCTConvert.h"
#import <RCTView.h>
#import "RNBlurView.h"

@interface RNBlurViewManager ()

@end

@implementation RNBlurViewManager

@synthesize bridge = _bridge;

RCT_EXPORT_MODULE()

- (UIView *)view
{
  return [[RNBlurView alloc]  initWithEventDispatcher:self.bridge.eventDispatcher];
}

- (dispatch_queue_t)methodQueue
{
  return dispatch_get_main_queue();
}


RCT_EXPORT_VIEW_PROPERTY(blurType, NSString);

@end