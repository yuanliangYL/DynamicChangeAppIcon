//
//  UIViewController+YLAbandonPresent.m
//  ChangeLogoForApp
//
//  Created by AlbertYuan on 2021/1/5.
//

#import "UIViewController+YLAbandonPresent.h"
#import <objc/runtime.h>
@implementation UIViewController (YLAbandonPresent)


//hook method
+ (void)load {

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method presentM = class_getInstanceMethod(self.class, @selector(presentViewController:animated:completion:));
        Method presentSwizzlingM = class_getInstanceMethod(self.class, @selector(lq_presentViewController:animated:completion:));

        method_exchangeImplementations(presentM, presentSwizzlingM);
    });
}

- (void)lq_presentViewController:(UIViewController *)viewControllerToPresent animated:(BOOL)flag completion:(void (^)(void))completion {

    if ([viewControllerToPresent isKindOfClass:[UIAlertController class]]) {

        NSLog(@"title : %@",((UIAlertController *)viewControllerToPresent).title);
        NSLog(@"message : %@",((UIAlertController *)viewControllerToPresent).message);

        UIAlertController *alertController = (UIAlertController *)viewControllerToPresent;
        if (alertController.title == nil && alertController.message == nil) {//没有设置title和message的直接过滤
            return;
        }
        
    }
    [self lq_presentViewController:viewControllerToPresent animated:flag completion:completion];
}



@end
