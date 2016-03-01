//
//  MainViewController.m
//  RXQRCodeExample
//
//  Created by Rush.D.Xzj on 16/3/1.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXQRCode.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    imageView.image = [RXQRCode qrImageForString:@"ksfksdf" imageWidth:100];
    
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
