//
//  FPSTest.m
//  JD4iPhone
//
//  Created by cuiyi on 15/11/17.
//  Copyright © 2015年 360buy. All rights reserved.
//

#import "FPSLabel.h"
#import <QuartzCore/QuartzCore.h>

#define kSize CGSizeMake(55, 20)


@implementation FPSLabel
{
    CADisplayLink * _link ;
    NSUInteger _count;
    NSTimeInterval _lastTime;
}

- (void)dealloc {
    [_link invalidate];
    _link = nil;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (frame.size.width == 0 && frame.size.height == 0) {
        frame.size = kSize;
    }
    self = [super initWithFrame:frame];
    
    self.layer.cornerRadius = 5;
    self.clipsToBounds = YES;
    self.textAlignment = NSTextAlignmentCenter;
    self.userInteractionEnabled = NO;
    self.backgroundColor = [UIColor colorWithWhite:0.000 alpha:0.700];
    self.font = [UIFont systemFontOfSize:14];
    
    _link = [CADisplayLink displayLinkWithTarget:self selector:@selector(tick:)];
    [_link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    return self;
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    
    _count++;
    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    NSLog(@"count:%ld,delta:%f,fps:%f",(unsigned long)_count,CACurrentMediaTime(),fps);
    _count = 0;
    
    CGFloat progress = fps / 60.0;
    UIColor *color = [UIColor colorWithHue:0.27 * (progress - 0.2) saturation:1 brightness:0.9 alpha:1];
    
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%.6f FPS",fps]];
    [text addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0,text.length - 3)];
    [text addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(text.length - 3, 3)];
    
    self.attributedText = text;
}

@end
