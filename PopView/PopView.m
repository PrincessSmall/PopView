//
//  PopView.m
//  PopView
//
//  Created by PrinceSmall on 2019/2/17.
//  Copyright © 2019 PrinceSmall. All rights reserved.
//

#import "PopView.h"

@interface PopView ()

@property (nonatomic, strong) UIView *popShaperView;
@property (nonatomic, strong) UIButton *cancelButton;
@property (nonatomic, strong) UIButton *sureButton;

@end

@implementation PopView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.cancelButton];
        [self addSubview:self.sureButton];
        
        self.cancelButton.frame = CGRectMake(10, self.frame.size.height - 50.0, (self.frame.size.width - 30.0)/2.0, 40);
        self.sureButton.frame = CGRectMake((self.frame.size.width - 30.0)/2.0 + 20.0, self.frame.size.height - 50.0, (self.frame.size.width - 30.0)/2.0, 40);
    }
    return self;
}

/**
 显示popView

 @return popView
 */
+ (instancetype)showPopViewWithCompletion:(completeBlock)completeBlock
{
    PopView *popView = [[PopView alloc]initWithFrame:CGRectMake(100, 100, 200, 200)];
    popView.backgroundColor = UIColor.whiteColor;
    popView.layer.cornerRadius = 0.6f;
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    [keyWindow addSubview:popView.popShaperView];
    [keyWindow addSubview:popView];
    popView.center = keyWindow.center;
    
    popView.transform = CGAffineTransformScale(CGAffineTransformIdentity, CGFLOAT_MIN, CGFLOAT_MIN);
    
    [UIView animateWithDuration:0.35f animations:^{
        popView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.2, 1.2);
        popView.popShaperView.alpha = 0.5;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.25 animations:^{
            popView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        }];
    }];
    
    popView.completeBlock = completeBlock;
    
    return popView;
}

/**
 隐藏popView
 */
- (void)hidePopView
{
    [UIView animateWithDuration:0.35 animations:^{
        self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.0001, 0.0001);
        self.popShaperView.alpha = 0.0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        [self.popShaperView removeFromSuperview];
    }];
}

- (void)cancelButtonClicked
{
    [self hidePopView];
    self.completeBlock(@"点击了取消按钮", 0);
}

- (void)sureButtonClicked
{
    [self hidePopView];
    self.completeBlock(@"点击了确认按钮", 1);
}


#pragma --lazy

- (UIView *)popShaperView
{
    if (!_popShaperView) {
        _popShaperView = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _popShaperView.backgroundColor = UIColor.blackColor;
        _popShaperView.alpha = 0.0;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidePopView)];
        [_popShaperView addGestureRecognizer:tapGesture];
    }
    return _popShaperView;
}

- (UIButton *)cancelButton
{
    if (!_cancelButton) {
        _cancelButton = [[UIButton alloc]init];
        _cancelButton.backgroundColor = UIColor.redColor;
        [_cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        _cancelButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_cancelButton addTarget:self action:@selector(cancelButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelButton;
}

- (UIButton *)sureButton
{
    if (!_sureButton) {
        _sureButton = [[UIButton alloc]init];
        _sureButton.backgroundColor = UIColor.redColor;
        [_sureButton setTitle:@"确认" forState:UIControlStateNormal];
        _sureButton.titleLabel.font = [UIFont systemFontOfSize:14];
        [_sureButton addTarget:self action:@selector(sureButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}


@end
