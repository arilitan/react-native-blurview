//
//  BlurView.h
//  SwishRN
//
//  Created by Ari Litan on 9/22/15.
//  Copyright © 2015 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RCTView.h"

@class RCTEventDispatcher;

@interface RNBlurView : UIView

- (instancetype)initWithEventDispatcher:(RCTEventDispatcher *)eventDispatcher NS_DESIGNATED_INITIALIZER;

@end