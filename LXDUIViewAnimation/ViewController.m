//
//  ViewController.m
//  LXDUIViewAnimation
//
//  Created by 林欣达 on 16/1/21.
//  Copyright © 2016年 SindriLin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UITextField * userName;
@property (nonatomic, strong) UITextField * password;
@property (nonatomic, strong) UIButton * login;

@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;
@property (weak, nonatomic) IBOutlet UIView *view4;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview: self.userName];
    [self.view addSubview: self.password];
    [self.view addSubview: self.login];
}

- (void)viewDidAppear: (BOOL)animated
{
    [super viewDidAppear: animated];
    
    const CGFloat offset = CGRectGetWidth([UIScreen mainScreen].bounds);
    CGPoint accountCenter = self.userName.center;
    CGPoint passwordCenter = self.password.center;
    CGPoint startAccountCenter = CGPointMake(self.userName.center.x - offset, self.userName.center.y);
    CGPoint startPsdCenter = CGPointMake(self.password.center.x - offset, self.password.center.y);
    
    self.userName.center = startAccountCenter;
    self.password.center = startPsdCenter;
    
    [UIView animateWithDuration: 0.5 animations: ^{
        self.userName.center = accountCenter;
    } completion: nil];
    [UIView animateWithDuration: 0.5 delay: 0.35 options: UIViewAnimationOptionAutoreverse | UIViewAnimationOptionRepeat animations: ^{
        self.password.center = passwordCenter;
    } completion: ^(BOOL finished) {
        [UIView animateWithDuration: 0.2 animations: ^{
            self.login.alpha = 1;
        }];
    }];
    
    [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveEaseIn animations: ^{
        CGPoint center = _view1.center;
        center.y -= 200;
        _view1.center = center;
    } completion: nil];
    [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveEaseInOut animations: ^{
        CGPoint center = _view2.center;
        center.y -= 200;
        _view2.center = center;
    } completion: nil];
    [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveEaseOut animations: ^{
        CGPoint center = _view3.center;
        center.y -= 200;
        _view3.center = center;
    } completion: nil];
    [UIView animateWithDuration: 0.5 delay: 0 options: UIViewAnimationOptionCurveLinear animations: ^{
        CGPoint center = _view4.center;
        center.y -= 200;
        _view4.center = center;
    } completion: nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Getter
- (UITextField *)userName
{
    if (!_userName) {
        _userName = [self commonTextFieldWithPlaceholder: @"userName" size: CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 25)];
        _userName.center = CGPointMake(self.view.center.x, 200);
    }
    return _userName;
}

- (UITextField *)password
{
    if (!_password) {
        _password = [self commonTextFieldWithPlaceholder: @"password" size: CGSizeMake(CGRectGetWidth([UIScreen mainScreen].bounds) - 100, 25)];
        _password.center = CGPointMake(self.view.center.x, 250);
    }
    return _password;
}

- (UIButton *)login
{
    if (!_login) {
        _login = [[UIButton alloc] initWithFrame: CGRectMake(0, 0, 120, 30)];
        _login.backgroundColor = [UIColor colorWithRed: 233/255. green: 123/255. blue: 123/255. alpha: 1];
        [_login setTitle: @"login" forState: UIControlStateNormal];
        _login.center = CGPointMake(self.view.center.x, 300);
        _login.alpha = 0;
    }
    return _login;
}

- (UITextField *)commonTextFieldWithPlaceholder: (NSString *)placeholder size: (CGSize)size
{
    UITextField * textField = [[UITextField alloc] initWithFrame: CGRectMake(0, 0, size.width, size.height)];
    
    textField.placeholder = placeholder;
    textField.borderStyle = UITextBorderStyleRoundedRect;
    
    return textField;
}


@end
