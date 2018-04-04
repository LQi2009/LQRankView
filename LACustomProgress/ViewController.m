//
//  ViewController.m
//  LACustomProgress
//
//  Created by LiuQiqiang on 2018/3/30.
//  Copyright © 2018年 LiuQiqiang. All rights reserved.
//

#import "ViewController.h"
#import "LQRankView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor purpleColor];
    // 方式一
    LQRankView *rank = [[LQRankView alloc]init];
    rank.frame = CGRectMake(20, 100, self.view.frame.size.width - 40, 30);
    rank.ranks = @[@"LV1", @"0/300", @"LV2", @"0/300", @"LV3"];
    
    [self.view addSubview:rank];
    
    //方式二
    LQRankView *rank1 = [LQRankView rankViewWithFrame:CGRectMake(20, 200, self.view.frame.size.width - 40, 40) ranks:@[@"LV1", @"0/300", @"LV2", @"0/300", @"LV3"] color:[UIColor whiteColor] font:[UIFont boldSystemFontOfSize:12]];
    
    rank1.style = LQRankViewStyleRing;
    [self.view addSubview:rank1];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
