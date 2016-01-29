//
//  UAFPSLabel.m
//  FPSLabelTest
//
//  Created by ccguo on 16/1/27.
//  Copyright © 2016年 yangyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface FPSLabel:UILabel

@property (nonatomic,strong) CADisplayLink *displayLink;

@end

__attribute__((constructor)) static void DWURecyclingAlert(void) {
    @autoreleasepool {
        NSLog(@"startFps");
    }
}
