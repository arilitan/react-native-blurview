//
//  BlurView.m
//  SwishRN
//
//  Created by Ari Litan on 9/22/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import "RNBlurView.h"
#import "RCTConvert.h"
#import "RCTBridgeModule.h"
#import "RCTEventDispatcher.h"
#import "UIView+React.h"


@implementation RNBlurView
{
  RCTEventDispatcher *_eventDispatcher;
  NSString *_blurType;
  UIVisualEffectView *_visualEffectView;
}

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher
{
  if ((self = [super init])) {
    _eventDispatcher = eventDispatcher;
  }
  return self;
}

-(void)setBlurType:(NSString *)blurType
{
  _blurType = blurType;
  if (_visualEffectView) {
    [_visualEffectView removeFromSuperview];
  }
  
  UIBlurEffect *blurEffect;
  
  if ([blurType isEqual: @"xlight"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleExtraLight];
  } else if ([blurType isEqual: @"light"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
  } else if ([blurType isEqual: @"dark"]) {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
  } else {
    blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
  }
  
  _visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
  
  [self setNeedsLayout];
}

-(void)layoutSubviews
{
  [super layoutSubviews];
  
  _visualEffectView.frame = self.bounds;
  [self insertSubview:_visualEffectView atIndex:0];
}
@end