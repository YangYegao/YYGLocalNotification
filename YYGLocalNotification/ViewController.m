//
//  ViewController.m
//  YYGLocalNotification
//
//  Created by Jack on 16/7/22.
//  Copyright © 2016年 HaiDaFu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate = self;

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeButtonState) name:UITextFieldTextDidChangeNotification object:nil];
}

- (IBAction)setupLocalNotifiction:(id)sender {
    
    NSTimeInterval interval = [self.textField.text doubleValue] * 60;
    UILocalNotification *local = [[UILocalNotification alloc] init];
    local.fireDate = [NSDate dateWithTimeIntervalSinceNow:interval];
    local.alertBody = @"It's time to study";
    local.alertAction = @"关闭";
    local.alertTitle = @"Tips";
    local.soundName = UILocalNotificationDefaultSoundName;
    local.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:local];
    
    self.textField.text = nil;
    self.button.enabled = NO;
    [self.textField resignFirstResponder];
}


- (void)changeButtonState{
    if (self.textField.text.length > 0) {
        self.button.enabled = YES;
    }
    else{
        self.button.enabled = NO;
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
