//
//  ViewController.m
//  FPSLabelTest
//
//  Created by yangyi on 16/1/12.
//  Copyright © 2016年 yangyi. All rights reserved.
//

#import "ViewController.h"
#import "FPSLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
//    void DWURecyclingAlert();
    
    FPSLabel * label = [[FPSLabel alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [self.view addSubview:label];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
