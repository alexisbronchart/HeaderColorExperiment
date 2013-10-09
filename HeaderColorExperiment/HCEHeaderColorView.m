//
//  HCEHeaderColorView.m
//  HeaderColorExperiment
//
//  Created by Alexis Bronchart on 08/10/13.
//  Copyright (c) 2013 Jafar. All rights reserved.
//

#import "HCEHeaderColorView.h"

@implementation HCEHeaderColorView

@synthesize positionInWindow;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(receiveNotification:)
                                                     name:@"scroll"
                                                   object:nil];
    }
    
    return self;
}

- (void) didMoveToSuperview {

    [self updateAlpha];
}

- (void) receiveNotification:(NSNotification *) notification {
    
    if ([[notification name] isEqualToString:@"scroll"]) {
        
        [self updateAlpha];
    }
}

- (void) updateAlpha {

    CGPoint frameOrigin = self.bounds.origin;
    [self setPositionInWindow:[[self window] convertPoint:frameOrigin
                                                 fromView:self]];
    
    int y = self.positionInWindow.y - self.superview.frame.origin.y;
    
    float alpha = 1. - y/300.;
    
    self.alpha = alpha;
    
    [self setNeedsDisplay];
}

- (void)dealloc {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
