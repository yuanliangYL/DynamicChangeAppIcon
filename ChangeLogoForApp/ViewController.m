//
//  ViewController.m
//  ChangeLogoForApp
//
//  Created by AlbertYuan on 2021/1/5.
//

#import "ViewController.h"
#import "YLChangeAPPIcon.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.


    //api 控制被动设置icon
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [YLChangeAPPIcon changeAppIconWithIconName:@"AppiconDefault" completionHandler:^(NSError * _Nullable err) {
            NSLog(@"%@",err);
        }];
    });
}

- (IBAction)aaa:(UIButton *)sender {

    [YLChangeAPPIcon changeAppIconWithIconName:@"AppIconDoubleEleven" completionHandler:^(NSError * _Nullable err) {

    }];

}

- (IBAction)bbb:(UIButton *)sender {

    [YLChangeAPPIcon changeAppIconWithIconName:@"AppiconChristmas" completionHandler:^(NSError * _Nullable err) {

    }];
}


- (IBAction)defasetting:(UIButton *)sender {

    [YLChangeAPPIcon changeAppIconWithIconName:@"AppiconDefault" completionHandler:^(NSError * _Nullable err) {
        NSLog(@"%@",err);
    }];
}

- (IBAction)presntnView:(UIButton *)sender {

    UIAlertController *actionSheet = [UIAlertController alertControllerWithTitle:@"需要开放权限完成任务，是否开启?" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *alertT = [UIAlertAction actionWithTitle:@"开启" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        NSURL * url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        if([[UIApplication sharedApplication] canOpenURL:url]) {
            NSURL*url =[NSURL URLWithString:UIApplicationOpenSettingsURLString];
            [[UIApplication sharedApplication] openURL:url options:@{UIApplicationOpenURLOptionUniversalLinksOnly:@(NO)} completionHandler:nil];
        }
    }];

    UIAlertAction *alertF = [UIAlertAction actionWithTitle:@"放弃" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [actionSheet addAction:alertT];
    [actionSheet addAction:alertF];

    [self presentViewController:actionSheet animated:YES completion:nil];
    
}

@end
