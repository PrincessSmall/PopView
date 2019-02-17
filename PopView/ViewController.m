//
//  ViewController.m
//  PopView
//
//  Created by PrinceSmall on 2019/2/17.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

#import "ViewController.h"
#import "PopView.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton *showPopViewButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.showPopViewButton];
    // Do any additional setup after loading the view, typically from a nib.
}

- (UIButton *)showPopViewButton
{
    if (!_showPopViewButton) {
        _showPopViewButton = [[UIButton alloc]initWithFrame:CGRectMake(150, 150, 100, 100)];
        _showPopViewButton.backgroundColor = UIColor.grayColor;
        [_showPopViewButton addTarget:self action:@selector(showPopViewButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showPopViewButton;
}

- (void)showPopViewButtonClicked
{
    [PopView showPopViewWithCompletion:^(NSString * _Nonnull des, NSInteger i) {
        NSLog(@"点击了第%ld个按钮，描述是%@",i,des);
    }];
}


@end
