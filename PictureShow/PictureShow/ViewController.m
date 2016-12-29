//
//  ViewController.m
//  PictureShow
//
//  Created by mac on 16/12/27.
//  Copyright © 2016年 CYC. All rights reserved.
//

#import "ViewController.h"
#import "CPictureShow.h"

@interface ViewController ()

@property (strong, nonatomic) CPictureShow *pictureShow;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
}
- (IBAction)show:(id)sender {
    
    CPictureShow *showController = [[CPictureShow alloc] init];
    [self presentViewController:showController animated:YES completion:nil];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
